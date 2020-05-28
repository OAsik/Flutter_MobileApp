import "../screens/homeScreen.dart";
import "../models/appException.dart";
import "package:flutter/material.dart";
import "../providers/userProvider.dart";
import "package:provider/provider.dart";
import "../screens/createAccountScreen.dart";
import "../helpers/methods/showDialogBox.dart";
import "../providers/authenticateProvider.dart";
import "../helpers/constants/errorMessage.dart";
import "../helpers/constants/applicationConstant.dart";

class LoginForm extends StatefulWidget {
  final Size deviceSize;

  const LoginForm({
    Key key,
    @required this.deviceSize
  }) : super(key: key);

  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  Map<String, String> _userData = {
    "userName": "",
    "password": ""
  };

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    setState(() {
      _isLoading = true;
    });

    try
    {
      final userId = Provider.of<UserProvider>(context, listen: false).getUserByName(_userData["userName"]).id;

      await Provider.of<AuthenticateProvider>(context, listen: false).login(
        userId,
        _userData["password"]
      );
    }
    on AppException catch(error)
    {
      ShowDialogBox.showDialogBox(context, error.errorMessage);
    }
    catch(_)
    {
      ShowDialogBox.showDialogBox(context, ErrorMessages.unknownError);
    }
    
    setState(() {
      _isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 70
      ),
      height: widget.deviceSize.height * 0.49,
      width: widget.deviceSize.width * 0.68,
      child: Card(
        margin: EdgeInsets.only(
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        elevation: 0,
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              right: 15,
              left: 15,
              bottom: 5
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white60,
                width: 4
              ),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.white70
                    ),
                    decoration: InputDecoration(
                      labelText: "User name:",
                      labelStyle: const TextStyle(
                        color: Colors.white70
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white70
                        )
                      )
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "User name is empty!";
                      }

                      return null;
                    },
                    onSaved: (value) {
                      _userData["userName"] = value;
                    },
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.white70
                    ),
                    decoration: InputDecoration(
                      labelText: "Password:",
                      labelStyle: const TextStyle(
                        color: Colors.white70
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white70
                        )
                      )
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty || value.length < ApplicationConstant.passwordLength) {
                        return "Password is incorrect. Try again!";
                      }

                      return null;
                    },
                    onSaved: (value) {
                      _userData["password"] = value;
                    },
                  ),
                  SizedBox(
                    height: 20
                  ),
                  RaisedButton(
                    onPressed: _submit,
                    child: _isLoading ?
                    CircularProgressIndicator() :
                    const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white70
                      )
                    ),
                    color: Colors.transparent.withOpacity(0.15),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Do not have an account yet?",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w800
                    )
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        CreateAccountScreen.routeName,
                        arguments: "createAccount"
                      );
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white70
                      )
                    ),
                    color: Colors.transparent.withOpacity(0.1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    },
                    child: const Text(
                      "Continue without Sign In",
                      style: TextStyle(
                        color: Colors.white70
                      )
                    ),
                    color: Colors.transparent.withOpacity(0.08),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  )
                ]
              )
            )
          )
        )
      )
    );
  }
}