/*
 * author: Created by 李卓原 on 2019/2/22.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class FlutterYoutubePage extends StatefulWidget {
  @override
  _FlutterYoutubePageState createState() => _FlutterYoutubePageState();
}

class _FlutterYoutubePageState extends State<FlutterYoutubePage> {
  TextEditingController textEditingControllerUrl = new TextEditingController();
  TextEditingController textEditingControllerId = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('播放视频'),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new TextField(
                controller: textEditingControllerUrl,
                decoration: new InputDecoration(labelText: "Enter Youtube URL"),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text("Play Video By Url"),
                  onPressed: playYoutubeVideoEdit),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text("Play Default Video"),
                  onPressed: playYoutubeVideo),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new TextField(
                controller: textEditingControllerId,
                decoration: new InputDecoration(
                    labelText: "Youtube Video Id (fhWaJi1Hsfo)"),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text("Play Video By Id"),
                  onPressed: playYoutubeVideoIdEdit),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text("Auto Play Video By Id"),
                  onPressed: playYoutubeVideoIdEditAuto),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(1 == 1 ? Icons.pause : Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void playYoutubeVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "<API_KEY>",
      videoUrl: "https://www.youtube.com/watch?v=g_fSistU3MQ",
    );
  }

  void playYoutubeVideoEdit() {
    var youtube = new FlutterYoutube();

    youtube.onVideoEnded.listen((onData) {
      //todo 当视频播放完成时，执行你的动作
    });

    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "<API_KEY>",
      videoUrl: textEditingControllerUrl.text,
    );
  }

  void playYoutubeVideoIdEdit() {
    var youtube = new FlutterYoutube();

    youtube.onVideoEnded.listen((onData) {
      //todo 当视频播放完成时，执行你的动作
    });

    FlutterYoutube.playYoutubeVideoById(
      apiKey: "<API_KEY>",
      videoId: textEditingControllerId.text,
    );
  }

  void playYoutubeVideoIdEditAuto() {
    var youtube = new FlutterYoutube();

    youtube.onVideoEnded.listen((onData) {
      //todo 当视频播放完成时，执行你的动作
    });

    FlutterYoutube.playYoutubeVideoById(
        apiKey: "<API_KEY>",
        videoId: textEditingControllerId.text,
        autoPlay: true);
  }
}
