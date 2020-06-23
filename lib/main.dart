import 'package:first_flutter_app/database/database.dart';
import 'package:first_flutter_app/database/database_manager.dart';
import 'package:first_flutter_app/ui/history/history.dart';
import 'package:first_flutter_app/ui/search/search.dart';
import 'package:first_flutter_app/util/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

enum ResultScreen { Search, History }

void main() async {
  runApp(MusicalArtists());
  final database =
  await $FloorAppDatabase.databaseBuilder('floor_database.db').build();
  DatabaseManager.initDatabase(database);
  Stetho.initialize();
}

class MusicalArtists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Search.routeName,
      routes: <String, WidgetBuilder>{
        Search.routeName: (context) => Search(),
        History.routeName: (context) => History(),
      },
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}