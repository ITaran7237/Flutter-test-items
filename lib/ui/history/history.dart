import 'package:first_flutter_app/bloc/history/bloc.dart';
import 'package:first_flutter_app/bloc/history/history_bloc.dart';
import 'package:first_flutter_app/ui/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class History extends StatefulWidget {
  static const String routeName = "/history";

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A4256),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("History"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, History.routeName),
          ),
        ],
      ),
      body: BlocProvider(
        create: (BuildContext context) => HistoryBloc(),
        child: HistoryScreen(),
      ),
    );
  }
}