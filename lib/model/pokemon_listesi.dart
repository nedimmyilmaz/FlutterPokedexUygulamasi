import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/model/pokedex.dart';
import 'package:flutter_pokedex/pokemon_detay.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonListesi extends StatefulWidget {
  @override
  _PokemonListesiState createState() => _PokemonListesiState();
}

class _PokemonListesiState extends State<PokemonListesi> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Pokedex pokedex;
  Future<Pokedex> veri;

  Future<Pokedex> pokemonlariGetir() async {
    var response = await http.get(url);
    var decoded = json.decode(response.body);
    pokedex = Pokedex.fromJson(decoded);
    debugPrint(pokedex.toString());
    return pokedex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veri = pokemonlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokedex Uygulamam")),
      body: FutureBuilder(
          future: veri,
          builder: (context, AsyncSnapshot<Pokedex> gelenPokedex) {
            if (gelenPokedex.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (gelenPokedex.connectionState == ConnectionState.done) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PokemonDetail(
                                pokemon: gelenPokedex.data.pokemon[index])));
                      },
                      child: Hero(
                          tag: gelenPokedex.data.pokemon[index].img,
                          child: Card(
                            elevation: 5,
                            color: Color.fromRGBO(173,216,230,20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: FadeInImage.assetNetwork(
                                        placeholder: "assets/img/error.png",
                                        image: gelenPokedex
                                            .data.pokemon[index].img)),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    gelenPokedex.data.pokemon[index].name,
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ),
                                )
                              ],
                            ),
                          )),
                    );
                  });
            }
          }),
    );
  }
}
