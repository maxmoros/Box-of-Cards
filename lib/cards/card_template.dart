import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  Key key;
  Widget child;

  CardTemplate({@required this.key, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 140,
        width: 100,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.black87, width: 2),
        ),
        child: child,
      ),
    );
  }
}
