import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Price',
            style: TextStyle(color: Colors.white, fontSize: 40.0)),
      ),
      backgroundColor: Color(0xFF404B60),
    );
  }
}