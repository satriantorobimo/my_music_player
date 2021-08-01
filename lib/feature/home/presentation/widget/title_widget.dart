import 'package:flutter/material.dart';
import 'package:my_music_player_app/core/resources/string.dart';

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22));
  }
}
