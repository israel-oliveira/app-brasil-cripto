import 'package:app_cripto/app/core/enum/app_state_enum.dart';
import 'package:app_cripto/app/core/ui/helpers/notifier/listener_view.dart';
import 'package:app_cripto/app/features/home/ui/home_view_model.dart';
import 'package:app_cripto/app/features/home/ui/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ListenerView(
      viewModel: context.read<HomeViewModel>(),
    ).listener(context: context, successCallback: (viewModel, listenerView) {});

    _scrollController.addListener(_infiniteScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().load();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _infiniteScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !context.read<HomeViewModel>().state.isLoading) {
      context.read<HomeViewModel>().infiniteScrollLoad();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cripto App'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('/favoritas');
        },
        icon: const Icon(Icons.star),
        label: const Text('Favoritos'),
      ),
      drawer: const HomeDrawer(),
      body: Center(
        child: Column(
          children: [
            TextField(),
            Expanded(
              child: Observer(
                builder: (context) {
                  return ListView.separated(
                    controller: _scrollController,
                    itemCount: context
                        .read<HomeViewModel>()
                        .coinMarketList
                        .length,
                    separatorBuilder: (_, index) {
                      return const Divider(height: 1);
                    },
                    itemBuilder: (_, index) {
                      final coin = context
                          .read<HomeViewModel>()
                          .coinMarketList[index];
                      return ListTile(
                        title: Row(
                          children: [
                            IconButton(
                              onPressed: () => context
                                  .read<HomeViewModel>()
                                  .updateFavorities(coin),
                              icon: Icon(
                                Icons.star,
                                color: coin.isFavorite
                                    ? Colors.yellow
                                    : Colors.grey,
                              ),
                            ),
                            ClipOval(
                              child: Image.network(
                                coin.imageUrl,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox.square(dimension: 20),
                            Expanded(
                              child: Text(
                                coin.name,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Text(
                              '%${coin.priceChangePercentage24h.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: coin.priceChangePercentage24h < 0
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                            SizedBox.square(dimension: 10),
                            Text(
                              coin.symbol.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          // Handle item tap
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
