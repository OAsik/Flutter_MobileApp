import "../widgets/favoriteItem.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/productProvider.dart";
import "../providers/subCategoryProvider.dart";
import "../providers/userFavoriteProvider.dart";
import "package:game_shop_demo_app/models/userFavorite.dart";
import "package:flutter_sticky_header/flutter_sticky_header.dart";

class FavoriteScreen extends StatefulWidget {
  final String userId;

  FavoriteScreen(
    this.userId
  );

  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<UserFavorite> userFavoriteList = [];
  List<String> _subCategoryIdList = [];
  String _subCategoryId = "";
  Function refreshState;

  void didChangeDependencies() {
    userFavoriteList = Provider.of<UserFavoriteProvider>(context).getUserFavoriteById(widget.userId);

    userFavoriteList.forEach((userFavorite) => {
      _subCategoryId = Provider.of<ProductProvider>(context, listen: false).getSingleProductById(userFavorite.productId).subCategoryId,

      if (_subCategoryIdList.length == 0)
      {
        _subCategoryIdList.add(_subCategoryId)
      }
      else
      {
        if (!_subCategoryIdList.contains(_subCategoryId))
        {
          _subCategoryIdList.add(_subCategoryId)
        }
      }
    });

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    refreshState() {
      //This workaround is to simply to prevent a dismissible widget from shrinking IF it is dismissed to place an order
      //GitHub conversation link: https://github.com/flutter/flutter/issues/11825#issuecomment-399789648
      //Using slidable widget (https://pub.dev/packages/flutter_slidable) probably be a better practive in this case, but I'll still stick with this workaround just because I like the design in this way
      
      setState(() {
        userFavoriteList = Provider.of<UserFavoriteProvider>(context, listen: false).getUserFavoriteById(widget.userId);

        userFavoriteList.forEach((userFavorite) => {
          _subCategoryId = Provider.of<ProductProvider>(context, listen: false).getSingleProductById(userFavorite.productId).subCategoryId,

          if (_subCategoryIdList.length == 0)
          {
            _subCategoryIdList.add(_subCategoryId)
          }
          else
          {
            if (!_subCategoryIdList.contains(_subCategoryId))
            {
              _subCategoryIdList.add(_subCategoryId)
            }
          }
        });
      });
    }
    
    return Container(
      color: Theme.of(context).primaryColor,
      child: Consumer<UserFavoriteProvider>(
        builder: (ctx, userFavoriteData, _) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: deviceSize.width * 0.1
          ),
          child: CustomScrollView(
            slivers: [
              if (userFavoriteList.length == 0)
              SliverFillRemaining(
                child: Center(
                  child: Container(
                    height: deviceSize.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No Favorite Products Yet",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).buttonColor.withOpacity(0.5)
                          )
                        )
                      ]
                    )
                  )
                )
              )
              else
              for (var subCategoryId in _subCategoryIdList)
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: deviceSize.height * 0.02
                ),
                sliver: SliverStickyHeader(
                  header: Container(
                    child: Consumer<SubCategoryProvider>(
                      builder: (ctx, subCategoryData, _) => Text(
                        subCategoryData.getSubCategoryById(subCategoryId).name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.deepOrangeAccent
                        )
                      )
                    )
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Consumer<UserFavoriteProvider>(
                        builder: (ctx, userFavoriteProvider, _) => FavoriteItem(
                          userFavoriteProvider.getUserSubCategoryFavoriteProductIdById(widget.userId, subCategoryId),
                          deviceSize,
                          widget.userId,
                          refreshState
                        )
                      )
                    ])
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}