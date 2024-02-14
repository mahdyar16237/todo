import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/app/utils/app_color.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        child:
            isCheck ? SvgPicture.asset("assets/todaytask/tick-24.svg") : null,
      ),
    );
  }
}
