import 'package:flutter/widgets.dart';

import 'app_controller.dart';

class AppScope extends InheritedWidget {
  const AppScope({super.key, required this.controller, required super.child});

  final AppController controller;

  static AppController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'AppScope was not found in the widget tree.');
    return scope!.controller;
  }

  @override
  bool updateShouldNotify(AppScope oldWidget) =>
      controller != oldWidget.controller;
}
