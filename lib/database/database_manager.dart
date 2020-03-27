import 'package:first_flutter_app/database/dao/artist_dao.dart';
import 'package:first_flutter_app/database/database.dart';

class DatabaseManager extends AppDatabase {
  static AppDatabase _appDatabase;
  static final DatabaseManager _internal = DatabaseManager.internal();

  factory DatabaseManager() {
    return _internal;
  }

  DatabaseManager.internal();

  static AppDatabase get appDatabase => _appDatabase;

  static AppDatabase initDatabase(AppDatabase database) {
    if (_appDatabase == null) {
      _appDatabase = database;
    }
    return _appDatabase;
  }

  @override
  ArtistDao get artistDao => _appDatabase.artistDao;
}