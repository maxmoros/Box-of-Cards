import 'package:boxofcards/cards/card_template.dart';
import 'package:boxofcards/main.dart';
import 'package:flutter/material.dart';

import 'package:boxofcards/models/card_data.dart';

class CardAction extends StatelessWidget {
  Key key;
  CardData card;
  String action;
  IconData icon;
  String description;
  ActionType type;

  CardAction({
    @required this.key,
    @required this.card,
  }) {
    action = card.data['action'];
    icon = str2icon(action);
    description = str2description(action);
    type = str2action(action);
  }

  @override
  Widget build(BuildContext context) {
    return CardTemplate(
      key: key,
      child: Column(
        children: [
          Text(
            'Action',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
          Icon(icon, size: 42, color: Colors.black87),
          Text(
            action,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

IconData str2icon(String str) {
  switch (str) {
    case 'birthday':
      return Icons.cake;
    case 'breaker':
      return Icons.cancel;
    case 'debt':
      return Icons.account_balance;
    case 'doubleRent':
      return Icons.filter_2;
    case 'forced':
      return Icons.wifi_protected_setup;
    case 'go':
      return Icons.double_arrow;
    case 'hotel':
      return Icons.apartment;
    case 'house':
      return Icons.house;
    case 'multiRent':
      return Icons.request_quote;
    case 'no':
      return Icons.remove_circle;
    case 'rent':
      return Icons.request_quote;
    case 'sly':
      return Icons.transfer_within_a_station;
  }
}

ActionType str2action(String str) {
  switch (str) {
    case 'birthday':
      return ActionType.birthday;
    case 'breaker':
      return ActionType.breaker;
    case 'debt':
      return ActionType.debt;
    case 'doubleRent':
      return ActionType.doubleRent;
    case 'forced':
      return ActionType.forced;
    case 'go':
      return ActionType.go;
    case 'hotel':
      return ActionType.hotel;
    case 'house':
      return ActionType.house;
    case 'multiRent':
      return ActionType.multiRent;
    case 'no':
      return ActionType.no;
    case 'rent':
      return ActionType.rent;
    case 'sly':
      return ActionType.sly;
  }
}

String str2description(String str) {
  return str;
}
