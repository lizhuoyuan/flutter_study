/*
 * author: Created by 李卓原 on 2018/12/13.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';

class SharePage extends StatefulWidget {
  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('share to twitter'),
              onPressed: () async {
                var response = await FlutterShareMe().shareToTwitter(
                    url: 'https://github.com/lizhuoyuan',
                    msg: 'hello flutter! ');
                if (response == 'success') {
                  print('navigate success');
                }
              },
            ),
            RaisedButton(
              child: Text('share to shareWhatsApp'),
              onPressed: () {
                FlutterShareMe().shareToWhatsApp(
                    msg:
                        'hello,this is my github:https://github.com/lizhuoyuan');
              },
            ),
            RaisedButton(
              child: Text('share to shareFacebook'),
              onPressed: () {
                FlutterShareMe().shareToFacebook(
                    url: 'https://github.com/lizhuoyuan', msg: 'Hello Flutter');
              },
            ),
            RaisedButton(
              child: Text('share to System'),
              onPressed: () async {
                var response =
                    await FlutterShareMe().shareToSystem(msg: 'Hello Flutter');
                if (response == 'success') {
                  print('navigate success');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
