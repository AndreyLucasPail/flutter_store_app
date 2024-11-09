import 'package:flutter/material.dart';
import 'package:flutter_store_app/home/home_mixin.dart';
import 'package:flutter_store_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
          child: Container(
            height: 30,
            width: 40,
            child: Icon(Icons.drag_indicator_sharp),
          ),
        ),
        const SizedBox(width: 255),
        InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            width: 40,
            child: Icon(Icons.shopping_bag_outlined),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
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
      height: 200,
      width: mediaWidth,
      decoration: BoxDecoration(
        color: CustomColors.orange,
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  Widget rowOfButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("Botão"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Botão"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Botão"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Botão"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Botão"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Botão"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Botão"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Botão"),
          ),
        ],
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
        childAspectRatio: 0.9,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          color: CustomColors.green,
          child: Text("Item $index"),
        );
      },
    );
  }
}
