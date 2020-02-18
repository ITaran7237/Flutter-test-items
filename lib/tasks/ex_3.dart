import '../guests.dart';
import '../json_parser.dart';
import '../main.dart' show StringExtensions;

void startEx3() async {
  var guests = await loadGuests();
  Restaurant restaurant = Restaurant.fromJson(guests);
  getNames(restaurant);
}

void getNames(Restaurant restaurant) async {
  int guestCont = getCount(restaurant);
  var result = getTotalSum2(guestCont);
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
