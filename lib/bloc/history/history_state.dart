import 'package:equatable/equatable.dart';
import 'package:first_flutter_app/models/artists.dart';

abstract class HistoryState extends Equatable {}

class InitialHistoryState extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistoryLoaded extends HistoryState {
  final List<Results> results;

  HistoryLoaded(this.results) : super();

  @override
  List<Object> get props => [results];
}

class Loading extends HistoryState {
  @override
  List<Object> get props => [];
}
