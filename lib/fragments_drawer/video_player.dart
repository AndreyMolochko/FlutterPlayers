import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_app/util/time_worker.dart';

class VideoPlayerNetwork extends StatefulWidget {
  @override
  _VideoPlayerNetworkState createState() => _VideoPlayerNetworkState();
}

class _VideoPlayerNetworkState extends State<VideoPlayerNetwork> {
  Color colorBackgroundPlayer = Color(0xFF3E3E3E);
  Color colorIconsPlayer = Color(0xFFD6D6D6);

  VideoPlayerController _controller;
  Icon _playVideo = new Icon(
    Icons.play_arrow,
    color: new Color(0xFFD6D6D6),
  );
  bool play = false;
  String _currentVideoTime = "00:00";
  String _allTimeVideo = "00:43";

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
          VideoProgressIndicator(
            _controller,
            allowScrubbing: false,
          ),
          _getCustomPlayer()
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Video from mp4 1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _getCustomPlayer() {
    return Container(
      color: colorBackgroundPlayer,
      child: Row(
        children: <Widget>[
          _getIconButtonPlay(),
          _getCurrentTimeVideo(),
          _getVideoProgress(),
          _getAllTimeVideo(),
          _getVolumeIcon(),
          _getStretchIcon()
        ],
      ),
    );
  }

  Widget _getIconButtonPlay() {
    return IconButton(
      icon: _playVideo,
      onPressed: _changeIconPlay,
    );
  }

  Widget _getCurrentTimeVideo() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Text(
        TimeWorker.getTimeInUsualFormat(
            _controller.value.position.inSeconds),
        style: new TextStyle(color: colorIconsPlayer),
      ),
    );
  }

  Widget _getVideoProgress() {
    return Text(
      "Here will progress",
      style: new TextStyle(color: colorIconsPlayer),
    );
  }

  Widget _getAllTimeVideo() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
          TimeWorker.getTimeInUsualFormat(_controller.value.duration.inSeconds),
          style: new TextStyle(color: colorIconsPlayer)),
    );
  }

  Widget _getVolumeIcon() {
    return IconButton(
      icon: Icon(
        Icons.volume_up,
        color: colorIconsPlayer,
      ),
    );
  }

  Widget _getStretchIcon() {
    return IconButton(
        icon: Icon(
      Icons.zoom_out_map,
      color: colorIconsPlayer,
    ));
  }

  void _changeIconPlay() {
    setState(() {
      if (_controller.value.isPlaying) {
        _playVideo = new Icon(Icons.play_arrow, color: colorIconsPlayer);
        _controller.pause();
      } else {
        _playVideo = new Icon(Icons.pause, color: colorIconsPlayer);
        _controller.play();
      }
    });
  }
}
