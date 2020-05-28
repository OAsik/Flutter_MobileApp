import "../models/subCategory.dart";
import "../models/appException.dart";
import "package:flutter/foundation.dart";
import "../helpers/constants/errorMessage.dart";

class SubCategoryProvider with ChangeNotifier {
  List<SubCategory> _dummyList = [
    SubCategory(
      id: "0f1c590d-f3e9-42db-9a65-e5e28e04fc28",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      name: "Trading Card"
    ),
    SubCategory(
      id: "c7d1124c-ba97-487c-a425-2e04742d5f5b",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      name: "FRP"
    ),
    SubCategory(
      id: "1687e907-4bf4-4365-9aa0-11345deb2310",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      name: "Board Game"
    ),
    SubCategory(
      id: "76181016-7f5d-4554-bf19-dbf3573951c3",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      name: "Cosplay"
    ),
    SubCategory(
      id: "4247c259-b629-43af-81f5-cb58ae1e37aa",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      name: "Computer Game"
    ),
    SubCategory(
      id: "c9e93002-93db-4256-a65b-6c2af47cb07c",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      name: "Action Figure"
    ),
    SubCategory(
      id: "f14f6611-be6f-4322-9262-450aae623e07",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      name: "Comic"
    ),
    SubCategory(
      id: "f384e79a5-e544-483e-9a86-c0ee5126892a",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      name: "Salad"
    ),
    SubCategory(
      id: "5493a39e-099b-4f84-83c6-d2a5af4eefa0",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      name: "Pasta"
    ),
    SubCategory(
      id: "3b284b1f-42ed-49ae-8145-85a008fcbf41",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      name: "Pizza"
    ),
    SubCategory(
      id: "0039cde3-4c5a-4245-8801-d12b7381fcc1",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      name: "Burger"
    ),
    SubCategory(
      id: "d5f293f9-094f-4a71-909d-fa57d2705863",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      name: "Snacks"
    )
  ];

  List<SubCategory> get allSubCategories {
    return [..._dummyList];
  }

  SubCategory getSubCategoryById(String subCategoryId) {
    return _dummyList.firstWhere((subCategory) => subCategory.id == subCategoryId, orElse: () => throw AppException(ErrorMessages.userNotFound));
  }

  List<SubCategory> getCategorySubCategoriesById(String categoryId) {
    try
    {
      return _dummyList.where((subCategory) => subCategory.categoryId == categoryId).toList();
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotFound);
    }
  }
}