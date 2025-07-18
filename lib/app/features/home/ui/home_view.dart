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
  @override
  void initState() {
    super.initState();
    ListenerView(
      viewModel: context.read<HomeViewModel>(),
    ).listener(context: context, successCallback: (viewModel, listenerView) {
    });
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cripto App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/favoritas');
        },
        child: const Icon(Icons.star),
      ),
      drawer: const HomeDrawer(),
      body: Center(
        child: Column(
          children: [
            TextField(),
            Expanded(
              child: Observer(
                builder: (context) {
                  return ListView.builder(
                    itemCount: context.read<HomeViewModel>().coinMarketList.length,
                    itemBuilder: (_, index) {
                      final coin = context.read<HomeViewModel>().coinMarketList[index];
                      return ListTile(
                        title: Text(coin.name),
                        onTap: () {
                          // Handle item tap
                        },
                      );
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
