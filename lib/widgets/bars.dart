import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final double amount;
  final int maximum;
  final String day;

  Bar(this.amount, this.maximum, this.day);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          //margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                height: constraints.maxHeight * 0.15,
                width: 35,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'R${amount.toStringAsFixed(0)}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                height: constraints.maxHeight * 0.6,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  alignment: Alignment.center,
                  height: (amount / maximum * (constraints.maxHeight * 0.6)),
                  width: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                height: constraints.maxHeight * 0.15,
                child: Text(day),
              ),
            ],
          ),
        );
      },
    );
  }
}
