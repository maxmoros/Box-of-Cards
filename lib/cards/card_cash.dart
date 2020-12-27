import 'package:boxofcards/cards/card_template.dart';
import 'package:boxofcards/models/card_data.dart';
import 'package:flutter/material.dart';

class CardCash extends StatelessWidget {
  Key key;
  CardData card;
  Color color;
  int value;

  CardCash({this.key, this.card}) {
    color = str2clr(card.data['color']);
    value = card.data['value'];
  }

  @override
  Widget build(BuildContext context) {
    return CardTemplate(
      key: key,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black87, width: 4),
        ),
        child: Center(
          child: Text(
            '$value',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
