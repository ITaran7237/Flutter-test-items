import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('books').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading...');
            default:
              return Scaffold(
                body: Center(
                  child: Text(
                      snapshot.data.documents[0].data.values.elementAt(0),
                      style: TextStyle(color: Colors.white, fontSize: 40.0)),
                ),
                backgroundColor: Color.fromRGBO(200, 200, 200, 0.2),
              );
          }
        });
  }
}