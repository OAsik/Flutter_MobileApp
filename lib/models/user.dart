import "package:flutter/material.dart";

class User {
  String id;
  String fullName;
  String userName;
  String password;
  DateTime signUpDate;
  Image avatarPicture;
  DateTime birthday;
  bool isLookingForParty;

  User({
    @required this.id,
    @required this.fullName,
    @required this.userName,
    @required this.password,
    @required this.signUpDate,
    this.avatarPicture,
    this.birthday,
    @required this.isLookingForParty
  });
}