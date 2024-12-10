import 'package:flutter/material.dart';
import 'package:flutter_store_app/provider/cart_provider.dart';
import 'package:flutter_store_app/utils/colors.dart';
import 'package:provider/provider.dart';

mixin ProdutsMixin<T extends StatefulWidget> on State<T> {
  late double mediaHeight = MediaQuery.of(context).size.height;
  late double mediaWidth = MediaQuery.of(context).size.width;
  String activeButtonHome = "Clothes";
  String activeButton = "";
  final double shipPrice = 5.0;
  bool isChecked = false;
  String check = "";
  int selecInstallments = 1;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();

  final TextEditingController streetController = TextEditingController();
  final TextEditingController houseNumController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  late final cart = Provider.of<CartProvider>(context, listen: false);

  List<Color> colorChange(String text) {
    if (activeButtonHome == text) {
      return [
        CustomColors.limedAsh,
        CustomColors.greyGreen,
        CustomColors.sage,
      ];
    } else {
      return [
        CustomColors.white,
        CustomColors.white,
        CustomColors.white,
      ];
    }
  }

  List<Color> colorChangeProduct(String text) {
    if (activeButton == text) {
      return [
        CustomColors.limedAsh,
        CustomColors.greyGreen,
        CustomColors.sage,
      ];
    } else {
      return [
        CustomColors.white,
        CustomColors.white,
        CustomColors.white,
      ];
    }
  }

  List<Map<String, dynamic>> tshirt = [
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": 78.90,
      "images": [
        "assets/camisa1.png",
        "assets/camisa12.png",
        "assets/camisa13.png",
        "assets/camisa14.png",
      ],
      "id": 1,
    },
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": 78.90,
      "images": [
        "assets/camisa2.png",
        "assets/camisa22.png",
        "assets/camisa23.png",
        "assets/camisa24.png",
      ],
      "id": 2,
    },
  ];

  List<Map<String, dynamic>> pants = [
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": 78.90,
      "images": [
        "assets/calça1.png",
        "assets/calça12.png",
        "assets/calça13.png",
        "assets/calça14.png",
      ],
      "id": 3,
    },
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": 78.90,
      "images": [
        "assets/calça2.png",
        "assets/calça22.png",
        "assets/calça23.png",
        "assets/calça24.png",
      ],
      "id": 4,
    },
  ];

  List<Map<String, dynamic>> products = [
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": 78.90,
      "images": [
        "assets/camisa1.png",
        "assets/camisa12.png",
        "assets/camisa13.png",
        "assets/camisa14.png",
      ],
      "id": 1,
    },
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": 78.90,
      "images": [
        "assets/calça1.png",
        "assets/calça12.png",
        "assets/calça13.png",
        "assets/calça14.png",
      ],
      "id": 3,
    },
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": 78.90,
      "images": [
        "assets/camisa2.png",
        "assets/camisa22.png",
        "assets/camisa23.png",
        "assets/camisa24.png",
      ],
      "id": 2,
    },
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": 78.90,
      "images": [
        "assets/calça2.png",
        "assets/calça22.png",
        "assets/calça23.png",
        "assets/calça24.png",
      ],
      "id": 4,
    },
  ];

  snackBar() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          height: 70,
          width: mediaWidth,
          decoration: BoxDecoration(
            color: CustomColors.limedAsh,
            border: Border.all(color: CustomColors.white),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: const Center(
            child: Text(
              "Select a size",
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
