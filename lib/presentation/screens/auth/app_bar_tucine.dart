import 'package:flutter/material.dart';
class TuCineAppBar {
  AppBar tuCine = AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        Image.asset("assets/logoTuCine.png",
            fit: BoxFit.contain,
            height: 40
        ),
        const SizedBox(width: 10),
        const Text("TuCine",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.orangeAccent,
  );

  AppBar getAppBar() {
    return tuCine;
  }
}