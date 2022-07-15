import 'package:flutter/material.dart';
import 'package:p2_expence_tracker/transaction.dart';
import 'package:p2_expence_tracker/widgets/my_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction('t1', 'New Shoes', 69.99, DateTime.now()),
    Transaction('t2', 'Weeklry Grocieres', 49.99, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    final cards = transactions.map((t) {
      return MyCard(t.title, t.amout, t.date, t);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("Chart"),
            ),
          ),
          Card(
            child: Column(
              children: [],
            ),
          ),
          Column(
            children: cards,
          ),
        ],
      ),
    );
  }
}
