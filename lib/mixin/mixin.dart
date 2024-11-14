import 'package:flutter/material.dart';
import 'package:flutter_store_app/utils/colors.dart';

mixin Mixin<T extends StatefulWidget> on State<T> {
  late double mediaHeight = MediaQuery.of(context).size.height;
  late double mediaWidth = MediaQuery.of(context).size.width;
  String activeButtonHome = "Clothes";
  String activeButton = "";

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
      "price": "78,90",
      "images": [
        "assets/camisa1.png",
        "assets/camisa12.png",
        "assets/camisa13.png",
        "assets/camisa14.png",
      ],
    },
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": "78,90",
      "images": [
        "assets/camisa2.png",
        "assets/camisa22.png",
        "assets/camisa23.png",
        "assets/camisa24.png",
      ],
    },
  ];

  List<Map<String, dynamic>> pants = [
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": "78,90",
      "images": [
        "assets/calça1.png",
        "assets/calça12.png",
        "assets/calça13.png",
        "assets/calça14.png",
      ],
    },
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": "78,90",
      "images": [
        "assets/calça2.png",
        "assets/calça22.png",
        "assets/calça23.png",
        "assets/calça24.png",
      ],
    },
  ];

  List<Map<String, dynamic>> products = [
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": "78,90\$",
      "images": [
        "assets/camisa1.png",
        "assets/camisa12.png",
        "assets/camisa13.png",
        "assets/camisa14.png",
      ],
    },
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": "78,90\$",
      "images": [
        "assets/calça1.png",
        "assets/calça12.png",
        "assets/calça13.png",
        "assets/calça14.png",
      ],
    },
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": "78,90\$",
      "images": [
        "assets/camisa2.png",
        "assets/camisa22.png",
        "assets/camisa23.png",
        "assets/camisa24.png",
      ],
    },
    {
      "title": "Basic Solid Bodycon Dress",
      "description":
          "This style is suitable for youn people when they want to attend semi-formal.",
      "sizes": ["L", "M", "S", "XL"],
      "price": "78,90\$",
      "images": [
        "assets/calça2.png",
        "assets/calça22.png",
        "assets/calça23.png",
        "assets/calça24.png",
      ],
    },
  ];

  List<Map<String, dynamic>> cartItems = [];
}
