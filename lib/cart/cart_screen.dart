import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_app/mixin/products_mixin.dart';
import 'package:flutter_store_app/model/cart_model.dart';
import 'package:flutter_store_app/utils/colors.dart';

class CartScreenArgs {
  CartScreenArgs({this.product});

  List<Map<String, dynamic>>? product;
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, this.product});

  static const tag = "/cart";

  final List<Map<String, dynamic>>? product;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with ProdutsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.snow,
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            appBar(),
            const SizedBox(height: 40),
            cartProducts(),
            const SizedBox(height: 40),
            totalPrice(),
            const SizedBox(height: 70),
            payButton(),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        const SizedBox(width: 10),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              color: CustomColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 0,
                  color: CustomColors.grey,
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
            ),
          ),
        ),
        const SizedBox(width: 100),
        const Text(
          "My Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget cartProducts() {
    return Column(
      children: List.generate(
        cart.cartItems.length,
        (index) {
          return productsCard(cart.cartItems[index], index);
        },
      ),
    );
  }

  Widget productsCard(CartModel product, int index) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
              image: AssetImage(product.img!),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              product.title!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "\$${product.totalPrice}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: CustomColors.grey300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 10),
                Text(
                  "${product.quantity}",
                  style: const TextStyle(
                    color: CustomColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: CustomColors.grey300,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 90),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    product.size!,
                    style: const TextStyle(
                      color: CustomColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () => cart.removeItem(index),
                  icon: const Icon(
                    Icons.delete,
                    color: CustomColors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget totalPrice() {
    return Column(
      children: [
        textRow("Subtotal:", "${cart.totalPrice}"),
        const SizedBox(height: 30),
        textRow("Shipping", "\$ 5.00"),
        const Divider(),
        textRow("Bag Total:", "\$ ${cart.totalPrice + 5.0}"),
      ],
    );
  }

  Widget textRow(String type, String number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: const TextStyle(
            color: CustomColors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            fontSize: 18,
          ),
        ),
        Text(
          number,
          style: const TextStyle(
            color: CustomColors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget payButton() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CartScreen.tag);
      },
      child: Container(
        height: 50,
        width: mediaWidth * 0.9,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomColors.limedAsh,
              CustomColors.greyGreen,
              CustomColors.sage,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        child: const Center(
          child: Text(
            "Checkout",
            style: TextStyle(
              color: CustomColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
