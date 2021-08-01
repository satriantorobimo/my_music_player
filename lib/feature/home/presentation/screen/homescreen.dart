import 'package:flutter/material.dart';
import 'package:my_music_player_app/feature/home/presentation/widget/list_songs_widget.dart';
import 'package:my_music_player_app/feature/home/presentation/widget/play_widget.dart';
import 'package:my_music_player_app/feature/home/presentation/widget/search_artist_widget.dart';
import 'package:my_music_player_app/feature/home/presentation/widget/title_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(),
                  SizedBox(height: 8),
                  SearchArtistWidget(),
                  SizedBox(height: 8),
                  ListSongsWidget(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: PlayWidget(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
