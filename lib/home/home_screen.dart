import 'package:flutter/material.dart';
import 'package:flutter_store_app/home/home_mixin.dart';
import 'package:flutter_store_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const tag = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(),
      ),
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
            discountCard(),
            const SizedBox(height: 30),
            rowOfButtons(),
            const SizedBox(height: 30),
            productsGrid(),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {},
          child: const SizedBox(
            height: 30,
            width: 40,
            child: Icon(Icons.drag_indicator_sharp),
          ),
        ),
        const SizedBox(width: 255),
        InkWell(
          onTap: () {},
          child: const SizedBox(
            height: 30,
            width: 40,
            child: Icon(Icons.shopping_bag_outlined),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const SizedBox(
            height: 30,
            width: 40,
            child: Icon(Icons.notifications),
          ),
        ),
      ],
    );
  }

  Widget discountCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 200,
      width: mediaWidth,
      decoration: BoxDecoration(
        color: CustomColors.orange,
        borderRadius: BorderRadius.circular(16.0),
        image: const DecorationImage(
          image: AssetImage("assets/ads.jpeg"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "50\$ OFF",
            style: TextStyle(
              fontSize: 20,
              color: CustomColors.white,
            ),
          ),
          const Text(
            "ON EVERYTHING TODAY",
            style: TextStyle(
              color: CustomColors.white,
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Clothes"),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowOfButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildButton("Clothes"),
          buildButton("Shoes"),
          buildButton("Men"),
          buildButton("Women"),
          buildButton("Kids"),
        ],
      ),
    );
  }

  Widget buildButton(String text) {
    return InkWell(
      onTap: () {
        setState(() {
          activeButton = text;
        });
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colorChange(text),
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: activeButton == text
                  ? CustomColors.white
                  : CustomColors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget productsGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.45,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return productCard();
      },
    );
  }

  Widget productCard() {
    return Column(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: CustomColors.limedAsh,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        const Row(
          children: [
            Column(
              children: [
                Text(
                  "Sportswear",
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Cinzel dresses",
                  style: TextStyle(
                    color: CustomColors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Icon(
              Icons.star,
              color: CustomColors.yellowAccent,
            ),
            Text("4.5"),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "\$64.90",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      CustomColors.limedAsh,
                      CustomColors.greyGreen,
                      CustomColors.sage,
                    ],
                  ),
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  color: CustomColors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
