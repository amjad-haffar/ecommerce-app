import 'package:ecommerce/componenets/ProductCard.dart';
import 'package:ecommerce/features/home/bloc/home_bloc.dart';
import 'package:ecommerce/features/product/productDetails.dart';
import 'package:ecommerce/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FeedPage extends StatefulWidget {
  FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      if (state is HomeErrorState) {
        AppUtils().showSnack(context, state.error, AppUtils().redColor);
      }
      if (state is HomeInitial) {}
    }, builder: (context, state) {
      if (state is HomeErrorState) {
        return Scaffold(
          body: RefreshIndicator(
              displacement: 3,
              edgeOffset: 4,
              color: AppUtils().primary,
              onRefresh: () async {
                context.read<HomeBloc>().add(HomeInitalEvent());
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                 child: AppUtils().errorWidget()),)
        );
      } else if (state is HomeLoadingState) {
        return Center(
            child: CircularProgressIndicator(
          color: AppUtils().primary,
        ));
      } else if (state is HomeLoadedState) {
        final data = state;
        return Scaffold(
          backgroundColor: AppUtils().white,
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Image.asset('images/logo.png'),
            ),
            leadingWidth: 22.w,
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppUtils().white,
            title: Text(
              "Products",
              style: AppUtils().primaryStyle(12.sp),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text(
                        'Best Seller',
                        style: AppUtils().primaryStyle(13.sp),
                      ),
                    ),
                    SizedBox(
                      height: 33.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.products.homeAll.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.to(()=>ProductDetails(
                                      product:
                                          data.products.homeAll[index]));
                                },
                                child: ProductCard(
                                    data: data.products.homeAll[index]),
                              )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text(
                        'All Products',
                        style: AppUtils().primaryStyle(13.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          shrinkWrap: true,
                          itemCount: data.products.homeAll.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 33.h,
                            mainAxisSpacing: 2.h,
                            crossAxisSpacing: 2.w,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.to(ProductDetails(
                                      product:
                                          data.products.homeAll[index]));
                                },
                                child: ProductCard(
                                    data: data.products.homeAll[index]),
                              )),
                    ),
                    AppUtils().addVerBox(8.h)
                  ]),
            ),
          ),
        );
      }
      return const SizedBox();
    });
  }
}
