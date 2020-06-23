import 'package:first_flutter_app/bloc/history/bloc.dart';
import 'package:first_flutter_app/models/artists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryBloc _historyBloc;

  @override
  void initState() {
    super.initState();
    _historyBloc = context.bloc<HistoryBloc>();
    _historyBloc.add(GetArtistsFromDB());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: _handleHistoryState(),
          ),
        ),
      ],
    );
  }

  BlocBuilder<HistoryBloc, HistoryState> _handleHistoryState() {
    return BlocBuilder<HistoryBloc, HistoryState>(
      // ignore: missing_return
      builder: (BuildContext context, HistoryState state) {
        if (state is InitialHistoryState) {
          return _buildInitialInput();
        } else if (state is Loading) {
          return _buildLoading();
        } else if (state is HistoryLoaded) {
          return _initListView(state.results);
        }
      },
    );
  }

  Padding _initListView(List<Results> results) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: results.length,
          itemBuilder: (BuildContext context, int index) =>
              _createCard(context, results[index])),
    );
  }

  Widget _buildInitialInput() {
    return Center(
      child: Center(),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Card _createCard(BuildContext context, Results data) => Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(60, 60, 60, 1)),
          child: _createItem(context, data),
        ),
      );

  _createItem(BuildContext context, Results data) {
    return Container(
        color: Color(0xFF404B60),
        child: ListTile(
          title: Center(
            child: Text(data.name,
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          subtitle: Center(
            child: Text(data.type, style: TextStyle(color: Colors.white)),
          ),
        ));
  }
}
