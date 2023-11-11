import 'package:ecommerce/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavigateButton extends StatelessWidget {
  const NavigateButton(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.call,
      required this.isActive})
      : super(key: key);
  final String title;
  final String iconData;
  final VoidCallback call;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h ),
      child: InkWell(
        onTap: call,
        child: Container(
          width: 12.w,
          decoration: BoxDecoration(
            color: isActive? AppUtils().lightgreenB: AppUtils().white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 1.h),
                child: Image.asset(iconData,
                fit: BoxFit.fill,),
              ),
              isActive? 
                 Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.sp,color: isActive? AppUtils().primary: AppUtils().normalFont),
                )
              : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
