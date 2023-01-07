import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int noteNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('assets_note$noteNumber.wav'));
  }

  Expanded buildKey({required Color color, required int noteNumber}){
   return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(noteNumber);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(color: Colors.red, noteNumber: 1),
                buildKey(color: Colors.orange, noteNumber: 2),
                buildKey(color: Colors.green, noteNumber: 3),
                buildKey(color: Colors.indigo, noteNumber: 4),
                buildKey(color: Colors.yellow, noteNumber: 5),
                buildKey(color: Colors.purple, noteNumber: 6),
                buildKey(color: Colors.blue, noteNumber: 7),
          ]),
        ),
      ),
    );
  }
}
