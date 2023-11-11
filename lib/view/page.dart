import 'package:ecommerce/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RandomPage extends StatelessWidget {
  const RandomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: InkWell(child: Image.asset('images/back.png')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppUtils().white,
        title: Text(
          "Page",
          style: AppUtils().primaryStyle(12.sp),
        ),
      ),
    );
  }
}
