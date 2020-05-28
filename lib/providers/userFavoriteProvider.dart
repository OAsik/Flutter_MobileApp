import "package:uuid/uuid.dart";
import "../models/userFavorite.dart";
import "../models/appException.dart";
import "package:flutter/foundation.dart";
import "../helpers/constants/errorMessage.dart";

class UserFavoriteProvider with ChangeNotifier {
  List<UserFavorite> _dummyList = [
    UserFavorite(
      id: "d916d49d-7393-4030-9d7b-54aea4d6b803",
      productId: "1498dbc2-481b-462a-9255-ff97bb29f925",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      userId: "af5b63af-2923-438e-a4ec-43f5e0acf06d"
    ),
    UserFavorite(
      id: "35d44fd0-acd7-46ff-89f4-7c5727fcfb0b",
      productId: "32921141-9c88-4610-b006-8befcc8becb7",
      subCategoryId: "3b284b1f-42ed-49ae-8145-85a008fcbf41",
      userId: "af5b63af-2923-438e-a4ec-43f5e0acf06d"
    ),
    UserFavorite(
      id: "e0dacdfd-16f5-4f61-8b95-d0db53e5274e",
      productId: "619d4d1c-7dcb-4874-a536-f92365b7bc78",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      userId: "af5b63af-2923-438e-a4ec-43f5e0acf06d"
    )
  ];

  List<UserFavorite> get allUsers {
    return [..._dummyList];
  }

  List<UserFavorite> getUserFavoriteById (String userId) {
    try
    {
      return _dummyList.where((userFavorite) => userFavorite.userId == userId).toList();
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotCreated);
    }
  }

  bool getSingleUserFavoriteById (String userId, String productId) {
    UserFavorite result = _dummyList.firstWhere((userFavorite) => userFavorite.userId == userId && userFavorite.productId == productId, orElse: () => null);

    if (result == null) {
      return false;
    }

    return true;
  }

  List<String> getUserSubCategoryFavoriteProductIdById (String userId, String subCateogryId) {
    try
    {
      List<String> _productIdList = [];

      _dummyList.where((userFavorite) => userFavorite.userId == userId && userFavorite.subCategoryId == subCateogryId).toList().forEach((userSubCategoryFavorite) {
        _productIdList.add(userSubCategoryFavorite.productId);
      });

      return _productIdList;
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotCreated);
    }
  }

  void createUserFavorite(String userId, String subCategoryId, String productId)
  {
    //As the application runs on dummy data for now, I'm not doing such 'do not add favorite if this product is already in favorites' things. But, it would be also nice not to call web service at all on these kind of cases. Thus, definitely do perform UI-side validation controls too on real projects --Özgür

    try
    {
      Uuid uuid = Uuid();

      final userFavorite = UserFavorite(
        id: uuid.v4(),
        userId: userId,
        subCategoryId: subCategoryId,
        productId: productId
      );

      _dummyList.add(userFavorite);

      notifyListeners();
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotCreated);
    }
  }

  void deleteUserFavorite(String userId, String productId)
  {
    try
    {
      _dummyList.removeWhere((userFavorite) => userFavorite.userId == userId && userFavorite.productId == productId);

      notifyListeners();
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotCreated);
    }
  }
}