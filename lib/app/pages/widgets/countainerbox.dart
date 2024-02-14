import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_color.dart';
import '../add_task/view.dart';
import 'custom_check_box.dart';

class countainerBox extends StatefulWidget {
  String? Titiletext;
  String? textTask;
  String? AmtimeText;
  String? PMtimeText;

  countainerBox(
      {this.textTask, this.Titiletext, this.AmtimeText, this.PMtimeText});

  @override
  State<countainerBox> createState() => _countainerBoxState();
}

class _countainerBoxState extends State<countainerBox> {
  late bool isCheck = false;

  void showDialogCustom(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            content: Container(
              width: 102,
              height: 69,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Align(
                    child: Container(
                      width: 102,
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
                                    width: 82,
                                    height: 16,
                                    color: AppColor.BorderColor,
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.to(AddTask());
                                      },
                                      child: Text(
                                        "add task",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        ),
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
                                Text(
                                  "delete tasks",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: AppColor.TextBlackHeader,
                                  ),
                                ),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.Titiletext ?? "",
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
                          widget.textTask ?? "",
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isCheck = !isCheck;
                          });
                        },
                        child: AnimatedContainer(
                          width: 24,
                          height: 24,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.TextGereyNew,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                          ),
                          child: isCheck
                              ? SvgPicture.asset("assets/todaytask/tick-24.svg")
                              : null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 6),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.AmtimeText ?? "",
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        widget.PMtimeText ?? "",
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
  }
}
