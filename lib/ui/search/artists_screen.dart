import 'package:first_flutter_app/bloc/search/artists_bloc.dart';
import 'package:first_flutter_app/bloc/search/artists_event.dart';
import 'package:first_flutter_app/bloc/search/artists_state.dart';
import 'package:first_flutter_app/models/artists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class ArtistsScreen extends StatefulWidget {
  @override
  _ArtistsScreenState createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  ArtistsBloc artistsBloc;

  @override
  void initState() {
    super.initState();
    artistsBloc = context.bloc<ArtistsBloc>();
  }

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
            onPressed: () => _searchText(_emailController.text),
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

  _searchText(String text) {
    _emailFocusNode.unfocus();
    text.isNotEmpty
        ? artistsBloc.add(GetArtists(text))
        : Toast.show("Please enter your text", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
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
          return _initListView(state.results);
        } else if (state is ArtistsToDBSaved) {
          if (state.isSuccessful) {
            return Container();
          }
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
