import 'package:flutter/material.dart';
import 'package:flutter_store_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

mixin CartMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();

    final cart = Provider.of<CartProvider>(context);
  }
}
