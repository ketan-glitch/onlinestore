// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    Products({
        this.products,
    });

    List<Product> products;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: List<Product>.from(json["Products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.aloeveraSoap,
        this.herbalFaceWash,
        this.apples,
        this.organicCabbage,
    });

    AloeveraSoap aloeveraSoap;
    AloeveraSoap herbalFaceWash;
    AloeveraSoap apples;
    AloeveraSoap organicCabbage;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        aloeveraSoap: json["Aloevera Soap"] == null ? null : AloeveraSoap.fromJson(json["Aloevera Soap"]),
        herbalFaceWash: json["Herbal Face Wash"] == null ? null : AloeveraSoap.fromJson(json["Herbal Face Wash"]),
        apples: json["Apples"] == null ? null : AloeveraSoap.fromJson(json["Apples"]),
        organicCabbage: json["Organic Cabbage"] == null ? null : AloeveraSoap.fromJson(json["Organic Cabbage"]),
    );

    Map<String, dynamic> toJson() => {
        "Aloevera Soap": aloeveraSoap == null ? null : aloeveraSoap.toJson(),
        "Herbal Face Wash": herbalFaceWash == null ? null : herbalFaceWash.toJson(),
        "Apples": apples == null ? null : apples.toJson(),
        "Organic Cabbage": organicCabbage == null ? null : organicCabbage.toJson(),
    };
}

class AloeveraSoap {
    AloeveraSoap({
        this.description,
        this.category,
        this.price,
        this.rating,
        this.stock,
    });

    String description;
    String category;
    int price;
    double rating;
    int stock;

    factory AloeveraSoap.fromJson(Map<String, dynamic> json) => AloeveraSoap(
        description: json["Description"],
        category: json["Category"],
        price: json["Price"],
        rating: json["Rating"].toDouble(),
        stock: json["Stock"],
    );

    Map<String, dynamic> toJson() => {
        "Description": description,
        "Category": category,
        "Price": price,
        "Rating": rating,
        "Stock": stock,
    };
}