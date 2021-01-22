import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function itemDel;

  TransactionList(this.transactions, this.itemDel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
        children: <Widget>[
          Text('No Transactions Added'),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.fill,
            ),
          )
        ],
      )
          : ListView.builder(
        itemBuilder: (cItem, index) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Card(
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transactions[index].title,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
                        ),
                        Text(
                          DateFormat('E dd/MM/yyyy')
                              .format(transactions[index].date),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      'R ${transactions[index].amount.toStringAsFixed(2)}',
                      //string interpolation !!
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme
                            .of(context)
                            .primaryColor,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      //color: Colors.red,
                        border: Border.all(
                          width: 2,
                          color: Theme
                              .of(context)
                              .primaryColor,
                        )),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => itemDel(transactions[index].id),
                    color: Colors.redAccent,
                  )
                ],
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
