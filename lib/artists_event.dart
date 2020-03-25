import 'package:equatable/equatable.dart';

abstract class ArtistsEvent extends Equatable {
  const ArtistsEvent();
}

class GetArtists extends ArtistsEvent {
  @override
  List<Object> get props => [];
}

class StartSearching extends ArtistsEvent{
  @override
  List<Object> get props => null;
}