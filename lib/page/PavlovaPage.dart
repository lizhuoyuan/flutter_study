import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/locale/translations_delegate.dart';

class PavlovaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PavlovaState();
  }
}

class PavlovaState extends State<PavlovaPage> {
  @override
  Widget build(BuildContext context) {
    Container ratings = Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(width: 1.0, color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.star, color: Colors.green[500]),
              Icon(Icons.star, color: Colors.green[500]),
              Icon(Icons.star, color: Colors.green[500]),
              Icon(Icons.star, color: Colors.grey),
              Icon(Icons.star, color: Colors.grey),
            ],
          ),
          Text('170 Reviews',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20.0,
              ))
        ]));

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    var threeColumn = DefaultTextStyle.merge(
        style: descTextStyle,
        child: Container(
          padding: new EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.kitchen,
                    color: Colors.green,
                  ),
                  Text('PREP'),
                  Text('25 min'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Colors.green,
                  ),
                  Text('COOK'),
                  Text('1 hr'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.restaurant,
                    color: Colors.green,
                  ),
                  Text('FEEDS'),
                  Text('4 - 6'),
                ],
              )
            ],
          ),
        ));

    var titleText =
        Text('ADSAD SA;DKJJ AS;KDA', style: TextStyle(fontSize: 22.0));
    var subTitle = Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
          'aaaaaaaaaaadsa ;kasdlka;sda sdaljdh ljahd ashd kahs dkaj hsld hasljd hals hdah '),
    );
    var ratIcon = Container(
        padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
        child: Column(
          children: <Widget>[titleText, subTitle, ratings, threeColumn],
        ));
    return Scaffold(
        appBar: AppBar(title: Text('Pavlova')),
        body: Container(
          child: Column(
            children: <Widget>[
              ratIcon,
              Hero(
                tag: '${Translations.of(context).text('homePage')}',
                child: Image.network(
                    'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg',
                    height: 230.0,
                    width: double.infinity),
              ),

              /* Image.asset(
                'images/beauty.jpg',
                height: 230.0,
                width: double.infinity,
              )*/
            ],
          ),
        ));
  }
}
