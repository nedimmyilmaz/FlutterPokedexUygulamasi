import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokemon_listesi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: PokemonListesi(),
      theme: ThemeData.dark(),
    );
  }
}