import 'package:ecommerce/componenets/datatText.dart';
import 'package:ecommerce/features/cart/bloc/control_cart_bloc/control_cart_bloc.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.data});
  final HomeAll data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Container(
        padding: EdgeInsets.only(bottom: 1.h),
        width: 40.w,
        decoration: BoxDecoration(
          color: AppUtils().white,
          boxShadow: AppUtils().shadow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Image.network(
                    data.image,
                    fit: BoxFit.cover,
                    width: 42.w,
                    height: 19.h,
                  )),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 3.h,
                    width: 16.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8)),
                      color: AppUtils().redColor,
                    ),
                    child: Center(
                        child: Text(
                      "Sale",
                      style:
                          TextStyle(color: AppUtils().white, fontSize: 10.sp),
                    )),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DataText(
                    text: data.name,
                    style: AppUtils().boldStyle(10.sp),
                    width: 30.w),
                Row(
                  children: [
                    DataText(
                        text: "${data.oldPrice.toDouble()}",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: AppUtils().greyColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                        width: 10.w),
                    DataText(
                        text: " ${data.currentPrice.toDouble()}",
                        style: AppUtils().greenStyle(10.sp),
                        width: 10.w),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        final cartBloc =
                          context.read<ControlCartBloc>();
                          cartBloc.add(AddProduct(CartM(
                          id: data.id,
                          name: data.name,
                          quantity: 1,
                          price: data.currentPrice,
                          category: data.category,
                          image: data.image)));
                        AppUtils().showSnack(context,
                            "One Product Added to Cart",AppUtils().primary);
                      },
                      child: Text(
                        "Add To Cart",
                        overflow: TextOverflow.ellipsis,
                        style: AppUtils().greenStyle(10.sp),
                      ),
                    ),
                    Image.asset('images/ggcart.png')
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
