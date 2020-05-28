import "dart:io";
import "../models/user.dart";
import "package:uuid/uuid.dart";
import "../models/appException.dart";
import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import "../helpers/constants/errorMessage.dart";

class UserProvider with ChangeNotifier {
  List<User> _dummyList = [
    User(
      id: "af5b63af-2923-438e-a4ec-43f5e0acf06d",
      fullName: "Özgür Aşık",
      userName: "RaZzLe",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-04-29 00:00:00"),
      //avatarPicture: "https://cdn.shopify.com/s/files/1/0318/2649/products/41PRQUiNFAL.jpg",
      avatarPicture: Image.asset("assets/images/dummyUserAvatar1.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1988-03-14 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "2b8ad7f7-335f-4e59-b670-7d1fb5c67492",
      fullName: "Fatih GözüBek",
      userName: "Coriolanus",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar2.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1987-04-15 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "f0b0c2c7-26f0-450f-b622-ea807598cfb0",
      fullName: "Büşra Seçmeoğlu",
      userName: "The Kekistani",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar3.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1987-05-16 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "60ae9182-2c9c-466c-ab84-2902396752e3",
      fullName: "Dilara Aras",
      userName: "Blackrooth",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar4.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1987-06-17 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "c1dba98e-58a2-427a-8368-eb4667576b2e",
      fullName: "Mehmet Şık",
      userName: "Cruz",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar5.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1987-07-18 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "c1dba98e-58a2-427a-8368-eb4667576b2e",
      fullName: "Zeynep Uygur",
      userName: "JackChen",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar6.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1987-08-19 00:00:00"),
      isLookingForParty: false
    ),
    User(
      id: "366ee922-33c8-464f-b3e6-cc99faaa1ad6",
      fullName: "Özer Zorlu",
      userName: "Sapere Aude",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar7.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1987-09-20 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "98fb8346-4421-42b1-b187-b6fa21517d0c",
      fullName: "Hakkı Kara",
      userName: "Smugg",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar8.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1987-10-21 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "fc0c4d8c-f8e2-4229-a17b-6cf63cdbb589",
      fullName: "Emre Öztürk",
      userName: "Night Wolf",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar9.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1987-11-22 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "d240dc9b-9834-4bbb-ae3a-fa825577f547",
      fullName: "Mukaddes Yücel",
      userName: "Phantom03",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar10.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1987-12-23 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "8547dee2-b576-47cc-be84-55fe51ac4298",
      fullName: "Yunus Emre Karadağ",
      userName: "Brohog",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar11.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1988-01-24 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "16eea4e6-32db-4271-8f96-e9438347087c",
      fullName: "Bahadırhan Keleş",
      userName: "Amatus",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar12.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1988-02-25 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "e19dbbe8-89f0-47d0-8658-537dec5b338a",
      fullName: "Elif Öztürk",
      userName: "ArchDuke",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar13.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1988-03-26 00:00:00"),
      isLookingForParty: true
    ),
    User(
      id: "0c432eb6-045f-4307-a907-acb12a75f540",
      fullName: "Murat Demirci",
      userName: "Born to Flex",
      password: "?Ab123",
      signUpDate: DateTime.parse("2020-05-28 00:00:00"),
      avatarPicture: Image.asset("assets/images/dummyUserAvatar14.png", fit: BoxFit.fill, width: 130, height: 130),
      birthday: DateTime.parse("1988-04-27 00:00:00"),
      isLookingForParty: true
    )
  ];
  
  List<User> get allUsers {
    return [..._dummyList];
  }

  User getUserByName(String userName) {
    return _dummyList.firstWhere((user) => user.userName == userName, orElse: () => throw AppException(ErrorMessages.userNotFound));
  }

  User getSingleUserById(String userId) {
    return _dummyList.firstWhere((user) => user.id == userId, orElse: () => throw AppException(ErrorMessages.userNotFound));
  }

  Future<void> getAvailableUsers(String id) async {
    List<User> availableUsers = _dummyList.where((user) => user.isLookingForParty && user.id != id).toList();

    _dummyList = availableUsers;

    //notifyListeners();
  }

  User createUser(Map<String, Object> newUserData) {
    //Sending a HTTP Post request here after API established. In the mean time, below dummy approach is used
    
    try
    {
      Uuid uuid = Uuid();

      final user = User(
        id: uuid.v4(),
        fullName: newUserData["fullName"],
        userName: newUserData["userName"],
        password: newUserData["password"],
        signUpDate: DateTime.now(),
        avatarPicture: newUserData["avatarPicture"],
        birthday: DateTime.parse(newUserData["birthday"]),
        isLookingForParty: false
      );

      _dummyList.add(user);

      notifyListeners();

      return user;
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotCreated);
    }
  }

  void updateUser(String id, User updatedUser) {
    final userIndex = _dummyList.indexWhere((user) => user.id == id);

    _dummyList[userIndex] = updatedUser;

    notifyListeners();
  }
}