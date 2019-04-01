import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

class LocalVideoPlayerFragment extends StatefulWidget {
  @override
  _LocalVideoPlayerFragmentState createState() =>
      _LocalVideoPlayerFragmentState();
}

class _LocalVideoPlayerFragmentState extends State<LocalVideoPlayerFragment> {
  VideoPlayerController _controler;
  File _video;

  Future getVideo() async {
    var video = await ImagePicker.pickVideo(source: ImageSource.gallery);
    print(video.path);

    setState(() {
      _video = video;
      _controler = VideoPlayerController.file(_video)
        ..setLooping(true)
        ..initialize().then((_) {
          setState(() {});
        });
    });
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
                child: _controler != null
                    ? _widgetVideo()
                    : new Text("choose video from gallery")),
          ),

          RaisedButton(
            child: new Text("Load Video"),
            onPressed: getVideo,
          )
        ],
      ),
      floatingActionButton: fab()
    );
  }

  Widget _widgetVideo() {
    return _controler.value.initialized
        ? AspectRatio(
            aspectRatio: _controler.value.aspectRatio,
            child: VideoPlayer(_controler),
          )
        : Container();
  }

  Widget fab(){
    if(_controler!=null && _controler.value!=null){
      return FloatingActionButton(

        onPressed: () {
          setState(() {
            _controler.value.isPlaying ? _controler.pause() : _controler
                .play();
          });
        },
        child: Icon(
          _controler.value.isPlaying ? Icons.pause :
          Icons.play_arrow,
        ),
      );
    }else{
      return null;
    }
  }
}
