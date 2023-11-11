import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DataText extends StatelessWidget {
  const DataText(
      {super.key,
      required this.text,
      required this.style,
      required this.width,
      this.maxlines=1});
  final String text;
  final TextStyle style;
  final double width;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: SizedBox(
        width: width,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: style,
          maxLines: maxlines,
        ),
      ),
    );
  }
}
