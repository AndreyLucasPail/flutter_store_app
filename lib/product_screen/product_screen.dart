import 'package:flutter/material.dart';
import 'package:flutter_store_app/cart/cart_screen.dart';
import 'package:flutter_store_app/mixin/mixin.dart';
import 'package:flutter_store_app/utils/colors.dart';

class ProductScreenArgs {
  ProductScreenArgs({required this.product});

  final Map<String, dynamic>? product;
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  static const tag = "/product";

  final Map<String, dynamic> product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with Mixin {
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
            const SizedBox(height: 30),
            appBar(),
            const SizedBox(height: 40),
            productsImg(),
            const SizedBox(height: 40),
            title(),
            const SizedBox(height: 40),
            description(),
            const SizedBox(height: 40),
            sizeButtons(),
            const SizedBox(height: 40),
            checkOut(),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 30,
            width: 40,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        const SizedBox(width: 80),
        const Text(
          "Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 80),
        InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            width: 40,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: const Icon(Icons.shopping_bag_outlined),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            width: 40,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: const Icon(Icons.notifications),
          ),
        ),
      ],
    );
  }

  Widget productsImg() {
    List img = widget.product["images"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 360,
          width: 230,
          decoration: BoxDecoration(
            color: CustomColors.sage,
            image: DecorationImage(
              image: AssetImage(img[0]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  color: CustomColors.sage,
                  image: DecorationImage(
                    image: AssetImage(img[1]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  color: CustomColors.sage,
                  image: DecorationImage(
                    image: AssetImage(img[2]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  color: CustomColors.sage,
                  image: DecorationImage(
                    image: AssetImage(img[3]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Featured on Treding Product",
            style: TextStyle(
              color: CustomColors.red,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
              fontSize: 16,
            ),
          ),
        ),
        Text(
          widget.product["title"],
          style: const TextStyle(
            color: CustomColors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description:",
          style: TextStyle(
            color: CustomColors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.product["description"],
          style: const TextStyle(
            fontSize: 16,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget sizeButtons() {
    List sizes = widget.product["sizes"];
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Size:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: sizes.map((size) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      activeButton = size;
                    });
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: colorChangeProduct(size),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        size,
                        style: TextStyle(
                          color: activeButton == size
                              ? CustomColors.white
                              : CustomColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(width: 120),
        Column(
          children: [
            const Text(
              "Price:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.product["price"],
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget checkOut() {
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
