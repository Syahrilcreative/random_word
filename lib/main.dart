import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selamat Datang',
      home: RandomWord(),
    );
  }
}

// Dinamis
class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  var savedWords = [];
  String randomWord = WordPair.random().asString;

  void _changeWord() {
    setState(() {
      randomWord = WordPair.random().asString;
    });
  }

  void _saveWord() {
    savedWords.add(randomWord);
    // print(savedWords);

    // Membuat Halaman Baru
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Save Word'),
        ),
        body: Text(savedWords.join(" - ")),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syahril Flutter'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(randomWord, style: TextStyle(fontSize: 40)),
          IconButton(icon: Icon(Icons.favorite_border), onPressed: _saveWord)
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeWord,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
