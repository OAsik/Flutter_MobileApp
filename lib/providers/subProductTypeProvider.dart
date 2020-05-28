import "../models/appException.dart";
import "../models/subProductType.dart";
import "package:flutter/material.dart";
import "../helpers/constants/errorMessage.dart";

class SubProductTypeProvider with ChangeNotifier {
  List<SubProductType> _dummyList = [
    SubProductType(
      id: "b9485923-4978-4bc4-b45f-1fa45f17e7ba",
      subProductId: "efa4d2b2-a6e8-4f5a-92e0-535b366ad6cc",
      name: "Bundle",
      picture: Image.asset("assets/images/dummyMagicBundle.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "14ea7cf6-5bd4-4fb8-ae6c-b3509a1921b6",
      subProductId: "efa4d2b2-a6e8-4f5a-92e0-535b366ad6cc",
      name: "Booster",
      picture: Image.asset("assets/images/dummyMagicBooster.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "b0db13eb-2ded-4567-a0ab-d932ef9beb06",
      subProductId: "efa4d2b2-a6e8-4f5a-92e0-535b366ad6cc",
      name: "Booster Box",
      picture: Image.asset("assets/images/dummyMagicBoosterBox.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "0d377553-ba41-4cf4-b117-daad960139d6",
      subProductId: "5eb44afc-163b-4561-adf8-00ccc0ca5aa0",
      name: "Bundle",
      picture: Image.asset("assets/images/dummyMagicBundle.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "196c6b8e-fc9f-4959-91b7-06b4c0a2301a",
      subProductId: "5eb44afc-163b-4561-adf8-00ccc0ca5aa0",
      name: "Booster Box",
      picture: Image.asset("assets/images/dummyMagicBoosterBox.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "41f9ff50-b110-45b5-922f-22000cb700a0",
      subProductId: "5eb44afc-163b-4561-adf8-00ccc0ca5aa0",
      name: "Deck",
      picture: Image.asset("assets/images/dummyMagicDeck.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "1010ccbb-07bf-4bf4-9bab-a5c178785aec",
      subProductId: "bbe584aa-41a0-4f95-8336-b0197dbee63b",
      name: "Bundle",
      picture: Image.asset("assets/images/dummyMagicBundle.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "5210d982-fa30-4e28-80bc-72bd406ac9e3",
      subProductId: "bbe584aa-41a0-4f95-8336-b0197dbee63b",
      name: "Booster Box",
      picture: Image.asset("assets/images/dummyMagicBoosterBox.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "02d09938-750b-4e45-b311-76b25efd2420",
      subProductId: "bbe584aa-41a0-4f95-8336-b0197dbee63b",
      name: "Booster",
      picture: Image.asset("assets/images/dummyMagicBooster.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "73a50808-74ae-4b87-8309-6fb7cc447b01",
      subProductId: "bbe584aa-41a0-4f95-8336-b0197dbee63b",
      name: "Deck",
      picture: Image.asset("assets/images/dummyMagicDeck.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "d5004a42-8371-4b2b-97ad-627d17e40532",
      subProductId: "9b90445c-70fa-4f12-bd49-a88bf7e51943",
      name: "Bundle",
      picture: Image.asset("assets/images/dummyMagicBundle.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "5210d982-fa30-4e28-80bc-72bd406ac9e3",
      subProductId: "9b90445c-70fa-4f12-bd49-a88bf7e51943",
      name: "Booster Box",
      picture: Image.asset("assets/images/dummyMagicBoosterBox.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "7176efaf-1aef-42f2-bc5c-f45690043577",
      subProductId: "06940d15-1fe1-4a03-a9af-7998a54354d5",
      name: "Bundle",
      picture: Image.asset("assets/images/dummyMagicBundle.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "b3568489-8e54-47c9-8cfb-79c78f306c34",
      subProductId: "06940d15-1fe1-4a03-a9af-7998a54354d5",
      name: "Booster",
      picture: Image.asset("assets/images/dummyMagicBooster.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "41351288-5085-47a7-87f2-b76947638f0d",
      subProductId: "06940d15-1fe1-4a03-a9af-7998a54354d5",
      name: "Booster Box",
      picture: Image.asset("assets/images/dummyMagicBoosterBox.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "2880521b-8b7e-420a-b660-b336b010181b",
      subProductId: "cc486800-52fc-4910-883d-c3c38b2d290b",
      name: "Bundle",
      picture: Image.asset("assets/images/dummyMagicBundle.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "f07e0cb4-7f44-4f09-b02a-bf0586a24741",
      subProductId: "cc486800-52fc-4910-883d-c3c38b2d290b",
      name: "Booster Box",
      picture: Image.asset("assets/images/dummyMagicBoosterBox.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "873fca8e-0f74-4aea-942f-c08c6f43b044",
      subProductId: "4b5de14f-6255-46cf-adc7-52b21ba1dc97",
      name: "Bundle",
      picture: Image.asset("assets/images/dummyMagicBundle.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "8301137b-0fdf-4918-81f6-37694d0abc70",
      subProductId: "4b5de14f-6255-46cf-adc7-52b21ba1dc97",
      name: "Booster Box",
      picture: Image.asset("assets/images/dummyMagicBoosterBox.png", fit: BoxFit.fill, width: 80, height: 80)
    ),
    SubProductType(
      id: "c82487f9-bd90-46ee-8eca-cd99eb77098c",
      subProductId: "4b5de14f-6255-46cf-adc7-52b21ba1dc97",
      name: "Guild Kit",
      picture: Image.asset("assets/images/dummyMagicGuildKit.png", fit: BoxFit.fill, width: 80, height: 80)
    )
  ];

  List<SubProductType> get allSubProductTypes {
    return [..._dummyList];
  }

  List<SubProductType> getSubProductSubProductTypesById(String subProductId) {
    try
    {
      return _dummyList.where((subProductType) => subProductType.subProductId == subProductId).toList();
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotCreated);
    }
  }
}