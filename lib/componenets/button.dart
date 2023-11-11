import 'package:ecommerce/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddButton extends StatelessWidget {
  AddButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    this.color,
    this.textColor
  });
  final String text;
  final double width;
  final double height;
  final Color? textColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color==null? AppUtils().green:AppUtils().green,
          borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor==null? AppUtils().white:AppUtils().green, fontSize: 12.sp),
        ),
      ),
    );
  }
}
