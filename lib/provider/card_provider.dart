import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _card = [];

  List<Map<String, dynamic>> get card => _card;

  void newCard(Map<String, dynamic> cardInfo) {
    _card.add(cardInfo);
    notifyListeners();
  }
}
