/*
 * author: Created by 李卓原 on 2019/2/25.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

class YoutubePlayerPage extends StatefulWidget {
  @override
  _YoutubePlayerPageState createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
  VideoPlayerController _videoController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('youtube_player播放Youtube视频'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 240,
            child: YoutubePlayer(
              source: "dVAVxdbzwKI",
              context: context,
              autoPlay: false,
              quality: YoutubeQuality.HD,
              playerMode: YoutubePlayerMode.DEFAULT,
              callbackController: (controller) {
                _videoController = controller;
              },
              onError: (error) {
                print(error);
              },
            ),
          ),
          IconButton(
            icon: Icon(_videoController?.value?.isPlaying ?? false
                ? Icons.pause
                : Icons.play_arrow),
            onPressed: () {
              setState(() {
                _videoController.value.isPlaying
                    ? _videoController.pause()
                    : _videoController.play();
              });
            },
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Text('context'),
                Container(
                  height: 300,
                  color: Colors.green,
                ),
                Text('context'),
                Container(
                  height: 300,
                  color: Colors.green,
                ),
                Text('context'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }
}
