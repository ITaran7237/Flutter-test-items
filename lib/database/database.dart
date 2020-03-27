import 'dart:async';

import 'package:first_flutter_app/database/dao/artist_dao.dart';
import 'package:first_flutter_app/database/entity/artist.dart';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Artist])
abstract class AppDatabase extends FloorDatabase {
  ArtistDao get artistDao;
}