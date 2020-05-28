import "../models/subProduct.dart";
import "../models/appException.dart";
import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import "../helpers/constants/errorMessage.dart";

class SubProductProvider with ChangeNotifier {
  List<SubProduct> _dummyList = [
    SubProduct(
      id: "efa4d2b2-a6e8-4f5a-92e0-535b366ad6cc",
      productId: "e9de0e8a-0291-4325-8e3d-b63aa6031f09",
      name: "Ikoria: Lair of Behemoths",
      picture: Image.asset("assets/images/dummyIkoria.png", fit: BoxFit.fill, width: 100, height: 100)
    ),
    SubProduct(
      id: "5eb44afc-163b-4561-adf8-00ccc0ca5aa0",
      productId: "e9de0e8a-0291-4325-8e3d-b63aa6031f09",
      name: "Theros Beyond Death",
      picture: Image.asset("assets/images/dummyTheros.png", fit: BoxFit.fill, width: 100, height: 100)
    ),
    SubProduct(
      id: "bbe584aa-41a0-4f95-8336-b0197dbee63b",
      productId: "e9de0e8a-0291-4325-8e3d-b63aa6031f09",
      name: "Throne of Eldraine",
      picture: Image.asset("assets/images/dummyEldraine.png", fit: BoxFit.fill, width: 100, height: 100)
    ),
    SubProduct(
      id: "9b90445c-70fa-4f12-bd49-a88bf7e51943",
      productId: "e9de0e8a-0291-4325-8e3d-b63aa6031f09",
      name: "Core Set 2020",
      picture: Image.asset("assets/images/dummy2020.png", fit: BoxFit.fill, width: 100, height: 100)
    ),
    SubProduct(
      id: "06940d15-1fe1-4a03-a9af-7998a54354d5",
      productId: "e9de0e8a-0291-4325-8e3d-b63aa6031f09",
      name: "War of the Spark",
      picture: Image.asset("assets/images/dummySpark.png", fit: BoxFit.fill, width: 100, height: 100)
    ),
    SubProduct(
      id: "cc486800-52fc-4910-883d-c3c38b2d290b",
      productId: "e9de0e8a-0291-4325-8e3d-b63aa6031f09",
      name: "Ravnica Allegiance",
      picture: Image.asset("assets/images/dummyAllegiance.png", fit: BoxFit.fill, width: 100, height: 100)
    ),
    SubProduct(
      id: "4b5de14f-6255-46cf-adc7-52b21ba1dc97",
      productId: "e9de0e8a-0291-4325-8e3d-b63aa6031f09",
      name: "Guild of Ravnica",
      picture: Image.asset("assets/images/dummyGuild.png", fit: BoxFit.fill, width: 100, height: 100)
    ),
    SubProduct(
      id: "d369fb3c-fa01-4bf0-99e3-cd30aac616f2",
      productId: "e9de0e8a-0291-4325-8e3d-b63aa6031f09",
      name: "Core Set 2019",
      picture: Image.asset("assets/images/dummy2019.png", fit: BoxFit.fill, width: 100, height: 100)
    ),
    SubProduct(
      id: "5dcc9f7c-9f71-4493-804a-e5a5b3355658",
      productId: "e9de0e8a-0291-4325-8e3d-b63aa6031f09",
      name: "Final Adventure",
      picture: Image.asset("assets/images/dummyAdventure.png", fit: BoxFit.fill, width: 100, height: 100)
    ),
    SubProduct(
      id: "16bf604f-83d8-41db-9b9e-40542ae3edd6",
      productId: "e9de0e8a-0291-4325-8e3d-b63aa6031f09",
      name: "Flash of Ferocity",
      picture: Image.asset("assets/images/dummyFerocity.png", fit: BoxFit.fill, width: 100, height: 100)
    )
  ];

  List<SubProduct> get allSubProducts {
    return [..._dummyList];
  }

  List<SubProduct> getSubProductsById(String productId) {
    try
    {
      return _dummyList.where((subProduct) => subProduct.productId == productId).toList();
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotFound);
    }
  }

  SubProduct getSingleSubProductById(String id) {
    return _dummyList.firstWhere((subProduct) => subProduct.id == id, orElse: () => throw AppException(ErrorMessages.userNotFound));
  }
}