import "package:flutter/material.dart";
import "package:flutter/foundation.dart";

class SubProductType {
  String id;
  String subProductId;
  String name;
  Image picture;

  SubProductType({
    @required this.id,
    @required this.subProductId,
    @required this.name,
    @required this.picture
  });
}