import 'package:first_flutter_app/counter_event.dart';
import 'package:flutter/material.dart';

import 'counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<int>(
                  stream: counterBloc.counter,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data.toString()}',
                      style: TextStyle(fontSize: 100.0),
                    );
                  }),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () =>
                  counterBloc.counterEventSink.add(IncrementEvent()),
              child: Icon(Icons.add),
            ),
            SizedBox(width: 16.0),
            FloatingActionButton(
              onPressed: () =>
                  counterBloc.counterEventSink.add(DecrementEvent()),
              child: Icon(Icons.remove),
            )
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    counterBloc.dispose();
  }
}
