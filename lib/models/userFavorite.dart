import "package:flutter/foundation.dart";

class UserFavorite {
  String id;
  String userId;
  String subCategoryId;
  String productId;

  UserFavorite({
    @required this.id,
    @required this.userId,
    @required this.subCategoryId,
    @required this.productId
  });
}