import 'package:flutter/material.dart';
import 'package:flutter_store_app/cart/cart_screen.dart';
import 'package:flutter_store_app/home/home_screen.dart';
import 'package:flutter_store_app/product_screen/product_screen.dart';
import 'package:flutter_store_app/splash/splash_screen.dart';

class AppRoutes {
  static Route genereteRoutes(RouteSettings settings) {
    Widget screen = getScreenNullable(settings) ?? const SplashScreen();

    return MaterialPageRoute(builder: (context) => screen, settings: settings);
  }

  static Widget? getScreenNullable(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.tag:
        return const SplashScreen();
      case HomeScreen.tag:
        return const HomeScreen();
      case ProductScreen.tag:
        ProductScreenArgs args = settings.arguments as ProductScreenArgs;

        return ProductScreen(
          product: args.product!,
        );
      case CartScreen.tag:
        //CartScreenArgs arg = settings.arguments as CartScreenArgs;

        return CartScreen();
      default:
        return null;
    }
  }
}
