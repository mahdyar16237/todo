import 'package:flutter/material.dart';

class CustomTextfiled extends StatelessWidget {
  String? hintText;

  CustomTextfiled({
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: hintText ?? "",
            ),
          ),
        ],
      ),
    );
  }
}
