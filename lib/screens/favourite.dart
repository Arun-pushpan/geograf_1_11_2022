import 'package:flutter/material.dart';
class Favourite extends StatefulWidget {
  const Favourite({Key? key,}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.bottomLeft,
      //             end: Alignment.topRight,
      //             colors: <Color>[Colors.teal.shade900, Colors.black])),
      //   ),
      //   title: Text(widget.title, style: TextStyle(
      //       fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),),
      // ),
    );
  }
}
