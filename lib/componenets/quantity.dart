import 'package:ecommerce/features/cart/bloc/control_cart_bloc/control_cart_bloc.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class AddQuantityWidget extends StatelessWidget {
  const AddQuantityWidget({Key? key, required this.product}) : super(key: key);
  final CartM product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 8.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppUtils().green),
            child: Center(
              child: InkWell(
                onTap: () {
                  if (product.quantity > 0) {
                    final cartBloc = context.read<ControlCartBloc>();
                    cartBloc.add(LowerQuantity(CartM(
                        id: product.id,
                        name: product.name,
                        quantity: product.quantity,
                        price: product.price,
                        category: product.category,
                        image: product.image)));
                  }
                },
                child: Image.asset(
                  'images/minus.png',
                  width: 4.w,
                  height: 4.w,
                ),
              ),
            ),
          ),
          Container(
            width: 8.w,
            height: 6.h,
            color: Colors.white,
            child: Center(
              child: Text(product.quantity.toString(),
                  style: AppUtils().primaryStyle(13.sp)),
            ),
          ),
          Container(
            width: 8.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppUtils().green),
            child: Center(
              child: InkWell(
                onTap: () {
                  final cartBloc = context.read<ControlCartBloc>();
                    cartBloc.add(AddProduct(CartM(
                        id: product.id,
                        name: product.name,
                        quantity: product.quantity,
                        price: product.price,
                        category: product.category,
                        image: product.image)));
                },
                child: Image.asset(
                  'images/plus.png',
                  width: 8.w,
                  height: 8.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
