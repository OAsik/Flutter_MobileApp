import "package:flutter/material.dart";
import "package:flutter/foundation.dart";

class Product {
  String id;
  String categoryId;
  String subCategoryId;
  String name;
  Image picture;
  String description;
  double price;

  Product({
    @required this.id,
    @required this.categoryId,
    @required this.subCategoryId,
    @required this.name,
    @required this.picture,
    this.description,
    this.price
  });

  @override
  String toString() {
    if (price.toStringAsFixed(2).contains(".00"))
    {
      return price.toStringAsFixed(0);
    }

    return price.toStringAsFixed(2);
  }
}