import 'package:first_flutter_app/ui/lesson/lesson.dart';
import 'package:first_flutter_app/ui/price/price.dart';
import 'package:first_flutter_app/ui/profile/profile.dart';
import 'package:first_flutter_app/ui/video/video.dart';
import 'package:flutter/material.dart';

void main() => runApp(DrivingLesson());

class DrivingLesson extends StatefulWidget {
  @override
  _DrivingLessonState createState() => _DrivingLessonState();
}

class _DrivingLessonState extends State<DrivingLesson> {
  int index = 0;

  final List<Widget> _children = [Lesson(), Video(), Price(), Profile()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF3A4256),
        bottomNavigationBar: _bottomNavigationBar(),
        appBar: _appBar,
        body: _children[index],
      ),
    );
  }

  final _appBar = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text('Lessons'),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: IconButton(
          icon: Icon(Icons.sort, color: Colors.white),
          onPressed: () => {},
        ),
      ),
    ],
  );

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff3B4256),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.yellow,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: getNavigationItem(),
      onTap: _onTabTapped,
    );
  }

  List<BottomNavigationBarItem> getNavigationItem() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.content_paste), title: Text('')),
      BottomNavigationBarItem(
          icon: Icon(Icons.ondemand_video), title: Text('')),
      BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on), title: Text('')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('')),
    ];
  }

  _onTabTapped(int index) {
    setState(() {
      this.index = index;
    });
  }
}
