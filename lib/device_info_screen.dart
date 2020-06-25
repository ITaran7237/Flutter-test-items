import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceInfoScreen extends StatefulWidget {
  @override
  _DeviceInfoScreenState createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  static const platform = const MethodChannel('deviceId');
  String _deviceId = 'Unknown device id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Platform Specific')),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Get Device Id'),
              onPressed: () => _getDeviceId(),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Device Id: '),
                  Text(_deviceId, style: TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getDeviceId() async {
    String deviceId;
    try {
      dynamic result = await platform.invokeMethod('getDeviceId');
      deviceId = result;
    } on PlatformException catch (e) {
      deviceId = "Failed to get device id: '${e.message}'.";
    }
    setState(() {
      _deviceId = deviceId;
    });
  }
}
