import "../widgets/appDrawer.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../screens/favoriteScreen.dart";
import "../screens/categoryScreen.dart";
import "../providers/userFavoriteProvider.dart";

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  final String userId;

  HomeScreen(
    this.userId
  );

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void initState() {
    _pages = [
      {
        "page": CategoryScreen(),
        "title": "Home"
      },
      {
        "page": FavoriteScreen(widget.userId),
        "title": "Favorites"
      }
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: Theme.of(context).iconTheme,
        leading: IconButton(
          icon: Icon(Icons.message),
          onPressed: () {},
        ),
        title: Text(_pages[_selectedPageIndex]["title"]),
        automaticallyImplyLeading: false
      ),
      endDrawer: AppDrawer(
        widget.userId,
        deviceSize
      ),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Theme.of(context).buttonColor.withOpacity(0.5),
        selectedItemColor: Theme.of(context).buttonColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Color.fromRGBO(43, 43, 43, 1),
            backgroundColor: Theme.of(context).primaryColorLight,
            icon: Icon(Icons.home),
            title: Text(_pages[_selectedPageIndex]["title"])
          ),
          BottomNavigationBarItem(
            //backgroundColor: Color.fromRGBO(43, 43, 43, 1),
            backgroundColor: Theme.of(context).primaryColorLight,
            icon: Consumer<UserFavoriteProvider>(
              builder: (ctx, userFavoriteData, _) => userFavoriteData.getUserFavoriteById(widget.userId).length == 0 ?
              Icon(Icons.star_border) :
              Icon(Icons.star)
            ),
            title: Text(_pages[_selectedPageIndex]["title"])
          )
        ]
      )
    );
  }
}