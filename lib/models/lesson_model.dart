import 'package:flutter/material.dart';

class LessonModel {
  IconData icon;
  String title;
  String level;
  double indicator;
  int price;
  String lessonContent;

  LessonModel(
      {this.icon,
      this.title,
      this.level,
      this.indicator,
      this.price,
      this.lessonContent});
}