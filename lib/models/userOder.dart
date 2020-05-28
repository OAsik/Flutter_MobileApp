import "package:flutter/foundation.dart";

class UserOrder {
  String id;
  String userId;
  String productId;
  String subProductDetailId;
  DateTime orderDate;
  bool isCheckedOut;
  int productQuantity;
  double total;

  UserOrder({
    @required this.id,
    @required this.userId,
    @required this.productId,
    @required this.subProductDetailId,
    @required this.orderDate,
    @required this.isCheckedOut,
    @required this.productQuantity,
    @required this.total
  });
}