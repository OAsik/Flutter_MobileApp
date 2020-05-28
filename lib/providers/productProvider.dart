import "../models/product.dart";
import "../models/appException.dart";
import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import "../helpers/constants/errorMessage.dart";

class ProductProvider with ChangeNotifier {
  List<Product> _dummyList = [
    Product(
      id: "e9de0e8a-0291-4325-8e3d-b63aa6031f09",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      subCategoryId: "0f1c590d-f3e9-42db-9a65-e5e28e04fc28",
      name: "Magic the Gathering",
      picture: Image.asset("assets/images/dummyMagic.png", fit: BoxFit.fill, width: 130, height: 130)
    ),
    Product(
      id: "c7cd9909-b433-4dae-b93d-a9f34d829378",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      subCategoryId: "0f1c590d-f3e9-42db-9a65-e5e28e04fc28",
      name: "Yu-Gi-Oh! Boosters",
      picture: Image.asset("assets/images/dummyYuGiOh.png", fit: BoxFit.fill, width: 130, height: 130)
    ),
    Product(
      id: "e98970be-5c47-46e8-95ed-123806921a1b",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      subCategoryId: "c7d1124c-ba97-487c-a425-2e04742d5f5b",
      name: "RPG Tools",
      picture: Image.asset("assets/images/dummyFRP.png", fit: BoxFit.fill, width: 130, height: 130)
    ),
    Product(
      id: "7eaff179-3b3b-46ba-8eb4-ccba4ba60163",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      subCategoryId: "1687e907-4bf4-4365-9aa0-11345deb2310",
      name: "Board Games",
      picture: Image.asset("assets/images/dummyBoardGame.png", fit: BoxFit.fill, width: 130, height: 130)
    ),
    Product(
      id: "7849b37d-535a-4bb7-8790-15b2297b6d32",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      subCategoryId: "76181016-7f5d-4554-bf19-dbf3573951c3",
      name: "Cosplay Materials",
      picture: Image.asset("assets/images/dummyCosplay.png", fit: BoxFit.fill, width: 130, height: 130)
    ),
    Product(
      id: "8a6e5585-8313-4e06-8067-4a8e91b4f1ae",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      subCategoryId: "4247c259-b629-43af-81f5-cb58ae1e37aa",
      name: "Computer Games",
      picture: Image.asset("assets/images/dummyComputerGame.png", fit: BoxFit.fill, width: 130, height: 130)
    ),
    Product(
      id: "a0bb6aaf-b06d-4620-a870-788ff4cba55d",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      subCategoryId: "c9e93002-93db-4256-a65b-6c2af47cb07c",
      name: "Anime & Manga Figures",
      picture: Image.asset("assets/images/dummyFigure.png", fit: BoxFit.fill, width: 130, height: 130)
    ),
    Product(
      id: "5195acdb-eaee-417e-89f3-13063fd9f933",
      categoryId: "f0b1c11b-1f06-4c64-9126-034fdc606e57",
      subCategoryId: "f14f6611-be6f-4322-9262-450aae623e07",
      name: "Comic Books",
      picture: Image.asset("assets/images/dummyComicBook.png", fit: BoxFit.fill, width: 130, height: 130)
    ),
    Product(
      id: "de09e580-df87-4c52-bccc-3b15cd9904b3",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "f384e79a5-e544-483e-9a86-c0ee5126892a",
      name: "Tomato Salad with Watermelon",
      picture: Image.asset("assets/images/dummyTomatoSalad.png", fit: BoxFit.cover, width: 130, height: 130),
      description: "Let's take the greens out, this time our job is with the red and fresh flavors which the summer brings in. Who can say no to a salad that watermelon and tomato share the leading roles?",
      price: 19
    ),
    Product(
      id: "028d2295-3d97-4c24-8dc6-6d1c472c1aec",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "f384e79a5-e544-483e-9a86-c0ee5126892a",
      name: "Purslane Salad with Walnut Sauce",
      picture: Image.asset("assets/images/dummyPurslaneSalad.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "A salad that will shake the throne of all the other classic salads and makes you thank each ingredient inside of it.",
      price: 16.75
    ),
    Product(
      id: "d0f73e41-d826-4de3-898f-7d4122e0ab1a",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "f384e79a5-e544-483e-9a86-c0ee5126892a",
      name: "Labada Salad",
      picture: Image.asset("assets/images/dummyLabadaSalad.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Maybe it's a flavor you haven't tried so far, maybe you've heard of it before but you never knew what kind of plant it was, or you liked to make wraps with it... After today, we are sure that you will want its salad every day.",
      price: 15.50
    ),
    Product(
      id: "dcabb3d8-8acf-4573-be89-a8cafd1283f5",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "f384e79a5-e544-483e-9a86-c0ee5126892a",
      name: "Kinoa Salad",
      picture: Image.asset("assets/images/dummyKinoaSalad.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Especially when it comes to diet, we are determined to put the salads to our main dishes. If you are the one thinking this way, try this without losing any more time.",
      price: 15.50
    ),
    Product(
      id: "a1f00bd3-1b3f-4dc8-97c2-95a9a9b843ef",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "f384e79a5-e544-483e-9a86-c0ee5126892a",
      name: "Mushroom Salad",
      picture: Image.asset("assets/images/dummyMushroomSalad.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Mushroom gained our appreciation as it entered every recipe, every dish in the last years. In this salad you will taste the wonders that it supplies the salad.",
      price: 16.75
    ),
    Product(
      id: "d7aad2b6-724d-4393-a617-42b49bcc1a83",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "5493a39e-099b-4f84-83c6-d2a5af4eefa0",
      name: "One-Pot Penne Pasta with Turkey and Spinach",
      picture: Image.asset("assets/images/dummyPennePasta.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "This pasta is not only heart healthy but with few adjustments (no salt) it tasted like a delicious meal that you haven't had for over a year now!",
      price: 20
    ),
    Product(
      id: "1887e66c-a753-4555-9893-bbf1752c4a80",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "5493a39e-099b-4f84-83c6-d2a5af4eefa0",
      name: "Pasta with Meatballs and Tomato Souce",
      picture: Image.asset("assets/images/dummyMeatballPasta.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Eat this pasta today and you will think these are the best meatball’s that you have ever eat.",
      price: 25
    ),
    Product(
      id: "32921141-9c88-4610-b006-8befcc8becb7",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "3b284b1f-42ed-49ae-8145-85a008fcbf41",
      name: "Panetti's Margherita Pizza",
      picture: Image.asset("assets/images/dummyMargheritaPizza.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "This is a classic. As much as you've tinkered with the pizza over the years, you haven’t tasted with this formula.",
      price: 20
    ),
    Product(
      id: "1498dbc2-481b-462a-9255-ff97bb29f925",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "Water",
      picture: Image.asset("assets/images/dummyWater.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a water. No more words needed.",
      price: 2
    ),
    Product(
      id: "640d3d67-f631-4ebb-8e83-e156a7acd035",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "Toblerone",
      picture: Image.asset("assets/images/dummyToblerone.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a Toblerone. No more words needed.",
      price: 5
    ),
    Product(
      id: "619d4d1c-7dcb-4874-a536-f92365b7bc78",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "Bounty",
      picture: Image.asset("assets/images/dummyBounty.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a Bounty. No more words needed.",
      price: 5
    ),
    Product(
      id: "f30adeac-e939-4882-8ae9-42e8b2ab4c81",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "KitKat",
      picture: Image.asset("assets/images/dummyKitKat.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a KitKat. No more words needed.",
      price: 5
    ),
    Product(
      id: "61e46efc-d765-43ae-b1dc-7d2b052856c8",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "Snickers",
      picture: Image.asset("assets/images/dummySnickers.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a Snickers. No more words needed.",
      price: 5
    ),
    Product(
      id: "da4dc4bd-b73a-4de1-98ee-0cc0b29918d5",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "Mars",
      picture: Image.asset("assets/images/dummyMars.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a Mars. No more words needed.",
      price: 5
    ),
    Product(
      id: "85a2a8ad-39e9-4ce2-904e-0ebb33fe1df5",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "Twix",
      picture: Image.asset("assets/images/dummyTwix.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a Twix. No more words needed.",
      price: 5
    ),
    Product(
      id: "ebf1ecd3-860a-4e72-844b-ab076b7ff888",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "M&M",
      picture: Image.asset("assets/images/dummyMnM.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a M & M. No more words needed.",
      price: 7
    ),
    Product(
      id: "f841564b-c350-49bb-9185-d185c41794fe",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "Crunch",
      picture: Image.asset("assets/images/dummyCrunch.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a Crunch. No more words needed.",
      price: 5
    ),
    Product(
      id: "ed104c3f-6d24-4d28-a5e6-df3ef6e464c5",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "Pringles",
      picture: Image.asset("assets/images/dummyPringles.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a Pringles. No more words needed.",
      price: 9
    ),
    Product(
      id: "26367739-736f-4c06-86de-9a15c55b0f4b",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "Cheetos",
      picture: Image.asset("assets/images/dummyCheetos.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a Cheetos. No more words needed.",
      price: 8
    ),
    Product(
      id: "073ad7bb-4a09-474a-ac54-ea5835f10752",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "Doritos",
      picture: Image.asset("assets/images/dummyDoritos.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a Doritos. No more words needed.",
      price: 8
    ),
    Product(
      id: "7cecf314-c5e0-4866-a584-683f6941a1e6",
      categoryId: "43ef2fed-3141-4375-808d-552b30fa5560",
      subCategoryId: "d5f293f9-094f-4a71-909d-fa57d2705863",
      name: "Lays",
      picture: Image.asset("assets/images/dummyLays.png", fit: BoxFit.fill, width: 130, height: 130),
      description: "Its a Lays. No more words needed.",
      price: 8
    )
  ];

  List<Product> get allProducts {
    return [..._dummyList];
  }

  Product getSingleProductById(String id) {
    return _dummyList.firstWhere((product) => product.id == id, orElse: () => throw AppException(ErrorMessages.userNotFound));
  }

  List<Product> getProductsById(List<String> productIdList) {
    try
    {
      List<Product> _productList = [];

      productIdList.forEach((productId) {
        _productList.add(_dummyList.firstWhere((product) => product.id == productId));
      });

      return _productList;
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotFound);
    }
  }

  List<Product> getCategoryProductById(String categoryId) {
    try
    {
      return _dummyList.where((product) => product.categoryId == categoryId).toList();
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotFound);
    }
  }

  List<Product> getSubCategoryProductById(String subCategoryId) {
    try
    {
      return _dummyList.where((product) => product.subCategoryId == subCategoryId).toList();
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotFound);
    }
  }
}