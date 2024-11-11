import 'package:flutter/material.dart';
import 'package:flutter_store_app/utils/colors.dart';

mixin HomeMixin<T extends StatefulWidget> on State<T> {
  late double mediaHeight = MediaQuery.of(context).size.height;
  late double mediaWidth = MediaQuery.of(context).size.width;
  String activeButton = "Clothes";

  List<Color> colorChange(String text) {
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
}
