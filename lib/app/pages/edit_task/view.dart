import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo/app/pages/todays_task/view.dart';

import '../../utils/app_color.dart';
import '../model /todomodel.dart';
import '../task_add/logic.dart';
import '../widgets/boxes.dart';

class EditTask extends StatefulWidget {
  final String taskId;

  const EditTask({
    Key? key,
    required this.taskId,
  }) : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  // final String taskId = EditTask(taskId).taskId;

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TaskNameLogic());
    final state = Get
        .find<TaskNameLogic>()
        .state;

    void _showTimePicker() {
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      ).then((value) =>
      {
        setState(() {
          logic.state.timeOfDay = value!;
        })
      });
    }

    var targetTask = boxTodoModel.get("key_" + widget.taskId) as TodoModel;
    print(targetTask.Taskname);

    void updateTask(TodoModel task) {
      boxTodoModel.delete("key_" + widget.taskId);
      boxTodoModel.add(task);
    }

    // void e(index) {
    //   boxTodoModel.getAt(index);
    // }

    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/todaytask/Component 14.svg"),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Design todo list",
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
                                        "I shoud Design todo list today,Tick the done options",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: AppColor.TextGereyNew,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 8),
                                Stack(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/todaytask/Group 2.svg",
                                    ),
                                    SvgPicture.asset(
                                      "assets/todaytask/tick-24.svg",
                                    ),
                                  ],
                                ),
                                SizedBox(width: 6),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "10:00 am",
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      "05:00 pm",
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
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/todaytask/Component 14.svg"),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Design todo list",
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
                                        "I shoud Design todo list today,Tick the done options",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: AppColor.TextGereyNew,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/todaytask/Group 2.svg",
                                    ),
                                  ],
                                ),
                                SizedBox(width: 6),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "10:00 am",
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      "05:00 pm",
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
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 230,
              child: SvgPicture.asset(
                "assets/todaytask/Line 3.svg",
              ),
            ),
            Positioned(
              bottom: 200,
              child: Container(
                width: 320,
                height: 30,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/todaytask/entypo_chevron-down.svg",
                    ),
                    Spacer(),
                    Text(
                      "done tasks (2)",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.BlackText,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 76,
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
                    child: SvgPicture.asset(
                      "assets/todaytask/ic_baseline-plus (2).svg",
                    ),
                  ),
                ),
              ),
            ),

            //edit code
            //edit code
            //edit code

            Positioned(
              top: 190,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 7, sigmaX: 7),
                child: Container(
                  width: 260,
                  height: 279,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17, top: 21),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "edit task",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: AppColor.BlackText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17, top: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "edit task",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: AppColor.TextCountainerBlur,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 36),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 97,
                              height: 32,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor.TextCountainerBlur,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        targetTask.CreateDate!.minute
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                          color: AppColor.TextGereyShades,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        color: AppColor.TextGereyShades,
                                      ),
                                    ),
                                    Spacer(),
                                    Expanded(
                                      child: Text(
                                        targetTask.CreateDate!.hour.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                          color: AppColor.TextGereyShades,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "from",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: AppColor.TextGereyShades,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      // title
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                _showTimePicker();
                              },
                              child: Container(
                                width: 97,
                                height: 32,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.TextCountainerBlur,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${logic.state.timeOfDay.minute}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                            color: AppColor.TextGereyShades,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          ":",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                            color: AppColor.TextGereyShades,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${logic.state.timeOfDay.hour}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                            color: AppColor.TextGereyShades,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "till",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: AppColor.TextGereyShades,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 26),
                      Row(
                        children: [
                          SizedBox(
                            width: 18,
                          ),
                          MaterialButton(
                            onPressed: () {
                              targetTask.CreateDate = DateTime(2023, 12, 5,
                                  logic.state.timeOfDay.hour,
                                  logic.state.timeOfDay.minute);


                              Get.to(TodaysTask());

                              //4 update target task ...//
                              updateTask(targetTask);
                            },
                            child: Text(
                              "ok",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColor.BlueTextNew,
                              ),
                            ),
                          ),
                          SizedBox(width: 24),
                          MaterialButton(
                            onPressed: () {
                              Get.to(TodaysTask());
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColor.BlueTextNew,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
