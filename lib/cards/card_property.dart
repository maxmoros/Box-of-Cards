import 'package:boxofcards/cards/card_template.dart';
import 'package:boxofcards/cards/components/rents.dart';
import 'package:flutter/material.dart';

import 'package:boxofcards/main.dart';
import 'package:boxofcards/models/card_data.dart';

class CardProperty extends StatelessWidget {
  Key key;
  CardData card;
  Color color;
  List<int> rent;

  CardProperty({
    this.key,
    @required this.card,
  }) {
    color = str2clr(card.data['color']);
    rent = List<int>.from(card.data['rent']);
  }

  @override
  Widget build(BuildContext context) {
    return CardTemplate(
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Rents(rents: rent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
