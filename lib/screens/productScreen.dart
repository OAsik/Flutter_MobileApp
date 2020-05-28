import "../models/product.dart";
import "../widgets/tabInput.dart";
import "../widgets/appDrawer.dart";
import "../models/subCategory.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../widgets/tabBarViewInput.dart";
import "../providers/productProvider.dart";
import "../providers/categoryProvider.dart";
import "../providers/subCategoryProvider.dart";

class ProductScreen extends StatefulWidget {
  static const routeName = "/product";
  final String userId;  

  ProductScreen(
    this.userId
  );

  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Widget> _tabWidgetList = [];
  List<Widget> _bodyWidgetList = [];
  List<SubCategory> _subCategoryList = [];
  List<Product> _productList = [];
  String _categoryId = "";
  Size deviceSize;
  bool initialLaunch = true;

  void _tabBuilder(List<SubCategory> subCategoryList, Size deviceSize) {
    if (_tabWidgetList.length == 0) {
      subCategoryList.forEach((subCategory) => {
        _tabWidgetList.add(
          TabInput(
            subCategory,
            deviceSize
          )
        )
      });
    }
  }

  void _bodyBuilder(List<SubCategory> subCategoryList, List<Product> productList, Size deviceSize) {
    if (_bodyWidgetList.length == 0) {
      subCategoryList.forEach((subCategory) => {
        _bodyWidgetList.add(
          TabBarViewInput(
            subCategory,
            productList,
            deviceSize,
            widget.userId
          )
        )
      });
    }
  }

  void didChangeDependencies() {
    if (initialLaunch) {
      //As for now application is fed with dummy data which is also defined in the application solution, the number of the CRUD operations performed on screen files are increased than the normal
      //After an API is connected to this application, most of these workload is transfered to service. I will not state this warning again seperately on every dummy provider operation

      _categoryId = ModalRoute.of(context).settings.arguments as String;
      _subCategoryList = Provider.of<SubCategoryProvider>(context, listen: false).getCategorySubCategoriesById(_categoryId);
      deviceSize = MediaQuery.of(context).size;

      _subCategoryList.forEach((subCategory) => {
        Provider.of<ProductProvider>(context, listen: false).getSubCategoryProductById(subCategory.id).toList().forEach((product) => _productList.add(product))
      });

      _tabBuilder(_subCategoryList, deviceSize);

      _bodyBuilder(_subCategoryList, _productList, deviceSize);

      setState(() {
        initialLaunch = false;
      });
    }

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final selectedCategory = Provider.of<CategoryProvider>(context, listen: false).getCategoryById(_categoryId);
    final tabLength = _subCategoryList.length;

    return DefaultTabController(
      length: tabLength,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).accentColor,
          iconTheme: Theme.of(context).iconTheme,
          title: Text(selectedCategory.name),
          bottom: TabBar(
            tabs: _tabWidgetList,
            isScrollable: true
          ),
        ),
        endDrawer: AppDrawer(
          widget.userId,
          deviceSize
        ),
        body: TabBarView(
          children: _bodyWidgetList
        )
      )
    );
  }
}