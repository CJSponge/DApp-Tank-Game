import 'package:flutter/material.dart';

class BetButton extends StatelessWidget {
  final String txt;
  const BetButton({required this.txt, super.key});

//  final sum = 0;
  void add() {
    // sum = sum * 2;
    print(txt);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: add,
        child: const Center(
          child: Text("Bet"),
        ));
  }
}
