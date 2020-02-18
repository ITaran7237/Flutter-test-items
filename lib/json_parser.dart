import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<String> _loadGuestsFromAssets() {
  return rootBundle.loadString('lib/assets/files/guest.json');
}

Future loadGuests() async {
  String jsonString = await _loadGuestsFromAssets();
  var guests = jsonDecode(jsonString);
  return guests;
}