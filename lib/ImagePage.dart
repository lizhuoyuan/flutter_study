import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ImagePage extends StatefulWidget {
  @override
  createState() => ImageState();
}

class ImageState extends State<ImagePage> {
  var image = "images/beauty.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image使用示例'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            "images/beauty.jpg",
            width: 200.0,
            height: 200.0,
            fit: BoxFit.contain,
            color: Colors.greenAccent,
            colorBlendMode: BlendMode.colorBurn,
            alignment: Alignment.bottomRight,
          ),
          //资源图片

          new Directionality(
            textDirection: TextDirection.ltr,
            child: Image.asset(
              image,
              width: 200.0,
              height: 200.0,
              fit: BoxFit.contain,
            ),
          ),

          InkWell(
            child: Text(
              '点击切换图片',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              setState(() {
                if (image == 'images/beauty.jpg')
                  image = "images/jay.jpg";
                else
                  image = 'images/beauty.jpg';
              });
            },
          ),
          RaisedButton(
            onPressed: _getData,
            child: Text(
              'getdata',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Future _getData() async {
    print('开始请求');
    Dio dio = new Dio();
    //Response response = await dio.get("http://api.douban.com/v2/movie/top250");
    Response response = await dio
        .post("http://test.hadoop.network/loan/get_supported_operators");
    var data = response.data;
    print(data);
    print(data['data']);

    print('请求结束');
  }
}
