import 'dart:async';
import 'package:flutter/material.dart';

// import 'dapp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _setting() {
    print("Clicked on Settings");
  }

  final int dur = 5;
  double position = 0;
  bool flag = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: dur), (timer) {
      setState(() {
        if (position <= -400) flag = true;
        if (position >= 0) flag = false;

        if (flag) {
          position += 40;
        } else if (!flag) {
          position -= 40;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  final TextEditingController _controller = TextEditingController();
  double sum = 0;
  void add() {
    if (double.tryParse(_controller.text) != null) {
      sum = double.parse(_controller.text) * 2;
    }
    print("Total betted amount = $sum");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], // Gradient colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            // backgroundBlendMode: BlendMode.xor,
          ),
        ),
        // backgroundColor: Colors.amber[800],
        actions: [
          ElevatedButton(
              onPressed: _setting,
              child: const Icon(
                Icons.settings,
              )),
          const SizedBox(
            width: 320,
          ),
        ],
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: 0,
            left: position,
            height: 800,
            duration: Duration(seconds: dur),
            child: Image.asset('assets/images/Menu_BG.jpg'),
          ),
          // OverflowBox(
          //   alignment: _currentAlignment,
          //   maxWidth: double.infinity,
          //   maxHeight: double.maxFinite,
          //   child: Image.asset(
          //     'assets/images/Menu_BG.jpg',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/GoT_Logo.png',
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.lightGreen,
                  labelText: "Amount",
                  // hintText: "Enter amount of Ether to Bet",
                  contentPadding: EdgeInsets.symmetric(horizontal: 9),
                ),
              ), // Amount Field
              // String txt = ,
              SizedBox(
                height: 50,
                width: 150,
                // decoration: BoxDecoration(backgroundBlendMode: BlendMode.overlay ),
                child: ElevatedButton(
                    onPressed: add,
                    child: const Center(
                      child: Text("Play"),
                    )),
              ), // Bet Button, all Decentralized App workings
            ], //Column Children
          ),
        ], //Stack Children
      ),
    );
  }
}
