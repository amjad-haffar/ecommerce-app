
import 'package:ecommerce/componenets/datatText.dart';
import 'package:ecommerce/componenets/quantity.dart';
import 'package:ecommerce/features/cart/bloc/control_cart_bloc/control_cart_bloc.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key,required this.product});
  final CartM product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Container(
        width: 40.w,
        decoration: BoxDecoration(
          color: AppUtils().white,
          boxShadow: AppUtils().shadow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Image.network(
                        product.image,
                        fit: BoxFit.contain,
                        width: 32.w,
                        height: 16.h,
                      )),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: SizedBox(
                          width: 26.w,
                          height: 16.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DataText(
                                  text: product.name,
                                  style: AppUtils().primaryStyle(10.sp),
                                  width: 30.w),
                              DataText(
                                  text: 'Brown',
                                  style: AppUtils().boldStyle(10.sp),
                                  width: 30.w),
                              Row(
                                children: [
                                  Image.asset('images/sale.png'),
                                  Text(
                                    " Sale",
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(color: AppUtils().redColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  DataText(
                                      text: product.price.toDouble().toString(),
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: AppUtils().greyColor,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold),
                                      width: 10.w),
                                  DataText(
                                      text: product.price.toDouble().toString(),
                                      style: AppUtils().greenStyle(10.sp),
                                      width: 10.w),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, right: 2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        final cartBloc =
                            context.read<ControlCartBloc>();
                        cartBloc.add(DeleteProduct(CartM(
                            id: product.id,
                            name: product.name,
                            quantity: product.quantity,
                            price: product.price,
                            category: product.category,
                            image: product.image)));
                        AppUtils().showSnack(context,
                            "Product Deleted from Cart",AppUtils().primary);
                      },
                      child: Image.asset('images/delete.png')),
                    AppUtils().addVerBox(3.h),
                    AddQuantityWidget(product: product,)
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
