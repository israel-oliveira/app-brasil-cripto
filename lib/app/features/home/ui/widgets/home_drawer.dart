import 'package:app_cripto/app/core/auth/app_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/logo.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Brasil Cripto',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Sair'),
            onTap: () {
              context.read<AppAuthProvider>().logout();
            },
          ),
        ],
      ),
    );
  }
}
