import 'package:first_flutter_app/device_info_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Platform Specific',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DeviceInfoScreen(),
    );
  }
}