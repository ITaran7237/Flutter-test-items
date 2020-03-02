import 'dart:async';

import 'package:first_flutter_app/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  final _eventStateController = StreamController<CounterEvent>();

  CounterBloc() {
    _eventStateController.stream.listen(_mapEventToState);
  }

  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  Sink<CounterEvent> get counterEventSink => _eventStateController.sink;

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      _counter++;
    else
      _counter--;
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _eventStateController.close();
  }
}