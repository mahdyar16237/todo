import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import '../../utils/app_color.dart';
import '../task_add/logic.dart';
import '../widgets/boxes.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TaskNameLogic());
    final state = Get.find<TaskNameLogic>().state;

    int groupTasks(int categoryIndex) {
      var x = boxTodoModel.listenable().value.values.toList();

      final groupedTasks = groupBy(x, (todo) => todo.categoryId);

      var count = groupedTasks.values
          .firstWhere((element) => element.first.categoryId == categoryIndex,
              orElse: () => [])
          .length;
      // printing grouped tasks and their count
      print(count);
      return count;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Transform.scale(
                    scale: 1.2,
                    origin: Offset(7.0, 190.0),
                    child: Container(
                      height: 260.0,
                      width: 300.0,
                      child: SvgPicture.asset(
                        "assets/home/Ellipse 10.svg",
                      ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Mtodo Logo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColor.TextWihteHeader,
                        ),
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "home_3".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColor.TextBlackHeader,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "home_4".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColor.TextWihteHeader,
                            ),
                          ),
                          SizedBox(width: 3),
                          Text(
                            "home_2".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColor.TextWihteHeader,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "home_1".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColor.TextBlackHeader,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${DateFormat("yMMMMEEEEd").format(logic.state.time)}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColor.TextBlackHeader,
                        ),
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      Container(
                        width: 280,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColor.TextWihteHeader,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search tasks",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.TextGereyShades,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              SvgPicture.asset("assets/home/search.svg")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 52),
                      Container(
                        width: 328,
                        height: 43,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        color: AppColor.TextWihteHeader,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 71,
                              height: 27,
                              decoration: BoxDecoration(
                                color: AppColor.TextWihteHeader,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                                border: Border.all(
                                  color: AppColor.BorderColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "month",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 71,
                              height: 27,
                              decoration: BoxDecoration(
                                color: AppColor.TextWihteHeader,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                                border: Border.all(
                                  color: AppColor.BorderColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "week",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 71,
                              height: 27,
                              decoration: BoxDecoration(
                                color: AppColor.TextWihteHeader,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                                border: Border.all(
                                  color: AppColor.BorderColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "today",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            color: logic.state.colorCategory[index],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 18,
                                bottom: 49,
                                child:
                                    SvgPicture.asset(logic.state.Image[index]),
                              ),
                              Positioned(
                                bottom: 18,
                                child: Text(
                                  logic.state.nameList[index].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: Text(
                                  groupTasks(index).toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
