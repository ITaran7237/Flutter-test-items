import 'package:equatable/equatable.dart';
import 'package:first_flutter_app/models/artists.dart';

abstract class ArtistsState extends Equatable {
  const ArtistsState();
}

class ArtistsInitial extends ArtistsState {
  @override
  List<Object> get props => [];
}

class Loading extends ArtistsState {
  @override
  List<Object> get props => [];
}

class ArtistsLoaded extends ArtistsState {
  final List<Results> results;

  ArtistsLoaded(this.results) : super();

  @override
  List<Object> get props => [results];
}

class ArtistsToDBSaved extends ArtistsState {
  final bool isSuccessful;

  ArtistsToDBSaved(this.isSuccessful) : super();

  @override
  List<Object> get props => [isSuccessful];
}

class HistoryLoaded extends ArtistsState {
  final List<Results> results;

  HistoryLoaded(this.results) : super();

  @override
  List<Object> get props => [results];
}