import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todo/app/pages/home/view.dart';
import 'package:todo/app/pages/widgets/boxes.dart';
import 'package:todo/app/pages/model%20/todomodel.dart';
import 'package:todo/app/utils/app_color.dart';

import '../add_task/view.dart';
import '../edit_task/view.dart';
import '../task_add/logic.dart';
import '../task_add/view.dart';

class TodaysTask extends StatefulWidget {
  const TodaysTask({super.key});

  @override
  State<TodaysTask> createState() => _TodaysTaskState();
}

class _TodaysTaskState extends State<TodaysTask> {
  void onDeleteTask(String _id) {
    boxTodoModel.delete("key_" + _id);
    return;
  }

  int getDoneCounts() {
    var allTasks = boxTodoModel.listenable().value.values;
    return allTasks.where((task) => task.IsCompleted).length;
  }

  void showDialogCustom(BuildContext context, String id) {
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
                                MaterialButton(
                                  onPressed: () {
                                    Get.to(EditTask(taskId: id));
                                    print("hi: $id");
                                  },
                                  child: Text(
                                    "edit tasks",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.TextBlackHeader,
                                    ),
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
                                    setState(() {
                                      onDeleteTask(id);
                                    });
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

  final logic = Get.put(TaskNameLogic());
  final state = Get.find<TaskNameLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    origin: Offset(150.0, 90.0),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            SizedBox(width: 30),
                            MaterialButton(
                              onPressed: () {
                                Get.to(HomeScrean());
                              },
                              child: SvgPicture.asset(
                                "assets/todaytask/bx_arrow-back.svg",
                              ),
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
                                    TodoModel todomodel =
                                        boxTodoModel.getAt(index);
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 3,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 330,
                                            height: 69,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(16),
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 17),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      MaterialButton(
                                                        onPressed: () {
                                                          showDialogCustom(
                                                              context,
                                                              todomodel.Id ??
                                                                  "");
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        todomodel.Taskname!,
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: AppColor
                                                              .BlackText,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Container(
                                                        width: 130,
                                                        child: Text(
                                                          todomodel
                                                              .Description!,
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: TextStyle(
                                                            fontSize: 8,
                                                            color: AppColor
                                                                .TextGereyShades,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 10),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            todomodel
                                                                    .IsCompleted =
                                                                !todomodel
                                                                    .IsCompleted!;
                                                            boxTodoModel.delete(
                                                                'key_${todomodel.Id}');
                                                            var item =
                                                                TodoModel(
                                                              Taskname:
                                                                  todomodel
                                                                      .Taskname,
                                                              Description:
                                                                  todomodel
                                                                      .Description,
                                                              CreateDate:
                                                                  todomodel
                                                                      .CreateDate,
                                                              IsCompleted:
                                                                  todomodel
                                                                      .IsCompleted,
                                                              Id: todomodel.Id,
                                                              //Data time
                                                            );
                                                            item.categoryId =
                                                                todomodel
                                                                    .categoryId;
                                                            boxTodoModel.put(
                                                              'key_${todomodel.Id}',
                                                              item,
                                                            );
                                                          });
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          width: 24,
                                                          height: 24,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve: Curves
                                                              .fastLinearToSlowEaseIn,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: AppColor
                                                                  .TextGereyNew,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  24),
                                                            ),
                                                          ),
                                                          child: todomodel
                                                                  .IsCompleted!
                                                              ? SvgPicture.asset(
                                                                  "assets/todaytask/tick-24.svg")
                                                              : null,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 10),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        DateFormat('jm').format(
                                                            todomodel
                                                                .CreateDate!),
                                                        style: TextStyle(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w300,
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
                ),
                Positioned(
                  bottom: 0,
                  child: SvgPicture.asset(
                    "assets/todaytask/Line 3.svg",
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 12,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/todaytask/entypo_chevron-down.svg",
                  ),
                  Spacer(),
                  Text(
                    "done tasks (${getDoneCounts().toString()})",
                    // ${logic.state.isCheck.toString()}
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor.BlackText,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 53),
            MaterialButton(
              onPressed: () {
                Get.to(TaskAdd());
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
                    child: SvgPicture.asset(
                      "assets/todaytask/ic_baseline-plus (2).svg",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
