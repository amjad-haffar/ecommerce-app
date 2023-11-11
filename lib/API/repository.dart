import 'package:dartz/dartz.dart';
import 'package:ecommerce/API/apiURL.dart';
import 'package:ecommerce/API/requestType.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/utils/errors.dart';
import 'package:ecommerce/utils/exceptions.dart';
import 'package:ecommerce/utils/network.dart';

class Repository {
  Repository(this.networkInfo);
  final NetworkInfo networkInfo;
  Future<Either<Failure, Product>> getAllProduct() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await Request.getModel<Product>(
            ApiName.name(APIS.getProducts), Product.fromJson));
      }catch (e){
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, Cart>> getCart() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await Request.getModel<Cart>(
            ApiName.name(APIS.getCart), Cart.fromJson));
      } 
      catch(e){
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
