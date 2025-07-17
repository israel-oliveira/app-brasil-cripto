import 'package:app_cripto/app/core/modules/app_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

abstract class AppModule {
final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  AppModule({
    required Map<String, WidgetBuilder> routers,
    List<SingleChildWidget>? bindings,
  }) : _routers = routers,
       _bindings = bindings;

  Map<String, WidgetBuilder> get routers => _routers.map(
    (key, pageBuilder) => MapEntry(
      key,
      (_) => AppPage(
        page: pageBuilder,
        bindings: _bindings,
      ),
    ),
  );
}