import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:random_words/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(),
        body: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  BodyWidgetState createState() => BodyWidgetState();
}

class BodyWidgetState extends State<BodyWidget> {
  String serverResponse = '';
  var amountWords = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('Send post request'),
                  onPressed: () {
                    _makePostRequest();
                  }),
              RaisedButton(
                  child: Text('Send get request'),
                  onPressed: () {
                    _makeGetRequest();
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(serverResponse, style: TextStyle(fontSize: 24.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _makePostRequest() async {
    String url = _localhost();
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await post(url, headers: headers, body: _getRandomWords());
    print('TRN.makePostRequest  ${response.statusCode}');
  }

  _makeGetRequest() async {
    Response response = await get(_localhost() + '$amountWords');
    setState(() {
      serverResponse = response.body;
    });
  }

  String _getRandomWords() {
    var words = List();
    for (var i = 0; i < amountWords; i++)
      words.add(generateNoun().take(1).join(""));
    return jsonEncode(words);
  }

  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:4040/';
    else
      return 'http://localhost:4040/';
  }
}
