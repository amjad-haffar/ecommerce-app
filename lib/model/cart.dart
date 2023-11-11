
import 'dart:convert';

import 'package:ecommerce/model/model.dart';
class Cart extends Model{
    late List<CartM> cartMyCart;
    late List<CartM> cartMoreToLove;

    Cart({
        required this.cartMyCart,
        required this.cartMoreToLove,
    });
    @override
  List<Object?> get props => [cartMyCart,cartMoreToLove];
    @override
    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        cartMyCart: List<CartM>.from(json["cart_myCart"].map((x) => CartM.fromJson(x))),
        cartMoreToLove: List<CartM>.from(json["cart_MoreToLove"].map((x) => CartM.fromJson(x))),
    );
    @override
    Map<String, dynamic> toJson() => {
        "cart_myCart": List<dynamic>.from(cartMyCart.map((x) => x.toJson())),
        "cart_MoreToLove": List<dynamic>.from(cartMoreToLove.map((x) => x.toJson())),
    };
}

class CartM extends Model{
    late int id;
    late String name;
    late int quantity;
    late int price;
    late String category;
    late String image;

    CartM({
        required this.id,
        required this.name,
        required this.quantity,
        required this.price,
        required this.category,
        required this.image,
    });
    factory CartM.fromRawJson(String str) => CartM.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());
    @override
  List<Object?> get props => [id,name,quantity,price,category,image];
    @override
    factory CartM.fromJson(Map<String, dynamic> json) => CartM(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
        category: json["category"],
        image: json["image"],
    );
    @override
    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
        "price": price,
        "category": category,
        "image": image,
    };
}
