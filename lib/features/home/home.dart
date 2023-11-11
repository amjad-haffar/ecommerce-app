import 'package:ecommerce/componenets/navigationButton.dart';
import 'package:ecommerce/utils/appTheme.dart';
import 'package:ecommerce/features/cart/cart.dart';
import 'package:ecommerce/features/home/feed.dart';
import 'package:ecommerce/view/page.dart';
import 'package:ecommerce/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
       FeedPage(),
      const RandomPage(),
      CartPage(),
      const ProfilePage()
    ];
    return Scaffold(
      bottomNavigationBar:
         Container(
          height: 9.h,
          decoration :BoxDecoration(
              color: AppUtils().white,
              boxShadow: AppUtils().shadow,
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigateButton(
                title: "Home",
                iconData: 'images/home.png',
                isActive: (currentIndex == 0) ? true : false,
                call: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
              ),
              NavigateButton(
                title: "page",
                iconData: "images/icon1.png",
                isActive: (currentIndex == 1) ? true : false,
                call: () async {
                  setState(() {
                    currentIndex = 1;
                  });
                },
              ),
              NavigateButton(
                title: "Cart",
                iconData: "images/cart.png",
                isActive: (currentIndex == 2) ? true : false,
                call: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
              ),
              NavigateButton(
                title: "Profile",
                iconData: "images/profile.png",
                isActive: (currentIndex == 3) ? true : false,
                call: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      body: pages[currentIndex],
    );
  }
}
