import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget {
  final String title;
  final double amout;
  final DateTime date;

  const MyCard(this.title, this.amout, this.date,, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            child: Text(
              '\$$amout',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.only(bottom: 5),
              ),
              Text(
                DateFormat('dd.MM.yyyy').format(date),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
