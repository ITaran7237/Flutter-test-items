import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: Center(
        child: Text('Video',
            style: TextStyle(color: Colors.white, fontSize: 30.0)),
      ),
      backgroundColor: Color.fromRGBO(200, 200, 200, 0.2),
    );
  }
}
