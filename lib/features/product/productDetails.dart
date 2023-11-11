import 'package:ecommerce/componenets/button.dart';
import 'package:ecommerce/componenets/datatText.dart';
import 'package:ecommerce/features/cart/bloc/control_cart_bloc/control_cart_bloc.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final HomeAll product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlCartBloc, ControlCartInitial>(
      builder: (context, state) {
        if (state is ControlCartInitial) {
          return SafeArea(
            child: Scaffold(
                backgroundColor: AppUtils().white,
                appBar: AppBar(
                  leading: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset('images/back.png')),
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: AppUtils().white,
                  title: Text(
                    "Product Details",
                    style: AppUtils().primaryStyle(12.sp),
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: SizedBox(
                          height: 89.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(maxHeight: 40.h),
                                width: 94.w,
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              DataText(
                                  text: product.name,
                                  style: AppUtils().primaryStyle(13.sp),
                                  width: 70.w),
                              Row(
                                children: [
                                  DataText(
                                      text:
                                          "${product.oldPrice.toDouble()}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: AppUtils().primary,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold),
                                      width: 15.w),
                                  DataText(
                                      text:
                                          "-  ${product.oldPrice.toDouble()}",
                                      style: AppUtils().greenStyle(13.sp),
                                      width: 20.w),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 1.h),
                                child: Text(
                                  "Desciption",
                                  overflow: TextOverflow.ellipsis,
                                  style: AppUtils().primaryStyle(12.sp),
                                ),
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 1.h),
                                  child: DataText(
                                    text: product.description,
                                    style: AppUtils().normalStyle(9.sp),
                                    width: 90.w,
                                    maxlines: 10,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.h,
                        width: SizerUtil.width - 6.w,
                        child: Container(
                          color: AppUtils().white,
                          height: 9.h,
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'images/heart.png',
                                width: 8.w,
                                height: 8.h,
                                fit: BoxFit.contain,
                              ),
                              Image.asset(
                                'images/cart.png',
                                width: 8.w,
                                height: 8.h,
                                fit: BoxFit.contain,
                              ),
                              InkWell(
                                  onTap: () {
                                    final cartBloc =
                                        context.read<ControlCartBloc>();
                                    cartBloc.add(AddProduct(CartM(
                                        id: product.id,
                                        name: product.name,
                                        quantity: 1,
                                        price: product.currentPrice,
                                        category: product.category,
                                        image: product.image)));
                                        Get.back();
                                    AppUtils().showSnack(context,
                                        "One Product Added to Cart",AppUtils().primary);

                                  },
                                  child: AddButton(
                                    text: 'Add to Cart',
                                    width: 60.w,
                                    height: 6.h,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        }
        return const SizedBox();
      },
    );
  }
}
