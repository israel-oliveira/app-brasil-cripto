import 'package:app_cripto/app/core/auth/app_auth_provider.dart';
import 'package:app_cripto/app/features/home/ui/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
        child: TextButton(
          onPressed: () => context.read<AppAuthProvider>().logout(),
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
