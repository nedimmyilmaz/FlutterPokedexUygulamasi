import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokedex.dart';

class PokemonDetay extends StatelessWidget {
  Color a = Color.fromRGBO(226, 162, 178, 160);
  Pokemon pokemon;

  PokemonDetay({this.pokemon});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name, textAlign: TextAlign.center),
        elevation: 0,
      ),
      body: Hero( tag: pokemon.img,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 200, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: a
              ),
              child: Center(
                child: Positioned(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(children: [
                    Container(margin: EdgeInsets.symmetric(vertical: 40),
                      padding: EdgeInsets.all(20),
                        child:
                            Text(pokemon.name, style: TextStyle(fontSize: 28, color: Colors.black87))),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Image.network(pokemon.img),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
