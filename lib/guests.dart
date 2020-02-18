class Guests {
  String name;
  int age;
  String pair;

  Guests(this.name, this.age, this.pair);

  factory Guests.fromJson(dynamic json) {
    return Guests(
        json['name'] as String, json['age'] as int, json['pair'] as String);
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.age}, ${this.pair} }';
  }
}

class Restaurant {
  int guestCount;
  List<Guests> guests;

  Restaurant(this.guestCount, [this.guests]);

  factory Restaurant.fromJson(dynamic json) {
    if (json['guests'] != null) {
      var guestsObjsJson = json['guests'] as List;
      List<Guests> _guests =
          guestsObjsJson.map((tagJson) => Guests.fromJson(tagJson)).toList();
      return Restaurant(json['guestCount'] as int, _guests);
    } else {
      return Restaurant(json['guestCount'] as int);
    }
  }

  @override
  String toString() {
    return '{ ${this.guestCount}, ${this.guests} }';
  }
}