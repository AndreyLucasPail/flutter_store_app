import 'package:flutter/material.dart';

mixin HomeMixin<T extends StatefulWidget> on State<T> {
  late double mediaHeight = MediaQuery.of(context).size.height;
  late double mediaWidth = MediaQuery.of(context).size.width;
}
