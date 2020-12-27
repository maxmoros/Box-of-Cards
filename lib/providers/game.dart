import 'dart:async';

import 'package:boxofcards/main.dart';
import 'package:boxofcards/models/hand.dart';
import 'package:boxofcards/models/user.dart';
import 'package:flutter/material.dart';

import 'package:boxofcards/cards/cards.dart';

class Game with ChangeNotifier {
  Key key;
  List<int> deck;
  String gid;
  int playerCount;
  int turnPosition;
  List<User> players;
  List<Hand> hands;

  bool gameStarted = false;

  Completer<bool> deckLoaded;

  Game({this.key, this.gid}) {
    deckLoaded = getGameData();
  }

  Completer<bool> getGameData() {
    Completer<bool> _deckLoaded = Completer<bool>();
    gamesRef.doc(gid).snapshots().listen((gameDoc) {
      if (!gameDoc.exists) _deckLoaded.complete(false);
      turnPosition = gameDoc.data()['turnPosition'];
      deck = List<int>.from(gameDoc.data()['deck']);
      if (!gameStarted) {
        playerCount = gameDoc.data()['playerCount'];
        players = getPlayers(List<String>.from(gameDoc.data()['players']));
      }
      gameStarted = gameDoc.data()['gameStarted'];
      if (!_deckLoaded.isCompleted) _deckLoaded.complete(true);
    });
    return _deckLoaded;
  }

  List<User> getPlayers(List<String> playersData) {
    playersData.forEach((playerID) async {
      players.add(User.fromDocument(await usersRef.doc(playerID).get()));
    });
  }
}
