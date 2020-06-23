import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable{}

class GetArtistsFromDB extends HistoryEvent {
  @override
  List<Object> get props => null;
}