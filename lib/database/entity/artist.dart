import 'package:floor/floor.dart';

@entity
class Artist {
  @primaryKey
  final int id;

  final String name;
  final String type;

  Artist(this.id, this.name, this.type);
}