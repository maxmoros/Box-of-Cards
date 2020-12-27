import 'package:boxofcards/main.dart';
import 'package:flutter/material.dart';

class CardData {
  CardType type;
  Map<String, dynamic> data;

  CardData(this.data) {
    type = str2card(data['type']);
  }
}

Color str2clr(String str) {
  switch (str) {
    case 'blue':
      return Colors.blue;
    case 'red':
      return Colors.red;
    case 'green':
      return Colors.green;
    default:
      return Colors.black;
  }
}

CardType str2card(String str) {
  switch (str) {
    case 'action':
      return CardType.action;
    case 'cash':
      return CardType.cash;
    case 'property':
      return CardType.property;
    case 'wildcard':
      return CardType.wildcard;
  }
}
