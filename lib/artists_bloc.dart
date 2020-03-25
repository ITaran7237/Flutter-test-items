import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:first_flutter_app/artists_event.dart';
import 'package:first_flutter_app/artists_state.dart';
import 'package:first_flutter_app/models/artists.dart';

class ArtistsBloc extends Bloc<ArtistsEvent, ArtistsState> {
  @override
  ArtistsState get initialState => ArtistsInitial();

  @override
  Stream<ArtistsState> mapEventToState(ArtistsEvent event) async* {
    if (event is GetArtists) {
      yield ArtistsLoading();
      final artists = await _fetchArtistsFromApi();
      yield ArtistsLoaded(artists);
    }else if(event is StartSearching){
      bool isSearching = false;
      yield ArtistSearching(!isSearching);
    }
  }

  Future<List<Results>> _fetchArtistsFromApi() async {
    var response = await Dio().get("https://tastedive.com/api/similar");
    var results = jsonDecode(response.toString());
    var artists = Artists.fromJson(results);
    return artists.similar.results;
  }
}