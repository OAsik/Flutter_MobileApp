import "dart:io";
import "package:intl/intl.dart";
import "../widgets/imageInput.dart";
import "../models/appException.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/userProvider.dart";
import "../helpers/methods/showDialogBox.dart";
import "../providers/authenticateProvider.dart";
import "../helpers/constants/errorMessage.dart";
import "../helpers/methods/disabledFocusNode.dart";
import "../helpers/constants/applicationConstant.dart";

class AccountForm extends StatefulWidget {
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  final _passwordController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  DateTime _birthday;
  Map<String, Object> _newUserData = {
    "fullName": "",
    "userName": "",
    "password": "",
    "avatarPicture": "",
    "birthday": ""
  };
  File _image;

  void _selectImage(File image) {
    _image = image;

    _newUserData["avatarPicture"] = _image; //Need to convert File to Image type, or looking for an alternative way. As the app is running on dummy data and not connected to an API for now, it is OK to run like this for a while --Özgür
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now()
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      else {
        setState(() {
          _birthday = pickedDate;
          _birthdayController.text = "${DateFormat.yMMMd().format(_birthday)}";
        });
      }
    });
  }

  Future<void> _saveNewUserForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    setState(() {
      _isLoading = true;
    });

    try
    {
      final newUser = Provider.of<UserProvider>(context, listen: false).createUser(_newUserData);

      await Provider.of<AuthenticateProvider>(context, listen: false).login(
        newUser.id,
        _newUserData["password"]
      );

      Navigator.of(context).pop();
    }
    on AppException catch(error)
    {
      ShowDialogBox.showDialogBox(context, error.errorMessage);
    }
    catch(error)
    {
      ShowDialogBox.showDialogBox(context, ErrorMessages.unknownError);
    }

    setState(() {
      _isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(
                color: Colors.blue
              ),
              decoration: const InputDecoration(
                labelText: "Full name..",
                labelStyle: TextStyle(
                  color: Colors.blue
                ),
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please fill your name.";
                }

                return null;
              },
              onSaved: (value) {
                _newUserData["fullName"] = value;
              }
            ),
            SizedBox(
              height: 20
            ),
            TextFormField(
              style: const TextStyle(
                color: Colors.blue
              ),
              decoration: const InputDecoration(
                labelText: "Username..",
                labelStyle: TextStyle(
                  color: Colors.blue
                ),
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please provide an application username.";
                }

                return null;
              },
              onSaved: (value) {
                _newUserData["userName"] = value;
              }
            ),
            SizedBox(
              height: 20
            ),
            TextFormField(
              style: const TextStyle(
                color: Colors.blue
              ),
              decoration: const InputDecoration(
                labelText: "Password..",
                labelStyle: TextStyle(
                  color: Colors.blue
                ),
                border: OutlineInputBorder()
              ),
              controller: _passwordController,
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "Password value cannot be null.";
                }
                else if (value.length < ApplicationConstant.passwordLength) {
                  return "Password must contain at least 5 characters";
                }

                return null;
              },
              onSaved: (value) {
                _newUserData["password"] = value;
              }
            ),
            SizedBox(
              height: 20
            ),
            TextFormField(
              style: const TextStyle(
                color: Colors.blue
              ),
              decoration: const InputDecoration(
                labelText: "Confirm Password..",
                labelStyle: TextStyle(
                  color: Colors.blue
                ),
                border: OutlineInputBorder()
              ),
              obscureText: true,
              validator: (value) {
                if (value != _passwordController.text) {
                  return "Passwords do not match. Please type your password again.";
                }

                return null;
              }
            ),
            SizedBox(
              height: 20
            ),
            TextFormField(
              focusNode: DisabledFocusNode(),
              style: const TextStyle(
                color: Colors.blue
              ),
              decoration: const InputDecoration(
                labelText: "Birthday..",
                labelStyle: TextStyle(
                  color: Colors.blue
                ),
                border: OutlineInputBorder(),
                helperText: "*optional"
              ),
              onTap: _presentDatePicker,
              controller: _birthday == null ? null : _birthdayController,
              onSaved: (_) {
                _newUserData["birthday"] = _birthday.toIso8601String();
              },
            ),
            SizedBox(
              height: 40
            ),
            ImageInput(_selectImage),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 15
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: Colors.grey
                )
              ),
              width: double.infinity,
              child: FlatButton.icon(
                onPressed: _saveNewUserForm,
                icon: Icon(
                  Icons.create,
                  color: Colors.blue
                ),
                label: Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.blue
                  ),
                ),
              ),
            )
          ]
        )
      )
    );
  }
}