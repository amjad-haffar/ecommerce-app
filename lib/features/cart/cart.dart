import 'package:ecommerce/componenets/button.dart';
import 'package:ecommerce/componenets/cartCard.dart';
import 'package:ecommerce/componenets/datatText.dart';
import 'package:ecommerce/features/cart/bloc/control_cart_bloc/control_cart_bloc.dart';
import 'package:ecommerce/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlCartBloc, ControlCartInitial>(
      builder: (context, state) {
        if (state.total == 0) {
          return Scaffold(
              backgroundColor: AppUtils().white,
              body :AppUtils().emptyWidget());
        } else {
          return Scaffold(
            backgroundColor: AppUtils().white,
            appBar: AppBar(
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: Icon(
                    Icons.notifications,
                    color: AppUtils().primary,
                    size: 4.h,
                  ),
                )
              ],
              elevation: 0,
              backgroundColor: AppUtils().white,
              title: Text(
                "Cart",
                style: AppUtils().primaryStyle(12.sp),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: 80.h,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: state.cart.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => CartCard(
                                  product: state.cart[index],
                                )),
                      ),
                    ]),
                  ),
                  Positioned(
                    bottom: 0.h,
                    width: SizerUtil.width - 6.w,
                    child: Container(
                      color: AppUtils().white,
                      height: 9.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total: ",
                            style: AppUtils().boldStyle(12.sp),
                          ),
                          DataText(
                              text: "\$${state.total}",
                              style: AppUtils().primaryStyle(12.sp),
                              width: 40.w),
                          InkWell(
                              child: AddButton(
                            text: 'Place Order',
                            width: 40.w,
                            height: 6.h,
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
