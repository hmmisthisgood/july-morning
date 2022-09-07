import 'package:flutter/cupertino.dart';

class Env extends InheritedWidget {
  final String baseUrl;
  final String apiKey;
  final Widget child;
  Env({required this.baseUrl, required this.apiKey, required this.child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static Env of(BuildContext context) {
    final env = context.dependOnInheritedWidgetOfExactType<Env>();
    return env!;
  }
}
