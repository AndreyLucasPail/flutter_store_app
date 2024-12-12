import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _card = [];
  Map<String, dynamic> _currentCard = {};
  Map<String, dynamic> _currentAddress = {};
  final List<Map<String, dynamic>> _address = [];

  List<Map<String, dynamic>> get card => _card;
  Map<String, dynamic> get currentCard => _currentCard;
  List<Map<String, dynamic>> get address => _address;
  Map<String, dynamic> get currentAddress => _currentAddress;

  void newCard(Map<String, dynamic> cardInfo) {
    _card.add(cardInfo);
    _currentCard = cardInfo;
    notifyListeners();
  }

  void newAddress(Map<String, dynamic> addressInfo) {
    _address.add(addressInfo);
    _currentAddress = addressInfo;
    notifyListeners();
  }
}
