import 'dart:io';

import '../main.dart' show StringExtensions;

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
  var result = await getTotalSum(guestCont);
  print("Total = ${result * 100}\$ ");
}

int getTotalSum(int count) {
  var totalPerson = count + 2;
  if (totalPerson == 13) totalPerson++;
  return totalPerson;
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