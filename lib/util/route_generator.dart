import 'package:first_flutter_app/ui/history/history.dart';
import 'package:first_flutter_app/ui/search/search.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Search.routeName:
        return MaterialPageRoute(builder: (_) => Search());
        break;
      case History.routeName:
        return MaterialPageRoute(builder: (_) => History());
        break;
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
