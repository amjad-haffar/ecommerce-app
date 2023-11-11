import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppUtils {
  Color primary = const Color(0xff004A97);
  Color redColor = const Color(0xffFF4E4E);
  Color green = const Color(0xff00953A);
  Color lightgreen2 = const Color.fromARGB(255, 185, 255, 214);
  Color lightgreenB = const Color(0xffADFFD5);
  Color lightgreen = const Color(0xffD9FFEB);
  Color backGround = const Color(0xffF6F6F6);
  Color black = const Color(0xff363636);
  Color normalFont = const Color(0xff393939);
  Color greyColor = const Color.fromARGB(255, 151, 151, 151);
  Color white = const Color(0xffffffff);
  List<BoxShadow> shadow = const [
    BoxShadow(
      offset: Offset(0, 0),
      color: Colors.black12,
      spreadRadius: 1,
    )
  ];
  showSnack(BuildContext context, String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        content: Text(text),
        duration: const Duration(seconds: 3)));
  }

  emptyWidget() {
    return  Center(
      child: Image.asset(
        'images/cartisempty.png',
        width: 80.w,
      )
    );
  }

  errorWidget() {
    return Container(
      color: white,
      height: SizerUtil.height,
      child: Center(
        child: Image.asset(
          'images/error.png',
          width: 80.w,
        ),)
      );
  }

  TextStyle primaryStyle(
    double size,
  ) {
    return TextStyle(
      color: primary,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle boldStyle(
    double size,
  ) {
    return TextStyle(
      color: normalFont,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle greenStyle(
    double size,
  ) {
    return TextStyle(
      color: green,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle colorStyle(
    double size,
  ) {
    return TextStyle(
      color: primary,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle normalStyle(
    double size,
  ) {
    return TextStyle(
      color: normalFont,
      fontSize: size,
    );
  }

  Widget addhorBox(double x) {
    return SizedBox(
      width: x,
    );
  }

  Widget addVerBox(double x) {
    return SizedBox(
      height: x,
    );
  }
}
