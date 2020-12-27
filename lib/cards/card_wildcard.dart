import 'dart:math';

import 'package:boxofcards/cards/card_template.dart';
import 'package:boxofcards/cards/components/rents.dart';
import 'package:boxofcards/models/card_data.dart';
import 'package:flutter/material.dart';

class CardWildcard extends StatelessWidget {
  Key key;
  CardData card;
  Color color1;
  Color color2;
  bool flipped;
  List<int> rent1;
  List<int> rent2;

  CardWildcard(
      {@required this.key, @required this.card, this.flipped = false}) {
    color1 = str2clr(card.data['color1']);
    color2 = str2clr(card.data['color2']);
    rent1 = List<int>.from(card.data['rent1']);
    rent2 = List<int>.from(card.data['rent2']);
  }

  @override
  Widget build(BuildContext context) {
    return CardTemplate(
      key: key,
      child: Transform.rotate(
        angle: flipped ? pi : 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top: 3, left: 3, right: 3),
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Row(
                children: [
                  Rents(rents: rent2),
                  Rents(rents: rent1),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
