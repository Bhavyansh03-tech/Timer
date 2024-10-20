import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Variable
  int timeLeft = 5;

  // Timer method
  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer){
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                timeLeft == 0 ? 'DONE' : timeLeft.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40)
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                padding: const EdgeInsets.all(12),
                onPressed: _startCountDown,
                color: Colors.deepPurple[300],
                child: const Text('S T A R T', style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}