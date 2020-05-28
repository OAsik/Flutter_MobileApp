import "dart:math";
import "../widgets/loginForm.dart";
import "package:flutter/material.dart";

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
            FocusNode()
          );
        },
        child: SingleChildScrollView(
          child: Container(
            height: deviceSize.height,
            width: deviceSize.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(7, 27, 206, 1).withOpacity(1),
                  Color.fromRGBO(154, 162, 243, 1).withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1]
              )
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 190,
                      width: 190,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/brandLogo.png"),
                          fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100.0)
                        )
                      ),
                      margin: EdgeInsets.only(
                        top: deviceSize.height * 0.1,
                        left: deviceSize.width * 0.15
                      )
                    ),
                    Container(
                      child: Text(
                        "GAME SHOP",
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.w900,
                          fontSize: 28
                        )
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white60,
                          width: 4
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 18.0,
                        horizontal: 36.0
                      ),
                      margin: EdgeInsets.only(
                        top: deviceSize.height * 0.26,
                        left: deviceSize.width * 0.18
                      ),
                      transform: Matrix4.rotationZ(6 * pi / 120),
                    )
                  ]
                ),
                LoginForm(
                  deviceSize: deviceSize,
                )
              ]
            )
          ),
        ),
      ),
    );
  }
}