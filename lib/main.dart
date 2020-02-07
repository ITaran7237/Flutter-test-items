import 'dart:async';
import 'dart:io';

import 'package:first_flutter_app/guests.dart';
import 'package:flutter/material.dart';

import 'json_parser.dart';

//TestEx1
main() {
//  startEx1();

//  startEx2();

  runApp(Container());
  startEx3();
}

// Ex1
void startEx1() {
  int guestCont = 0;
  int marshalLilly = 2;
  int priceForPerson = 100;
  print('Enter the number of friends Marshall and Lily ...');
  int guestCount = int.parse(stdin.readLineSync());
  print('Enter guest names ...');
  for (int i = 1; i <= guestCount; i++) {
    guestCont = checkGuests(guestCont);
  }
  var totalPerson = guestCont + marshalLilly;
  if (totalPerson == 13) totalPerson++;
  print("Total = ${totalPerson * priceForPerson}\$");
}

// Ex2
void startEx2() {
  print('Enter the number of friends Marshall and Lily ...');
  Future<int> future = Future(() => int.parse(stdin.readLineSync()));
  future.then((guestCount) {
    print('Enter guest names ...');
    getNames(guestCount);
  });
}

void getNames(int guestCount) async {
  int guestCont = 0;
  for (int i = 1; i <= guestCount; i++) {
    guestCont = checkGuests(guestCont);
  }
  var result = await getTotalSum(guestCount);
  print("Total = ${result * 100}\$ ");
}

int checkGuests(int guestCont) {
  String guestName = stdin.readLineSync();

  if (guestName.isValidName) {
    guestCont++;
    if (guestName.isPlusOne) guestCont++;
  } else {
    print("Sorry, your name is not valid");
  }
  return guestCont;
}

int getTotalSum(int count) {
  var totalPerson = count + 2;
  if (totalPerson == 13) totalPerson++;
  return totalPerson;
}

// Ex3
void startEx3() async {
  var guests = await loadGuests();
  Restaurant restaurant = Restaurant.fromJson(guests);
  getNames2(restaurant);
}

void getNames2(Restaurant restaurant) async {
  int guestCont = getCount(restaurant);
  var result = await getTotalSum2(guestCont);
  print("Total = ${result * 100}\$ ");
}

int getCount(Restaurant restaurant) {
  int guestCont = 0;
  for (final i in restaurant.guests) {
    if (i.name.isValidName) {
      guestCont++;
      if (i.pair.isPlusOne) guestCont++;
    } else {
      print("Sorry, your name is not valid");
    }
  }
  return guestCont;
}

int getTotalSum2(int count) {
  var totalPerson = count + 2;
  if (totalPerson == 13) totalPerson++;
  return totalPerson;
}

extension StringExtensions on String {
  bool get isValidName {
    return RegExp(r"^[a-zA-Z]").hasMatch(this) && this.length <= 20;
  }

  bool get isPlusOne {
    return this.contains("+one");
  }
}