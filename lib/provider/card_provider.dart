import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _card = [];
  Map<String, dynamic> _currentCard = {};

  List<Map<String, dynamic>> get card => _card;
  Map<String, dynamic> get currentCard => _currentCard;

  void newCard(Map<String, dynamic> cardInfo) {
    _card.add(cardInfo);
    _currentCard = cardInfo;
    notifyListeners();
  }
}
