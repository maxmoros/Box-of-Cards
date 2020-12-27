import 'package:boxofcards/cards/cards.dart';
import 'package:boxofcards/cards/cards_map.dart';
import 'package:boxofcards/models/card_data.dart';
import 'package:flutter/material.dart';

class PageTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Cards(
                key: Key('test1'),
                card: CardData(cardsMap[0]),
              ),
              Cards(
                key: Key('test2'),
                card: CardData(cardsMap[1]),
              ),
              Cards(
                key: Key('test3'),
                card: CardData(cardsMap[2]),
              ),
              Cards(
                key: Key('test4'),
                card: CardData(cardsMap[0]),
              ),
              // Cards(
              //   key: Key('test5'),
              //   card: CardData(cardsMap[1]),
              // ),
              // Cards(
              //   key: Key('test6'),
              //   card: CardData(cardsMap[2]),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
