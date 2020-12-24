import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './bars.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  int maxVal(thing) {
    var highest = 150;
    for (var item in thing) {
      if (item['amount'] > highest) {
        highest = item['amount'].round();
      }
    }
    return highest;
  }

  @override
  Widget build(BuildContext context) {
    final max = maxVal(groupedTransactionValues);

    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ...groupedTransactionValues
                .map((data) {
                  return Bar(data['amount'], max, data['day']);
                }).toList().reversed
            // this is to reverse the order of the bars so that the most recent is on the left
          ],
        ),
      ),
    );
  }
}
