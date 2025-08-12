import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(SoundboardApp());
}

class SoundboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast Soundboard',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SoundPage(),
    );
  }
}

class SoundPage extends StatelessWidget {
  final AudioPlayer _player = AudioPlayer();

  void playSound(String file) async {
    await _player.play(AssetSource(file));
  }

  @override
  Widget build(BuildContext context) {
    final sounds = [
      {'label': 'Boo', 'file': 'boo.mp3'},
      {'label': 'Yay', 'file': 'yay.mp3'},
      {'label': 'Buzzer', 'file': 'buzzer.mp3'},
      {'label': 'Bell', 'file': 'bell.mp3'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Podcast Soundboard')),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: sounds.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () => playSound(sounds[index]['file']!),
            child: Text(sounds[index]['label']!, style: TextStyle(fontSize: 20)),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        },
      ),
    );
  }
}
Added main.dart for soundboard app
