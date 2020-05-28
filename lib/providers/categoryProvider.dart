import "../models/appException.dart";
import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import "../helpers/constants/errorMessage.dart";
import "../models/category.dart" as appCategory;

class CategoryProvider with ChangeNotifier {
  List<appCategory.Category> _dummyList = [
    appCategory.Category(
      id: "43ef2fed-3141-4375-808d-552b30fa5560",
      name: "Foods",
      picture: Image.asset("assets/images/dummyFoodCategory.png", fit: BoxFit.fill, width: 130, height: 130)
    ),
    appCategory.Category(
      id: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      name: "Products",
      picture: Image.asset("assets/images/dummyProductCategory.png", fit: BoxFit.fill, width: 130, height: 130)
    ),
    appCategory.Category(
      id: "684d74d2-94ef-4b6b-8af3-ae9db99d8a89",
      name: "Events",
      picture: Image.asset("assets/images/dummyEventCategory.png", fit: BoxFit.fill, width: 130, height: 130)
    ),
    appCategory.Category(
      id: "6e536f35-418e-4338-853b-2c4259061610",
      name: "Branches",
      picture: Image.asset("assets/images/dummyBranchCategory.png", fit: BoxFit.fill, width: 130, height: 130)
    )
  ];

  List<appCategory.Category> get allCategories {
    return [..._dummyList];
  }

  appCategory.Category getCategoryById(String categoryId) {
    return _dummyList.firstWhere((category) => category.id == categoryId, orElse: () => throw AppException(ErrorMessages.userNotFound));
  }
}