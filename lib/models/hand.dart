import 'package:boxofcards/cards/cards.dart';

class Hand {
  List<Cards> hand;

  Hand({List<int> strHand}) {
    buildHand(strHand);
  }

  buildHand(List<int> strHand) {
    strHand.forEach((cardID) => hand.add(Cards.fromInt(cardID)));
  }
}
