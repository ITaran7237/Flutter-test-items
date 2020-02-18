import 'package:flutter/material.dart';

import 'tasks/ex_3.dart';

main() {

//  startEx1();

//  startEx2();

  runApp(Container());
  startEx3();
}

extension StringExtensions on String {
  bool get isValidName {
    return RegExp(r"^[a-zA-Z]").hasMatch(this) && this.length <= 20;
  }

  bool get isPlusOne {
    return this.contains("+one");
  }
}