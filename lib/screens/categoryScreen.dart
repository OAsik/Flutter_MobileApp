import "../widgets/productItem.dart";
import "../widgets/categoryItem.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/productProvider.dart";
import "../providers/categoryProvider.dart";

class CategoryScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      //color: Color.fromRGBO(12, 12, 11, 1).withOpacity(0.98),
      color: Theme.of(context).primaryColor,
      child: Consumer<CategoryProvider>(
        builder: (ctx, categoryData, _) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: deviceSize.width * 0.1,
            vertical: deviceSize.height * 0.03
          ),
          child: ListView.builder(
            itemCount: categoryData.allCategories.length,
            itemBuilder: (_, index) {
              if (categoryData.allCategories[index].name == "Products") {
                return SizedBox(
                  height: deviceSize.height * 0.31,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductItem(
                        productList: Provider.of<ProductProvider>(context, listen: false).getCategoryProductById(categoryData.allCategories[index].id),
                        deviceSize: deviceSize,
                      )
                    ]
                  )
                );
              }
              else {
                return Column(
                  children: [
                    CategoryItem(
                      categoryId: categoryData.allCategories[index].id,
                      categoryImage: categoryData.allCategories[index].picture,
                      categoryName: categoryData.allCategories[index].name,
                      deviceSize: deviceSize,
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.015
                    )
                  ]
                );
              }
            }
          )
        ) 
      )
    );
  }
}