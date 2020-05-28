import "package:flutter/material.dart";
import "package:flutter/foundation.dart";

class SubProductDetail {
  String id;
  String subProductId;
  String subProductTypeId;
  String name;
  int quantity;
  double price;
  Image picture;
  String description;

  SubProductDetail({
    @required this.id,
    @required this.subProductId,
    @required this.subProductTypeId,
    @required this.name,
    @required this.quantity,
    @required this.price,
    @required this.picture,
    @required this.description
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