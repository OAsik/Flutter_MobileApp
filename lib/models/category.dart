import "package:flutter/material.dart";
import "package:flutter/foundation.dart";

class Category {
  String id;
  String name;
  Image picture;

  Category({
    @required this.id,
    @required this.name,
    @required this.picture
  });
}