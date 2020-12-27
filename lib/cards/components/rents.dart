import 'package:flutter/material.dart';

class Rents extends StatelessWidget {
  Key key;
  List<int> rents;
  double fontSize;

  Rents({this.key, @required this.rents, this.fontSize = 20});

  List<Text> getRents() {
    List<Text> texts = [];
    for (int i = 0; i < rents.length; i++)
      texts.add(Text(
        '\$${rents[i]}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ));
    return texts;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getRents(),
      ),
    );
  }
}
