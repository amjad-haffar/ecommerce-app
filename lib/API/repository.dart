import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/API/apiURL.dart';
import 'package:ecommerce/API/requestType.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/utils/errors.dart';
import 'package:ecommerce/utils/network.dart';
import 'package:flutter/services.dart';

class Repository {
  Repository(this.networkInfo);

  final NetworkInfo networkInfo;

  Future<Either<Failure, Product>> getAllProduct() async {
    if (await networkInfo.isConnected) {
      try {
        // Real API request
        return Right(
          await Request.getModel<Product>(
            ApiName.name(APIS.getProducts),
            Product.fromJson,
          ),
        );
      } catch (e, s) {
        // Fallback to mock data
        try {
          print(" Fallback to mock data");
          final response = await rootBundle.loadString(
            'mockData/products.json',
          );

          print(response);
          print(" Fallback to mock data done");

          final jsonMap = json.decode(response);

          return Right(Product.fromJson(jsonMap));
        } catch (e, s) {
          print(e);
          print(s);
          return Left(ServerFailure());
        }
      }
    } else {
      // Offline fallback
      try {
        final response = await rootBundle.loadString(
          'mockData/products.json',
        );

        final jsonMap = json.decode(response);

        return Right(Product.fromJson(jsonMap));
      } catch (e) {
        return Left(NetworkFailure());
      }
    }
  }

  Future<Either<Failure, Cart>> getCart() async {
    if (await networkInfo.isConnected) {
      try {
        // Real API request
        return Right(
          await Request.getModel<Cart>(
            ApiName.name(APIS.getCart),
            Cart.fromJson,
          ),
        );
      } catch (e) {
        // Fallback to mock cart
        try {
          final response = await rootBundle.loadString(
            'mockData/cart.json',
          );

          final jsonMap = json.decode(response);

          return Right(Cart.fromJson(jsonMap));
        } catch (e) {
          return Left(ServerFailure());
        }
      }
    } else {
      // Offline fallback
      try {
        final response = await rootBundle.loadString(
          'mockData/cart.json',
        );

        final jsonMap = json.decode(response);

        return Right(Cart.fromJson(jsonMap));
      } catch (e) {
        return Left(NetworkFailure());
      }
    }
  }
}
