import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Price',
            style: TextStyle(color: Colors.white, fontSize: 30.0)),
      ),
      backgroundColor: Color.fromRGBO(200, 200, 200, 0.2),
    );
  }
}
