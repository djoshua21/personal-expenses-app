import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final double amount;

  Bar(this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      height: 100,
      color: Colors.red,
      alignment: Alignment.bottomCenter,

      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 20,
        // color: Colors.blue,
        decoration: BoxDecoration(color: Colors.blue),

        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            'R${amount.toString()}',
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
