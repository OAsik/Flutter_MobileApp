import "../widgets/accountForm.dart";
import "package:flutter/material.dart";

class CreateAccountScreen extends StatelessWidget {
  static const routeName = "/signup";

  Widget build(BuildContext context) {
    final heroTag = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
            FocusNode()
          );
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Create Your Account"),
                background: Hero(
                  tag: heroTag,
                  child: Image.asset(
                    "assets/images/shopOverview.png",
                    fit: BoxFit.cover,
                  )
                ),
              )
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(150, 150, 150, 1),
                        Color.fromRGBO(255, 255, 255, 1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 1]
                    )
                  ),
                  child: Container(   
                    margin: EdgeInsets.only(top: 40), 
                    padding: EdgeInsets.symmetric(horizontal: 50),                
                  child: AccountForm(),
                  )
                )
              ])
            )
          ]
        )
      )
    );
  }
}