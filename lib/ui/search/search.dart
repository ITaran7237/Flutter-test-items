import 'package:first_flutter_app/bloc/search/artists_bloc.dart';
import 'package:first_flutter_app/ui/history/history.dart';
import 'package:first_flutter_app/ui/search/artists_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A4256),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Search"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, History.routeName),
          ),
        ],
      ),
      body: BlocProvider(
        create: (BuildContext context) => ArtistsBloc(),
        child: ArtistsScreen(),
      ),
    );
  }
}
