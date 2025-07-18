import 'package:app_cripto/app/core/database/sql_connection_factory.dart';
import 'package:flutter/widgets.dart';

class SqlAdmConnection with WidgetsBindingObserver {
  final connection = SqlConnectionFactory();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        connection.closeConnection();
        break;
      case AppLifecycleState.hidden:
    }
  }
}
