// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_pokedex/model/pokedex.dart';
// import 'package:palette_generator/palette_generator.dart';
//
// class PokemonDetay extends StatefulWidget {
//   Pokemon pokemon;
//
//   PokemonDetay({this.pokemon});
//
//   @override
//   _PokemonDetayState createState() => _PokemonDetayState();
// }
//
// class _PokemonDetayState extends State<PokemonDetay> {
//   PaletteGenerator paletteGenerator;
//   Color baskinRenk = Colors.transparent;
//   Color a = Color.fromRGBO(226, 162, 178, 160);
//
//   Color randomColor = Color.fromARGB(Random().nextInt(255),
//       Random().nextInt(255), Random().nextInt(10), Random().nextInt(255));
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     baskinRengiBul();
//   }
//
//   void baskinRengiBul()  {
//     Future<PaletteGenerator> fPaletGenerator =  PaletteGenerator.fromImageProvider(NetworkImage(widget.pokemon.img));
//     fPaletGenerator.then((value){
//       paletteGenerator = value;
//       // debugPrint("secilen renk :" + paletteGenerator.dominantColor.color.toString());
//
//       if(paletteGenerator != null && paletteGenerator.vibrantColor != null){
//         baskinRenk = paletteGenerator.vibrantColor.color;
//         setState(() {
//
//         });
//       }else if(paletteGenerator != null && paletteGenerator.dominantColor != null){
//         baskinRenk = paletteGenerator.dominantColor as Color;
//         setState(() {
//
//         });
//       }else{
//         debugPrint("NULL COLOR");
//       }
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: baskinRenk,
//       appBar: AppBar(
//         title: Text(widget.pokemon.name, textAlign: TextAlign.center),
//         elevation: 0,
//       ),
//       body: OrientationBuilder(builder: (context, orientation) {
//         if (orientation == Orientation.portrait) {
//           return verticalBody(
//               pokemon: widget.pokemon, randomColor: randomColor);
//         } else {
//           return horizontalBody(
//               pokemon: widget.pokemon, randomColor: randomColor);
//         }
//       }),
//     );
//   }
// }
//
// class verticalBody extends StatelessWidget {
//   const verticalBody({
//     Key key,
//     @required this.pokemon,
//     @required this.randomColor,
//   }) : super(key: key);
//
//   final Pokemon pokemon;
//   final Color randomColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//       tag: pokemon.img,
//       child: Stack(
//         children: [
//           Positioned(
//             left: 40,
//             height: MediaQuery.of(context).size.height * 0.7,
//             width: MediaQuery.of(context).size.width * 0.8,
//             top: MediaQuery.of(context).size.height * 0.1,
//             child: Card(
//               color: Colors.grey.withOpacity(0.3),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20)),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       child: Image.network(pokemon.img),
//                     ),
//                     Text(
//                       pokemon.name,
//                       style: TextStyle(fontSize: 26),
//                     ),
//                     Text(pokemon.height),
//                     Text(pokemon.weight),
//                     Text("Tipleri : ",
//                         style: TextStyle(
//                             fontSize: 22, fontWeight: FontWeight.bold)),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: pokemon.type
//                             .map((tip) => Chip(
//                                 label: Text(tip), backgroundColor: randomColor))
//                             .toList()),
//                     Text("Evrim Durumu : ",
//                         style: TextStyle(
//                             fontSize: 22, fontWeight: FontWeight.bold)),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: pokemon.nextEvolution != null
//                             ? pokemon.nextEvolution
//                                 .map((evolution) => Chip(
//                                     label: Text(evolution.name),
//                                     backgroundColor: randomColor))
//                                 .toList()
//                             : [Text("Bu son halidir.")]),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text("Zayıflıkları: ",
//                         style: TextStyle(
//                             fontSize: 22, fontWeight: FontWeight.bold)),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: pokemon.weaknesses != null
//                             ? pokemon.weaknesses
//                                 .map((weakness) => Chip(
//                                     label: Text(weakness),
//                                     backgroundColor: randomColor))
//                                 .toList()
//                             : [Text("Zayıflığı yoktur")]),
//                   ]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class horizontalBody extends StatelessWidget {
//   const horizontalBody({
//     Key key,
//     @required this.pokemon,
//     @required this.randomColor,
//   }) : super(key: key);
//
//   final Pokemon pokemon;
//   final Color randomColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 3 / 4,
//       width: MediaQuery.of(context).size.width - 33,
//       margin: EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.blue),
//           borderRadius: BorderRadius.circular(20)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//               flex: 1,
//               child: Hero(
//                 tag: pokemon.img,
//                 child: Container(
//                   width: 200,
//                   child: Image.network(
//                     pokemon.img,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               )),
//           Expanded(
//               flex: 1,
//               child: SingleChildScrollView(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Text(
//                         pokemon.name,
//                         style: TextStyle(fontSize: 26),
//                       ),
//                       Text(pokemon.height),
//                       Text(pokemon.weight),
//                       SizedBox(height: 10),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Text("Tipleri : ",
//                           style: TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.bold)),
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: pokemon.type
//                               .map((tip) => Chip(
//                                   label: Text(tip),
//                                   backgroundColor: randomColor))
//                               .toList()),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Text("Evrim Durumu : ",
//                           style: TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.bold)),
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: pokemon.nextEvolution != null
//                               ? pokemon.nextEvolution
//                                   .map((evolution) => Chip(
//                                       label: Text(evolution.name),
//                                       backgroundColor: randomColor))
//                                   .toList()
//                               : [Text("Bu son halidir.")]),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text("Zayıflıkları: ",
//                           style: TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.bold)),
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: pokemon.weaknesses != null
//                               ? pokemon.weaknesses
//                                   .map((weakness) => Chip(
//                                       label: Text(weakness),
//                                       backgroundColor: randomColor))
//                                   .toList()
//                               : [Text("Zayıflığı yoktur")]),
//                     ]),
//               ))
//         ],
//       ),
//     );
//   }
// }

// Kurstaki kod

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokedex.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonDetail extends StatefulWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  PokemonDetailState createState() {
    return new PokemonDetailState();
  }
}


class PokemonDetailState extends State<PokemonDetail> {

  PaletteGenerator paletteGenerator;
  Color baskinRenk;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baskinRenk=Colors.orangeAccent;
    baskinRengiBul();
  }

  void baskinRengiBul()  {
    Future<PaletteGenerator> fPaletGenerator =  PaletteGenerator.fromImageProvider(NetworkImage(widget.pokemon.img));
    fPaletGenerator.then((value){
      paletteGenerator = value;
      // debugPrint("secilen renk :" + paletteGenerator.dominantColor.color.toString());

      if(paletteGenerator != null && paletteGenerator.vibrantColor != null){
        baskinRenk = paletteGenerator.vibrantColor.color;
        setState(() {

        });
      }else if(paletteGenerator != null && paletteGenerator.dominantColor != null){
        baskinRenk = paletteGenerator.dominantColor.color;
        setState(() {

        });
      }else{
        debugPrint("NULL COLOR");
      }

    });
  }

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: baskinRenk,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: baskinRenk,
        title: Text(
          widget.pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return dikeyBody(context);
        } else {
          return yatayBody(context);
        }
      }),
    );
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width - 30,
      height: MediaQuery
          .of(context)
          .size
          .height * (3 / 4),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
                tag: widget.pokemon.img,
                child: Container(
                  width: 200,
                  child: Image.network(
                    widget.pokemon.img,
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " + widget.pokemon.height,
                  ),
                  Text(
                    "Weight : " + widget.pokemon.weight,
                  ),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.type
                        .map((tip) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),

                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null ?
                    widget.pokemon.prevEvolution.map((evolution) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              evolution.name,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("İlk hali")],
                  ),

                  Text(
                    "Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.nextEvolution != null ?
                    widget.pokemon.nextEvolution.map((evolution) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              evolution.name,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("Son hali")],
                  ),

                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null ?
                    widget.pokemon.weaknesses.map((weakness) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              weakness,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("Zayıflığı yok")],
                  ),

                ],
              ),
            ),
          )
        ],

      ),
    );
  }

  Stack dikeyBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery
              .of(context)
              .size
              .height * (8 / 10),
          width: MediaQuery
              .of(context)
              .size
              .width - 20,
          left: 10,
          top: MediaQuery
              .of(context)
              .size
              .height * 0.06,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " + widget.pokemon.height,
                  ),
                  Text(
                    "Weight : " + widget.pokemon.weight,
                  ),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.type
                        .map((tip) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),

                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null ?
                    widget.pokemon.prevEvolution.map((evolution) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              evolution.name,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("İlk hali")],
                  ),

                  Text(
                    "Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.nextEvolution != null ?
                    widget.pokemon.nextEvolution.map((evolution) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              evolution.name,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("Son hali")],
                  ),

                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null ?
                    widget.pokemon.weaknesses.map((weakness) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              weakness,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("Zayıflığı yok")],
                  ),

                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: widget.pokemon.img,
              child: Container(
                width: 150,
                height: 130,
                child: Image.network(
                  widget.pokemon.img,
                  fit: BoxFit.contain,
                ),
              )),
        )
      ],
    );
  }
}
