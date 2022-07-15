import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  //lista
  final _randomWordPairs = <WordPair>[];

  // Set to lista w której każdy obiekt może być tylko raz
  final _savedWordPairs = <WordPair>{}; //to samo: Set<WordPair>()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Wordpair Generator'), actions: <Widget>[
          IconButton(onPressed: handleButtonPressed, icon: Icon(Icons.list))
        ]),
        body: _buildList());
  }

  void handleButtonPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
        return ListTile(
          title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16)),
        );
      });

      final List<Widget> divided = ListTile.divideTiles(
        tiles: tiles,
        context: context,
      ).toList();

      return Scaffold(
          appBar: AppBar(title: Text('Saved WordPairs')),
          body: ListView(children: divided));
    }));
  }

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, itemIndex) {
          if (itemIndex.isOdd) return Divider();

          //index samych wierszy (z pominięciem Dividerów)
          final index = itemIndex ~/ 2;

          if (index >= _randomWordPairs.length) {
            //dodanie nowych
            _randomWordPairs.addAll(generateWordPairs().take(10));
            print("dodano nowe, aktualna liczba: ${_randomWordPairs.length}");
          }

          return _buildRow(_randomWordPairs[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final isAlreadySaved = _savedWordPairs.contains(pair);
    final heartIcon =
        isAlreadySaved ? Icons.favorite : Icons.favorite_border_outlined;
    final heartColor = isAlreadySaved ? Colors.red : null;

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: Icon(heartIcon, color: heartColor),
      onTap: () {
        setState(() {
          if (isAlreadySaved)
            _savedWordPairs.remove(pair);
          else
            _savedWordPairs.add(pair);
        });
      },
    );
  }
}
