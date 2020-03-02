import 'package:first_flutter_app/models/lesson_model.dart';
import 'package:first_flutter_app/ui/lesson/lesson_details.dart';
import 'package:first_flutter_app/ui/profile/profile.dart';
import 'package:flutter/material.dart';

void main() => runApp(DrivingLesson());

class DrivingLesson extends StatefulWidget {
  @override
  _DrivingLessonState createState() => _DrivingLessonState();
}

class _DrivingLessonState extends State<DrivingLesson> {
  List _list;
  int _cIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white))),
      home: Scaffold(
        backgroundColor: Color(0xFF3A4256),
        bottomNavigationBar: _bottomNavigationBar(context),
        appBar: _appBar,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _list.length,
              itemBuilder: (BuildContext context, int index) =>
                  _createCard(context, _list[index])),
        ),
      ),
    );
  }

  @override
  void initState() {
    _list = _mockDataLessons();
    super.initState();
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _cIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff3B4256),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.yellow,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: getNavigationItem(),
      onTap: _onTabTapped(context),
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

  void _onTabTapped(BuildContext context, [int index]) {
    setState(() {
      _cIndex = index;
      handleNavigationItem(context);
    });
  }

  void handleNavigationItem(BuildContext context) {
    switch (_cIndex) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }

  final _appBar = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text('Lessons'),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 10, right: 8),
        child: IconButton(
          icon: Icon(
            Icons.sort,
            color: Colors.white,
          ),
          onPressed: () => {},
        ),
      ),
    ],
  );

  Card _createCard(BuildContext context, LessonModel lesson) => Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(60, 60, 60, 1)),
          child: _createItem(context, lesson),
        ),
      );

  _createItem(BuildContext context, LessonModel lesson) {
    return Container(
        color: Color(0xFF404B60),
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LessonDetails(data: lesson)));
          },
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(lesson.icon, color: Colors.white),
            ],
          ),
          title: Text(lesson.title,
              style: TextStyle(color: Colors.white, fontSize: 16)),
          subtitle: Row(
            children: <Widget>[
              _progressIndicator(lesson),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child:
                    Text(lesson.level, style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward, color: Colors.white),
        ));
  }

  ClipRRect _progressIndicator(LessonModel lesson) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 8,
        width: 32,
        child: LinearProgressIndicator(
          value: lesson.indicator,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
          backgroundColor: Color(0xFF575B7C),
        ),
      ),
    );
  }

  List _mockDataLessons() {
    return [
      LessonModel(
          icon: Icons.directions_car,
          title: "Introduction to Driving",
          level: "Beginner",
          indicator: 0.3,
          price: 20,
          lessonContent:
              "We recommend that you take a series of driving lessons with an AA Driving Instructor.  Our experience shows that only taking a single lesson before a test is unlikely to provide you with the skills and confidence necessary to pass the test."),
      LessonModel(
          icon: Icons.beach_access,
          title: "Observation at Junction",
          level: "Beginner",
          indicator: 0.4,
          price: 55,
          lessonContent:
              "We recommend that you take a series of driving lessons with an AA Driving Instructor.  Our experience shows that only taking a single lesson before a test is unlikely to provide you with the skills and confidence necessary to pass the test."),
      LessonModel(
          icon: Icons.account_balance,
          title: "Reverse Parallel Parking",
          level: "Intermidiate",
          indicator: 0.66,
          price: 30,
          lessonContent:
              "We recommend that you take a series of driving lessons with an AA Driving Instructor.  Our experience shows that only taking a single lesson before a test is unlikely to provide you with the skills and confidence necessary to pass the test."),
      LessonModel(
          icon: Icons.speaker_notes_off,
          title: "Observation at Junction",
          level: "Reversing Around Corner",
          indicator: 0.75,
          price: 40,
          lessonContent:
              "We recommend that you take a series of driving lessons with an AA Driving Instructor.  Our experience shows that only taking a single lesson before a test is unlikely to provide you with the skills and confidence necessary to pass the test."),
      LessonModel(
          icon: Icons.restaurant,
          title: "Incorrect Use of Signals",
          level: "Advanced",
          indicator: 1.0,
          price: 90,
          lessonContent:
              "We recommend that you take a series of driving lessons with an AA Driving Instructor.  Our experience shows that only taking a single lesson before a test is unlikely to provide you with the skills and confidence necessary to pass the test."),
      LessonModel(
          icon: Icons.map,
          title: "Reverse Parallel Parking",
          level: "Advanced",
          indicator: 0.9,
          price: 60,
          lessonContent:
              "We recommend that you take a series of driving lessons with an AA Driving Instructor.  Our experience shows that only taking a single lesson before a test is unlikely to provide you with the skills and confidence necessary to pass the test."),
      LessonModel(
          icon: Icons.directions,
          title: "Reversing Around Corner",
          level: "Advanced",
          indicator: 1.0,
          price: 80,
          lessonContent:
              "We recommend that you take a series of driving lessons with an AA Driving Instructor.  Our experience shows that only taking a single lesson before a test is unlikely to provide you with the skills and confidence necessary to pass the test."),
      LessonModel(
          icon: Icons.restaurant,
          title: "Incorrect Use of Signals",
          level: "Advanced",
          indicator: 1.0,
          price: 90,
          lessonContent:
              "We recommend that you take a series of driving lessons with an AA Driving Instructor.  Our experience shows that only taking a single lesson before a test is unlikely to provide you with the skills and confidence necessary to pass the test."),
    ];
  }
}
