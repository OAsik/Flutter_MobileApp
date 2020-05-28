import "package:flutter/material.dart";
import "package:flutter/foundation.dart";

class SubProduct with ChangeNotifier {
  String id;
  String productId;
  String name;
  Image picture;

  SubProduct({
    @required this.id,
    @required this.productId,
    @required this.name,
    @required this.picture
  });
}