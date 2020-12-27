import 'package:boxofcards/models/user.dart';
import 'package:boxofcards/screens/page_home.dart';
import 'package:boxofcards/screens/page_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FA;
import 'package:flutter/material.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
User currentUser;
FA.User user;

bool ignoreDev = false;

final gamesRef = firestore.collection('games');
final usersRef = firestore.collection('users');
final statsRef = firestore.collection('settings').doc('webstats');

enum CardType { property, wildcard, cash, action }
enum ActionType {
  birthday,
  breaker,
  debt,
  doubleRent,
  forced,
  go,
  hotel,
  house,
  multiRent,
  no,
  rent,
  sly,
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.green,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green[900],
        backgroundColor: Colors.green[100],
        primarySwatch: Colors.blue,
      ),
      home: PageTable(),
    );
  }
}

Future transactionUpdateSet(
    {@required DocumentReference docRef,
    @required Map<String, dynamic> payload,
    bool forceSet = false}) async {
  return docRef.set(payload, SetOptions(merge: true));
}

Future transactionSet(
    {@required DocumentReference docRef,
    @required Map<String, dynamic> payload}) {
  return transactionUpdateSet(docRef: docRef, payload: payload, forceSet: true);
}

DocumentReference getUserRef({@required String uid}) {
  return usersRef.doc(uid);
}

sendStat(Map<String, dynamic> payload) {
  if (!ignoreDev) statsRef.set(payload, SetOptions(merge: true));
}

printRed(dynamic data) {
  print('\x1B[31m$data\x1B[0m');
}

printGrn(dynamic data) {
  print('\x1B[32m$data\x1B[0m');
}

printYlw(dynamic data) {
  print('\x1B[33m$data\x1B[0m');
}

printBlu(dynamic data) {
  print('\x1B[34m$data\x1B[0m');
}

printMag(dynamic data) {
  print('\x1B[35m$data\x1B[0m');
}

printCyn(dynamic data) {
  print('\x1B[36m$data\x1B[0m');
}
