import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_color.dart';

class TaskNameState {
  final cotrollerTaskName = TextEditingController();
  final cotrollerTaskDescription = TextEditingController();
  int categoryId = 0;
  var time = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay(hour: 00, minute: 00);
  bool value = false;
  List<String> nameList = [
    'school',
    'work',
    'shop',
    'read',
    'work out',
    'gym',
  ];
  List<String> Image = [
    "assets/home/school.svg",
    "assets/home/work.svg",
    "assets/home/shopping.svg",
    "assets/home/book.svg",
    "assets/home/workout.svg",
    "assets/home/book.svg",
  ];
  List<Color> colorCategory = [
    AppColor.BrownCountainer,
    AppColor.DarkGreenCountainer,
    AppColor.CyanCountainer,
    AppColor.BlueDarkCountainer,
    AppColor.GreenCountainer,
    AppColor.BorderMenu,
  ];
}
