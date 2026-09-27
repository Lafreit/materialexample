import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class Kitten {
  const Kitten({
    required this.name,
    required this.description,
    required this.age,
    required this.imageUrl,
  });

  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server = 
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";

final List<Kitten> kittens = <Kitten>[
  Kitten(
    name: 'Mittens',
    description: 'The pinnacle of cats. When Mittens sits in your lap, you feel like royalty.',
    age: 11,
    imageUrl: 'http://$server:8000/Kitten0.jpg',
  ),
  Kitten(
    name: 'Fluffy',
    description: "World's cutest kitten. Seriously. We did the research.",
    age: 3,
    imageUrl: 'http://$server:8000/kitten1.jpg',
  ),
  Kitten(
    name: 'Scooter',
    description: 'Chases string faster than 9/10 competing kittens.',
    age: 2,
    imageUrl: 'http://$server:8000/kitten2.jpg',
  ),
  Kitten(
    name: 'Steve',
    description: 'Steve is cool and just kind of hangs out.',
    age: 4,
    imageUrl: 'http://$server:8000/kitten3.jpg',
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        kittens[index].name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Kittens'),
      ),
      body: ListView.builder(
        itemCount: kittens.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}