import 'package:flutter/material.dart';

class History extends StatelessWidget {
  static const String routeName = "/history";

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
            icon: Icon(Icons.history, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}