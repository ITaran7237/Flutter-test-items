import 'package:first_flutter_app/models/lesson_model.dart';
import 'package:flutter/material.dart';

class LessonDetails extends StatelessWidget {
  LessonDetails({Key key, this.data}) : super(key: key);

  final LessonModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          fetchBottomData(),
          fetchTopData(context),
          arrowBack(context)
        ],
      ),
    );
  }

  Positioned arrowBack(BuildContext context) {
    return Positioned(
      left: 16,
      top: 50,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }

  Container fetchTopData(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/bg_driving.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: getTopContent(),
    );
  }

  Container fetchBottomData() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Text(data.lessonContent,
                style: TextStyle(color: Colors.black, fontSize: 16)),
          ),
          SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.all(30),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text('Take this lesson'.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              color: Color(0xff475168),
              onPressed: () => print('Take this lesson'),
            ),
          ),
        ],
      ),
    );
  }

  Padding getTopContent() {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 110),
          Hero(
            tag: data.icon,
            child: Icon(data.icon, color: Colors.white, size: 30),
          ),
          Container(width: 50, child: Divider(color: Colors.yellowAccent)),
          Hero(
            tag: data.title,
            child: Material(
              color: Colors.transparent,
              child: Text(data.title,
                  style: TextStyle(color: Colors.white, fontSize: 40)),
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: showIndicator(),
              ),
              Expanded(
                  flex: 6,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(data.level,
                          style: TextStyle(color: Colors.white)))),
              Expanded(
                flex: 1,
                child: showPrice(),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container showPrice() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5)),
      child: Text("\$${data.price}", style: TextStyle(color: Colors.white)),
    );
  }

  ClipRRect showIndicator() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 8,
        width: 32,
        child: LinearProgressIndicator(
          value: data.indicator,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
          backgroundColor: Color(0xFF575B7C),
        ),
      ),
    );
  }
}
