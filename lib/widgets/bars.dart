import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final double amount;
  final int maximum;
  final String day;

  Bar(this.amount, this.maximum, this.day);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            'R${amount.toStringAsFixed(0)}',
            style: TextStyle(fontSize: 10),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            height: 100,
            color: Colors.grey,
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: (amount / maximum * 100),
              width: 20,
              color: Colors.red,
            ),
          ),
          Text(day),
        ],
      ),
    );
  }
}
