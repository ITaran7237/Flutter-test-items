import 'package:first_flutter_app/artists_bloc.dart';
import 'package:first_flutter_app/bloc.dart';
import 'package:first_flutter_app/models/artists.dart';
import 'package:first_flutter_app/ui/history/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MusicalArtists());

class MusicalArtists extends StatelessWidget {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF3A4256),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: !isSearching
            ? Text('Search')
              : TextField(
          onChanged: (value) {
    },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: "Search Country Here",
          hintStyle: TextStyle(color: Colors.white)),
    ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () => {
                    this.isSearching = true
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => History())),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: BlocProvider(
          create: (BuildContext context) => ArtistsBloc(),
          child: ArtistsScreen(),
        ),
      ),
    );
  }
}

class ArtistsScreen extends StatelessWidget {
  List<Results> _list;

  @override
  Widget build(BuildContext context) {
    final artistsBloc = BlocProvider.of<ArtistsBloc>(context);
    artistsBloc.add(GetArtists());
    return Center(child: _handleArtistsState());
  }

  BlocBuilder<ArtistsBloc, ArtistsState> _handleArtistsState() {
    return BlocBuilder<ArtistsBloc, ArtistsState>(
      // ignore: missing_return
      builder: (BuildContext context, ArtistsState state) {
        if (state is ArtistsInitial) {
          return _buildInitialInput();
        } else if (state is ArtistsLoading) {
          return _buildLoading();
        } else if (state is ArtistsLoaded) {
          return _initListView(state.results);
        }
      },
    );
  }

  Padding _initListView(List<Results> results) {
    _list = results;
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
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
