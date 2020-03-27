import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:first_flutter_app/artists_event.dart';
import 'package:first_flutter_app/artists_state.dart';
import 'package:first_flutter_app/database/database_manager.dart';
import 'package:first_flutter_app/database/entity/artist.dart';
import 'package:first_flutter_app/models/artists.dart';
import 'package:first_flutter_app/net/ApiProvider.dart';

class ArtistsBloc extends Bloc<ArtistsEvent, ArtistsState> {
  final apiProvider = ApiProvider();

  @override
  ArtistsState get initialState => ArtistsInitial();

  @override
  Stream<ArtistsState> mapEventToState(ArtistsEvent event) async* {
    if (event is GetArtists) {
      yield Loading();
      final artists = await apiProvider.fetchArtistsFromApi(event.text);
      yield ArtistsLoaded(artists);
    }else if(event is SaveArtists){
      yield Loading();
      final isSavedToDb = await _insertToDb(event.result);
      print(isSavedToDb);
      yield ArtistsToDBSaved(isSavedToDb);
    }
  }

  Future<bool> _insertToDb(List<Results> artistsList) async{
//    await DatabaseManager().artistDao.deleteAllArtists();
    List<Artist> artists = artistsList.map((obj) => Artist(null, obj.name, obj.type)).toList();
    print(">> $artists");
    await DatabaseManager().artistDao.insertArtist(artists);
  }
}