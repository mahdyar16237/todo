import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_color.dart';
import '../Select_Category/view.dart';

class MenuHomeone extends StatelessWidget {
  String? plus;

  String? workout;
  String? workouttextTitle;
  String? workoutNotifications;

  String? school;
  String? schooltextTitle;
  String? schoolNotifications;

  MenuHomeone({
    this.plus,
    this.workout,
    this.workouttextTitle,
    this.workoutNotifications,
    this.school,
    this.schooltextTitle,
    this.schoolNotifications,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        children: [
          MaterialButton(
            onPressed: () {
              Get.to(SelecteCategory());
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                border: Border.all(
                  color: AppColor.BorderMenu,
                  width: 1,
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    plus ?? "",
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              color: AppColor.GreenCountainer,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 18,
                  bottom: 49,
                  child: SvgPicture.asset(
                    workout ?? "",
                  ),
                ),
                Positioned(
                  bottom: 18,
                  child: Text(
                    workouttextTitle ?? "",
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
                    workoutNotifications ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              color: AppColor.BlueDarkCountainer,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 18,
                  bottom: 49,
                  child: SvgPicture.asset(
                    school ?? "",
                  ),
                ),
                Positioned(
                  bottom: 18,
                  child: Text(
                    schooltextTitle ?? "",
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
                    schoolNotifications ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
