import 'package:flutter/material.dart';
import 'package:my_music_player_app/feature/home/presentation/logic/provider/play_provider.dart';
import 'package:provider/provider.dart';
import 'package:audio_manager/audio_manager.dart';

class PlayWidget extends StatefulWidget {
  @override
  _PlayWidgetState createState() => _PlayWidgetState();
}

class _PlayWidgetState extends State<PlayWidget> {
  bool _isPlay = false;
  bool playing = true;
  double _slider;
  var audioManagerInstance = AudioManager.instance;

  void setupAudio() {
    audioManagerInstance.onEvents((events, args) {
      switch (events) {
        case AudioManagerEvents.start:
          _slider = 0;
          break;
        case AudioManagerEvents.seekComplete:
          _slider = audioManagerInstance.position.inMilliseconds /
              audioManagerInstance.duration.inMilliseconds;
          setState(() {});
          break;
        case AudioManagerEvents.playstatus:
          playing = audioManagerInstance.isPlaying;
          setState(() {});
          break;
        case AudioManagerEvents.timeupdate:
          _slider = audioManagerInstance.position.inMilliseconds /
              audioManagerInstance.duration.inMilliseconds;
          audioManagerInstance.updateLrc(args["position"].toString());
          setState(() {});
          break;
        case AudioManagerEvents.ended:
          audioManagerInstance.next();
          setState(() {});
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isPlay =
        Provider.of<PlayProvider>(context, listen: false).isplay;
    final String songTitle =
        Provider.of<PlayProvider>(context, listen: true).value;
    final String image =
        Provider.of<PlayProvider>(context, listen: false).image;
    final String url = Provider.of<PlayProvider>(context, listen: false).url;

    if (isPlay) {
      setState(() {
        _isPlay = isPlay;
      });
      if (playing)
        audioManagerInstance
            .start(
          url,
          songTitle,
          desc: "Description",
          auto: true,
          cover: image,
        )
            .then((err) {
          print(err);
        });
    }

    return Visibility(
      visible: _isPlay,
      child: Container(
        width: double.infinity,
        height: 85,
        color: Color(0xFF1c1c1e).withOpacity(0.7),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
              leading: Container(
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(_isPlay ? image : ''),
                        fit: BoxFit.fill)),
              ),
              title: Text(
                songTitle ?? '',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Container(
                width: 100,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await audioManagerInstance.playOrPause();

                        setState(() {
                          playing = !playing;
                        });
                      },
                      child: Icon(
                        playing
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        size: 45,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.fast_forward_rounded,
                      size: 45,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
