import 'package:boxofcards/cards/card_action.dart';
import 'package:boxofcards/cards/card_cash.dart';
import 'package:boxofcards/cards/card_property.dart';
import 'package:boxofcards/cards/card_wildcard.dart';
import 'package:boxofcards/cards/cards_map.dart';
import 'package:boxofcards/main.dart';
import 'package:boxofcards/models/card_data.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  Key key;
  CardData card;

  Cards({@required this.key, @required this.card});

  factory Cards.fromInt(int cardID) {
    return Cards(key: Key('$cardID'), card: CardData(cardsMap[cardID]));
  }

  @override
  Widget build(BuildContext context) {
    switch (card.type) {
      case CardType.action:
        return CardAction(key: key, card: card);
      case CardType.cash:
        return CardCash(key: key, card: card);
      case CardType.property:
        return CardProperty(key: key, card: card);
      case CardType.wildcard:
        return CardWildcard(key: key, card: card);
      default:
        return Center(child: Text('card error'));
    }
  }
}
