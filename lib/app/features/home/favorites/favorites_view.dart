import 'package:app_cripto/app/core/ui/helpers/notifier/listener_view.dart';
import 'package:app_cripto/app/features/home/favorites/favorites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
    ListenerView(
      viewModel: context.read<FavoritesViewModel>(),
    ).listener(context: context, successCallback: (viewModel, listenerView) {});

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoritesViewModel>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moedas favoritas'),
      ),

      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Observer(
                builder: (context) {
                  return ListView.separated(
                    itemCount: context
                        .read<FavoritesViewModel>()
                        .coinMarketFavoritesList
                        .length,
                    separatorBuilder: (_, index) {
                      return const Divider(height: 1);
                    },
                    itemBuilder: (_, index) {
                      final coin = context
                          .read<FavoritesViewModel>()
                          .coinMarketFavoritesList[index];
                      return ListTile(
                        title: Row(
                          children: [
                            IconButton(
                              onPressed: () => context
                                  .read<FavoritesViewModel>()
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
