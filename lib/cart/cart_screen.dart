import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_app/card/payment_screen.dart';
import 'package:flutter_store_app/mixin/products_mixin.dart';
import 'package:flutter_store_app/model/cart_model.dart';
import 'package:flutter_store_app/provider/cart_provider.dart';
import 'package:flutter_store_app/utils/colors.dart';
import 'package:provider/provider.dart';

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
        child: Consumer<CartProvider>(
          builder: (_, provider, __) {
            return Column(
              children: [
                const SizedBox(height: 40),
                appBar(),
                const SizedBox(height: 40),
                cartProducts(provider),
                const SizedBox(height: 40),
                totalPrice(),
                const SizedBox(height: 70),
                payButton(provider),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        const SizedBox(width: 10),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 25,
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

  Widget cartProducts(CartProvider provider) {
    if (provider.cartItems.isEmpty) {
      return const Center(
        child: Text(
          "Nenhum item no Carrinho",
          style: TextStyle(
            color: CustomColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    } else {
      return Column(
        children: List.generate(
          cart.cartItems.length,
          (index) {
            return productsCard(
              provider.cartItems[index],
              index,
              provider,
            );
          },
        ),
      );
    }
  }

  Widget productsCard(
    CartModel product,
    int index,
    CartProvider provider,
  ) {
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
              "\$${product.price!.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                InkWell(
                  onTap: () => provider.decrementPrice(product),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: CustomColors.grey300,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(Icons.remove),
                  ),
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
                InkWell(
                  onTap: () => provider.incrementQuanty(product),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: CustomColors.grey300,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(Icons.add),
                  ),
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
                  onPressed: () => removeItemDialog(index),
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
        textRow(
          "Subtotal:",
          "\$ ${cart.totalPrice.toStringAsFixed(2)}",
        ),
        const SizedBox(height: 30),
        textRow("Shipping", "\$ 5.00"),
        const Divider(),
        textRow(
          "Bag Total:",
          "\$ ${(cart.totalPrice + shipPrice).toStringAsFixed(2)}",
        ),
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

  Widget payButton(CartProvider provider) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          PaymentScreen.tag,
          arguments: PaymentScreenArgs(
            provider.totalPrice + shipPrice,
          ),
        );
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

  Future removeItemDialog(int index) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text(
            "Do you want to remove the item from the cart?",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 16,
                  color: CustomColors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                cart.removeItem(index);
                Navigator.pop(context);
              },
              child: const Text(
                "Remove",
                style: TextStyle(
                  fontSize: 16,
                  color: CustomColors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
