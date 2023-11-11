import 'package:ecommerce/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: InkWell(child: Image.asset('images/.png')),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppUtils().white,
          title: Text("Profile",style: AppUtils().primaryStyle(12.sp),),
        ), );
  }
}