import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:first_flutter_app/bloc/search/artists_event.dart';
import 'package:first_flutter_app/bloc/search/artists_state.dart';
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
      await _insertToDb(artists);
      yield ArtistsLoaded(artists);
    }
  }

  Future<bool> _insertToDb(List<Results> artistsList) async {
//    await DatabaseManager().artistDao.deleteAllArtists();
    List<Artist> artists =
        artistsList.map((obj) => Artist(null, obj.name, obj.type)).toList();
    print(">> $artists");
    await DatabaseManager().artistDao.insertArtist(artists);
    return true;
  }
}
