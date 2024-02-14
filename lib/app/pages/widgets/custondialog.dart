import 'package:flutter/material.dart';
import 'package:todo/app/utils/app_color.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Container(
        height: 69,
        width: 102,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 82,
                  height: 16,
                  color: Colors.blueAccent,
                  child: Text(
                    'Cool',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            Text(
              'Awesome',
              style: TextStyle(color: Colors.red),
            ),
            Text(
              'Awesome',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
