import 'package:equatable/equatable.dart';
import 'package:first_flutter_app/models/artists.dart';

abstract class ArtistsState extends Equatable {
  const ArtistsState();
}

class ArtistsInitial extends ArtistsState {
  @override
  List<Object> get props => [];
}

class ArtistsLoading extends ArtistsState {
  @override
  List<Object> get props => [];
}

class ArtistsLoaded extends ArtistsState {
  final List<Results> results;

  ArtistsLoaded(this.results) : super();

  @override
  List<Object> get props => [results];
}

class ArtistSearching extends ArtistsState {
  bool isSearching;

  ArtistSearching(this.isSearching) : super();

  @override
  List<Object> get props => [isSearching];
}
