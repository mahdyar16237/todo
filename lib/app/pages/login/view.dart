import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo/app/pages/home/view.dart';
import 'package:todo/app/pages/login/logic.dart';
import 'package:todo/app/utils/app_color.dart';

class LoginScrean extends StatelessWidget {
  const LoginScrean({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(LoginLogic());
    final state = Get.find<LoginLogic>().state;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 93,
            ),
            Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      height: 359,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: SvgPicture.asset(
                        "assets/login/background.svg",
                      ),
                    ),
                    Positioned(
                      top: 53,
                      right: 74,
                      child: SvgPicture.asset(
                        "assets/login/user.svg",
                      ),
                    ),
                    Positioned(
                      top: 67,
                      left: 0,
                      child: SvgPicture.asset(
                        "assets/login/mange.svg",
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      child: SvgPicture.asset(
                        "assets/login/line.svg",
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 44),
            Text(
              "Manage your tasks",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColor.BlackText,
              ),
            ),
            SizedBox(height: 14),
            Text(
              "organize, plan, and collaborate on tasks with Mtodo.Your busy life deserves this.you can manage checklist and your goal.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.GereyText,
              ),
            ),
            SizedBox(height: 36),
            Container(
              width: 240,
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.ColorCountainer,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: MaterialButton(
                child: Container(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                onPressed: () {
                  Get.to(HomeScrean());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
