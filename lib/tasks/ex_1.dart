import 'dart:io';

import '../main.dart' show StringExtensions;

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