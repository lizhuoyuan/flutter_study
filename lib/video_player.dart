/*
 * author: Created by 李卓原 on 2019/2/22.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController _videoPlayerController;
  String videoUrl =
      'https:\/\/r2---sn-t0a7ln7d.googlevideo.com\/videoplayback?pcm2=no&id=o-AGhjJTNX-_rpxrF-lQPBebK-cqFnodGNEMsSZ1RlZPHM&key=yt6&mn=sn-t0a7ln7d%2Csn-vgqsknlz&mm=31%2C26&expire=1551100886&ms=au%2Conr&requiressl=yes&ei=dZdzXI2sOeHP8gTiuahA&fvip=2&pl=24&mv=u&ipbits=0&ip=54.80.95.108&ratebypass=yes&txp=5531432&sparams=dur%2Cei%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpcm2%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cexpire&signature=246C48A87B1DE26DACF4558F02F14836F986F125.2058F1D1395A987D10183B01486A5BE7384FB482&lmt=1542774011565518&dur=552.588&itag=22&mime=video%2Fmp4&source=youtube&mt=1551078639';

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        //确保在视频初始化后显示第一帧，甚至在按下播放按钮之前。
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('播放视频'),
      ),
      body: Container(
        height: 250,
        child: _videoPlayerController.value.initialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play();
          });
          print(_videoPlayerController.value);
        },
        child: Icon(_videoPlayerController.value.isPlaying
            ? Icons.pause
            : Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }
}
