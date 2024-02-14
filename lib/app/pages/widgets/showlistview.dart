import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../../utils/app_color.dart';
import '../add_task/view.dart';
import '../model /todomodel.dart';
import 'boxes.dart';

class ShowListViewTask extends StatefulWidget {
  String? timeone;
  String? timetow;
  String? title;
  String? descriptions;

  @override
  State<ShowListViewTask> createState() => _ShowListViewTaskState();
}

class _ShowListViewTaskState extends State<ShowListViewTask> {
  void onDeleteTask(int index) {
    boxTodoModel.deleteAt(index);
    return;
  }

  void showDialogCustom(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            content: Container(
              width: 102,
              height: 80,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Align(
                    child: Container(
                      width: 150,
                      height: 69,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 113,
                                    height: 25,
                                    color: AppColor.BorderColor,
                                    child: Expanded(
                                      child: Row(
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              Get.to(AddTask());
                                            },
                                            child: Text(
                                              "add subtasks",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "edit tasks",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: AppColor.TextBlackHeader,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    onDeleteTask(0);
                                  },
                                  child: Text(
                                    'delete tasks',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.TextBlackHeader,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 328,
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
                SizedBox(width: 93),
                SvgPicture.asset(
                  "assets/todaytask/bx_arrow-back.svg",
                ),
              ],
            ),
          ),
          SizedBox(height: 35),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ValueListenableBuilder<Box>(
                valueListenable: boxTodoModel.listenable(),
                builder: (context, box, widget) {
                  return ListView.builder(
                      itemCount: boxTodoModel.length,
                      itemBuilder: (context, index) {
                        TodoModel todomodel = boxTodoModel.getAt(index);
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 3),
                          child: Row(
                            children: [
                              Container(
                                width: 328,
                                height: 69,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              showDialogCustom(context);
                                            },
                                            child: SvgPicture.asset(
                                                "assets/todaytask/Component 14.svg"),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            todomodel.Taskname!,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                              color: AppColor.BlackText,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Container(
                                            width: 130,
                                            child: Text(
                                              todomodel.Description!,
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                fontSize: 8,
                                                color: AppColor.TextGereyShades,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 8),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isCheck = !isCheck;
                                              });
                                            },
                                            child: AnimatedContainer(
                                              width: 24,
                                              height: 24,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve:
                                                  Curves.fastLinearToSlowEaseIn,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: AppColor.TextGereyNew,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(24),
                                                ),
                                              ),
                                              child: isCheck
                                                  ? SvgPicture.asset(
                                                      "assets/todaytask/tick-24.svg")
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 6),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            DateFormat('jm')
                                                .format(todomodel.CreateDate!),
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Text(
                                            "05:00 PM",
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }),
          )
          // height: 50,
        ],
      ),
    );
  }
}
