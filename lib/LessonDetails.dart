import 'package:flutter/material.dart';

class LessonDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        fetchBottomData(),
        fetchTopData(context),
        arrowBack(context)
      ],
    );
  }

  final topContent = Padding(
    padding: EdgeInsets.only(left: 40.0, right: 40.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 110.0),
        Icon(Icons.directions_car, color: Colors.white, size: 30.0),
        Container(width: 50.0, child: Divider(color: Colors.yellowAccent)),
        Text(
          'Introduction \nto Driving',
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
        SizedBox(height: 50.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: LinearProgressIndicator(
                  backgroundColor: Color.fromRGBO(200, 200, 200, 0.2),
                  value: 42.0,
                  valueColor: AlwaysStoppedAnimation(Colors.yellow)),
            ),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Begginer',
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text("\$20", style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ],
    ),
  );

  Positioned arrowBack(BuildContext context) {
    return Positioned(
      left: 16.0,
      top: 50.0,
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
      child: topContent,
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
            padding: EdgeInsets.only(left: 40.0, right: 40.0),
            child: Text(
                'Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty '
                'Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty '
                'Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty '
                'Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty '
                'Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty '
                'Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty '
                'Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty '
                'Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty '
                'Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty '
                'Qwerty Qwerty Qwerty Qwerty Qwerty Qwerty ',
                style: TextStyle(color: Colors.black)),
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text('Take this lesson'.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              color: Color(0xff475168),
              onPressed: () => print('Take this lesson'),
            ),
          ),
        ],
      ),
    );
  }
}