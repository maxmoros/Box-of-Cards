import 'dart:async';

import 'package:boxofcards/main.dart';
import 'package:boxofcards/models/user.dart';
import 'package:boxofcards/screens/page_create_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FA;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  BuildContext context;
  BuildContext appContext;
  bool showTutorial = false;
  FA.UserCredential auth;
  FA.User cUser;
  final FA.FirebaseAuth firebaseAuth = FA.FirebaseAuth.instance;
  FA.GoogleAuthProvider googleAuthProvider = FA.GoogleAuthProvider();
  StreamSubscription<FA.User> authListener;

  String errorLabel = 'null';

  Completer loggedIn = Completer<bool>();

  Auth({this.context}) {
    //printCyn('Init Auth');
    authListener = signInListener();
    Future.delayed(Duration(seconds: 2)).then((_) => checkSignedin());
  }

  @override
  dispose() {
    authListener.cancel();
    super.dispose();
  }

  logout() async {
    //printCyn('logout');
    loggedIn = Completer<bool>();
    firebaseAuth.signOut();
    notifyListeners();
    printRed('***********   LOGOUT   *************');
  }

  checkSignedin() async {
    //printCyn('checkSignedin');
    user = firebaseAuth.currentUser;
    firebaseCheckUser(
        appleLogin: user.providerData.isNotEmpty &&
            user.providerData[0].providerId == 'apple.com');
  }

  signInListener() {
    //printCyn('anonSignInListener');
    return firebaseAuth.authStateChanges().listen((_user) async {
      printRed('Anon Listener fired ${_user?.uid}');
      user = _user;
      if (_user == null) return;
      if (_user.isAnonymous) {
        printRed('is Anon fired : ${_user.uid}');
        await checkIfNewUser(_user.uid);
        notifyListeners();
      } else {
        printRed('real User fired : ${_user.uid}');
        await firebaseCheckUser();
      }
    });
  }

  checkIfNewUser(String _uid) async {
    //printCyn('checkIfNewUser');
    // if (_uid != null) {
    //   DocumentSnapshot userDoc = await anonUsersRef.doc(_uid).get();
    //   if (!userDoc.exists) {
    //     sendStat({
    //       'newAnonUser': FieldValue.increment(1),
    //       'anonStamp': FieldValue.arrayUnion([DateTime.now()])
    //     });
    //     if (!ignoreDev)
    //       await anonUsersRef.doc(_uid).set({
    //         'gender': 'web',
    //       });
    //   }
    //   currentUser = User(uid: _uid, gender: SexOption.web, isAnon: true);
    //   if (!loggedIn.isCompleted) loggedIn?.complete(true);
    // }
  }

  Future loginGoogle() async {
    //printCyn('loginGoogle ${firebaseAuth?.currentUser}');
    await firebaseAuth.setPersistence(FA.Persistence.LOCAL);
    auth = await firebaseAuth.signInWithPopup(googleAuthProvider);
  }

  firebaseCheckUser({bool appleLogin = false}) async {
    bool passed = await createUserInFirestore(appleLogin: appleLogin);
    if (!passed) logout();
  }

  createUserInFirestore({bool appleLogin = false}) async {
    //printCyn('createUserInFirestore');
    DocumentSnapshot userDoc = await getUserRef(uid: user.uid).get();
    bool _appleNameNull = false;
    printYlw('userDoc null ? ${userDoc == null}');
    if (!userDoc.exists) {
      print('Creating new user');
      final _newUser = await Navigator.push(appContext ?? context,
          MaterialPageRoute(builder: (ctx) => PageCreateUser()));
      if (_newUser == null) return false;
      await transactionUpdateSet(
          docRef: getUserRef(uid: user.uid),
          payload: {
            "id": user.uid,
            "username": _newUser['username'].toString(),
            "usernameUpper": _newUser['username'].toString().toUpperCase(),
            "photoUrl": _newUser[''],
            "email": user.email,
            "displayName": _newUser['username'].toString(),
            "timestamp": DateTime.now(),
          },
          forceSet: true);
      userDoc = await getUserRef(uid: user.uid).get();
    } else {
      print('User already exists');
    }
    currentUser = User.fromDocument(userDoc);
    if (!loggedIn.isCompleted) loggedIn?.complete(true);
    return true;
  }
}
