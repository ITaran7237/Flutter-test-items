import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Video',
            style: TextStyle(color: Colors.white, fontSize: 40.0)),
      ),
      backgroundColor: Color(0xFF404B60),
    );
  }
}