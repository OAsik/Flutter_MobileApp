import "./screens/homeScreen.dart";
import "./screens/loginScreen.dart";
import "./screens/splashScreen.dart";
import "./screens/productScreen.dart";
import 'package:flutter/material.dart';
import "./providers/userProvider.dart";
import "package:provider/provider.dart";
import "./screens/userOrderScreen.dart";
import "./screens/subProductScreen.dart";
import "./providers/productProvider.dart";
import "./screens/userProfileScreen.dart";
import "./providers/userOderProvider.dart";
import "./providers/categoryProvider.dart";
import "helpers/methods/themeChanger.dart";
import "./screens/availableUserScreen.dart";
import "./screens/createAccountScreen.dart";
import "./providers/subProductProvider.dart";
import "./screens/subProductTypeScreen.dart";
import "./providers/subCategoryProvider.dart";
import "./providers/userFavoriteProvider.dart";
import "./providers/authenticateProvider.dart";
import "./screens/subProductDetailScreen.dart";
import "./providers/subProductTypeProvider.dart";
import "./providers/subProductDetailProvider.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthenticateProvider()
        ),
        ChangeNotifierProvider.value(
          value: UserProvider()
        ),
        ChangeNotifierProvider.value(
          value: CategoryProvider()
        ),
        ChangeNotifierProvider.value(
          value: SubCategoryProvider()
        ),
        ChangeNotifierProvider.value(
          value: ProductProvider()
        ),
        ChangeNotifierProvider.value(
          value: SubProductProvider()
        ),
        ChangeNotifierProvider.value(
          value: SubProductTypeProvider()
        ),
        ChangeNotifierProvider.value(
          value: SubProductDetailProvider()
        ),
        ChangeNotifierProvider.value(
          value: UserFavoriteProvider()
        ),
        ChangeNotifierProvider.value(
          value: UserOrderProvider()
        )
      ],
      child: Consumer<AuthenticateProvider>(
        builder: (ctx, authData, _) => ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(),
          child: _MaterialAppWithTheme(authData),
        )
      )
    );
  }
}

class _MaterialAppWithTheme extends StatelessWidget {
  final AuthenticateProvider authData;

  _MaterialAppWithTheme(
    this.authData,
  );

  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      title: 'Game Shop Demo',
      theme: theme.getTheme(),
      home: authData.isLogedin ?
      HomeScreen(authData.userId) :
      FutureBuilder(
        future: authData.autoLogin(),
        builder: (ctx, authResult) => authResult.connectionState == ConnectionState.waiting ?
        SplashScreen():
        LoginScreen()
      ),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(authData.userId),
        CreateAccountScreen.routeName: (ctx) => CreateAccountScreen(),
        ProductScreen.routeName: (ctx) => ProductScreen(authData.userId),
        SubProductScreen.routeName: (ctx) => SubProductScreen(authData.userId),
        SubProductDetailScreen.routeName: (ctx) => SubProductDetailScreen(authData.userId),
        SubProductTypeScreen.routeName: (ctx) => SubProductTypeScreen(authData.userId),
        UserOrderScreen.routeName: (ctx) => UserOrderScreen(authData.userId),
        UserProfileScreen.routeName: (ctx) => UserProfileScreen(authData.userId),
        AvailableUserScreen.routeName: (ctx) => AvailableUserScreen(authData.userId)
      },
    );
  }
}