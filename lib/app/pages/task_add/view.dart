import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo/app/pages/home/logic.dart';
import 'package:todo/app/pages/widgets/boxes.dart';
import 'package:todo/app/pages/todays_task/view.dart';
import 'package:todo/app/utils/app_color.dart';
import 'package:uuid/uuid.dart';

import '../Select_Category/view.dart';
import '../model /todomodel.dart';
import 'logic.dart';

class TaskAdd extends StatefulWidget {
  const TaskAdd({super.key});

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  final logic = Get.put(TaskNameLogic());
  final state = Get.find<TaskNameLogic>().state;

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) => {
          setState(() {
            logic.state.timeOfDay = value!;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Transform.scale(
                  scale: 1.2,
                  origin: Offset(-500, 70),
                  child: SvgPicture.asset(
                    "assets/todaytask/Ellipse 11.svg",
                    width: 380,
                    height: 532,
                  ),
                ),
                Positioned(
                  left: 15,
                  child: Transform.scale(
                    scale: 1.2,
                    origin: Offset(80.0, 90.0),
                    child: Container(
                      height: 205.0,
                      width: 235.0,
                      child: SvgPicture.asset(
                        "assets/home/Ellipse 9.svg",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 9),
                      Container(
                        width: 366,
                        height: 32,
                        child: Row(
                          children: [
                            Spacer(),
                            Text(
                              "Today’s task",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 58),
                            MaterialButton(
                              onPressed: () {
                                Get.to(TodaysTask());
                              },
                              child: SvgPicture.asset(
                                "assets/todaytask/bx_arrow-back.svg",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 280,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 34,
                                  right: 16,
                                  top: 8,
                                  bottom: 8,
                                ),
                                child: TextField(
                                  controller: logic.state.cotrollerTaskName,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Task name",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.TextGereyShades,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 17),
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 280,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 34,
                                  right: 16,
                                  top: 8,
                                  bottom: 8,
                                ),
                                child: TextField(
                                  controller:
                                      logic.state.cotrollerTaskDescription,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Task Description",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.TextGereyShades,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 148,
                          ),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                _showTimePicker();
                              });
                            },
                            child: Container(
                              width: 63,
                              height: 20,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${logic.state.timeOfDay.hour}:${logic.state.timeOfDay.minute}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: AppColor.Black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 1),
                                  SvgPicture.asset(
                                    "assets/todaytask/Vector (46).svg",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 122),
                          MaterialButton(
                            onPressed: () {
                              Get.to(SelecteCategory());
                            },
                            child: Container(
                              width: 149,
                              height: 25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Set Category",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: AppColor.Black,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  SvgPicture.asset(
                                    "assets/todaytask/Category-1.svg",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 120),
            MaterialButton(
              onPressed: () {
                Get.to(TodaysTask());
                setState(() {
                  final dateTime = DateTime(2023, 12, 5,
                      logic.state.timeOfDay.hour, logic.state.timeOfDay.minute);
                  print(dateTime);
                  var id = Uuid().v4();
                  var z = TodoModel(
                      Taskname: logic.state.cotrollerTaskName.text,
                      Description: logic.state.cotrollerTaskDescription.text,
                      CreateDate: dateTime,
                      IsCompleted: false,
                      Id: id,
                      categoryId: logic.state.categoryId);
                  print(z.categoryId);
                  boxTodoModel.put(
                    'key_${id}',
                    // '${logic.state.cotrollerTaskDescription.text}',
                    z,
                  );
                });
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(56),
                  ),
                  color: AppColor.BorderColor,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Container(
                    width: 32,
                    height: 32,
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/todaytask/Tick-1.svg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
