import "package:flutter/material.dart";

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/brandLogo.png"),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(100.0)
          )
        )
      )
    );
  }
}