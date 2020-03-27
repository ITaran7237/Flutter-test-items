import 'package:equatable/equatable.dart';
import 'package:first_flutter_app/models/artists.dart';

abstract class ArtistsEvent extends Equatable {
  const ArtistsEvent();
}

class GetArtists extends ArtistsEvent {
  final String text;

  GetArtists(this.text) : super();

  @override
  List<Object> get props => [text];
}

class SaveArtists extends ArtistsEvent {
  final List<Results> result;

  SaveArtists(this.result) : super();

  @override
  List<Object> get props => null;
}