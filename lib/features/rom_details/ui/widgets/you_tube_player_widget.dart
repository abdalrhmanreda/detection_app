import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerWidget extends StatefulWidget {
  final String videoUrl;

  const YouTubePlayerWidget({super.key, required this.videoUrl});

  @override
  _YouTubePlayerWidgetState createState() => _YouTubePlayerWidgetState();
}

class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
