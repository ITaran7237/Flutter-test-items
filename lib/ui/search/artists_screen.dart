import 'package:first_flutter_app/artists_bloc.dart';
import 'package:first_flutter_app/artists_event.dart';
import 'package:first_flutter_app/artists_state.dart';
import 'package:first_flutter_app/models/artists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistsScreen extends StatefulWidget {
  @override
  _ArtistsScreenState createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  var _emailController = TextEditingController();
  List<Results> _list;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: TextField(
              controller: _emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hoverColor: Colors.white),
            ),
          ),
          RaisedButton(
            onPressed: () => _changeText(_emailController.text),
            child: Text("Search"),
          ),
          Container(
            child: Expanded(
              child: _handleArtistsState(),
            ),
          ),
        ],
      ),
    );
  }

  _changeText(String text) {
    setState(() {
      final artistsBloc = BlocProvider.of<ArtistsBloc>(context);
      text.isNotEmpty ? artistsBloc.add(GetArtists(text)) : text;
      print('text = $text');
    });
  }

  _changeText2(List<Results> results) {
    setState(() {
      final artistsBloc = BlocProvider.of<ArtistsBloc>(context);
      artistsBloc.add(SaveArtists(results));
      print('text = $results');
    });
  }

  BlocBuilder<ArtistsBloc, ArtistsState> _handleArtistsState() {
    return BlocBuilder<ArtistsBloc, ArtistsState>(
      // ignore: missing_return
      builder: (BuildContext context, ArtistsState state) {
        if (state is ArtistsInitial) {
          return _buildInitialInput();
        } else if (state is Loading) {
          return _buildLoading();
        } else if (state is ArtistsLoaded) {
          _changeText2(state.results);
          return _initListView(state.results);
        } else if (state is ArtistsToDBSaved) {
          if (state.isSuccessful) {
            print("Save to db Success");
          } else {
            print("Save to db Success = NULL");
          }
        }
      },
    );
  }

  Padding _initListView(List<Results> results) {
    _list = results;
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _list == null ? 0 : _list.length,
          itemBuilder: (BuildContext context, int index) =>
              _createCard(context, _list[index])),
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
