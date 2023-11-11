import 'dart:convert';

import 'package:ecommerce/model/model.dart';
class Product extends Model{
    final List<HomeAll> homeAll;

    Product({
        required this.homeAll,
    });

@override
    factory Product.fromJson(Map<String, dynamic> json) => Product(
        homeAll: List<HomeAll>.from(json["Home_All"].map((x) => HomeAll.fromJson(x))),
    );
@override 
    Map<String, dynamic> toJson() => {
        "Home_All": List<dynamic>.from(homeAll.map((x) => x.toJson())),
    };
}

class HomeAll extends Model{
    late int id;
    late String name;
    late String description;
    late int oldPrice;
    late int currentPrice;
    late String category;
    late String image;

    HomeAll({
        required this.id,
        required this.name,
        required this.description,
        required this.oldPrice,
        required this.currentPrice,
        required this.category,
        required this.image,
    });

    factory HomeAll.fromRawJson(String str) => HomeAll.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());
@override
    factory HomeAll.fromJson(Map<String, dynamic> json) => HomeAll(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        oldPrice: json["old_price"],
        currentPrice: json["current_price"],
        category: json["category"],
        image: json["image"],
    );
    @override
    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "old_price": oldPrice,
        "current_price": currentPrice,
        "category": category,
        "image": image,
    };
}
