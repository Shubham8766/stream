import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {

  final String id;

  VideoScreen({required this.id});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,

      flags: YoutubePlayerFlags(

        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      //only from top
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Scaffold(

        body: SingleChildScrollView(
          child: Container(


            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.black54, Colors.black12])
            ),
            child: YoutubePlayer(

              controller: _controller,

              showVideoProgressIndicator: true,
              onReady: () {
                print('Player is ready.');
              },
            ),

          ),
        ),
      ),
    );
  }
}