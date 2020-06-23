import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:first_flutter_app/database/database_manager.dart';
import 'package:first_flutter_app/models/artists.dart';

import './bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  @override
  HistoryState get initialState => InitialHistoryState();

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is GetArtistsFromDB) {
      yield Loading();
    List<Results> history = await _getHistoryFromDB();
    yield HistoryLoaded(history);
    }
  }

  Future<List<Results>> _getHistoryFromDB() async {
    var results = await DatabaseManager().artistDao.findAllArtist();
    List<Results> listResults =
    results.map((obj) => Results(name: obj.name, type: obj.type)).toList();
    return listResults;
  }
}