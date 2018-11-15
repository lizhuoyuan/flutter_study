import 'package:flutter/material.dart';
import 'package:flutter_app/FavoriteWidget.dart';

class MyHomePage extends StatelessWidget {
  final String tag;

  MyHomePage({this.tag, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          FavoriteWidget()
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
    Widget textSection = new Container(
      padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 32.0),
      child: new Text(
        '''
Lake1 Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. 
        ''',
        softWrap: true,
      ),
    );

    FloatingActionButton floatBtn = FloatingActionButton(
      foregroundColor: Colors.red,
      onPressed: _floatOnPress,
      tooltip: '长按显示',
      child: Icon(Icons.favorite),
      backgroundColor: Colors.transparent,
    );

    RaisedButton btn = new RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('Pavlova');
        },
        color: Colors.green,
        child: new Text('go to Pavlova',
            style: new TextStyle(color: Colors.white)));
    return Scaffold(
      appBar:
          AppBar(title: Text('Startup Name Generator'), actions: <Widget>[]),
      body: ListView(
        children: [
          Hero(
            tag: tag ?? 'hero',
            child: Image.asset(
              'images/jay.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            flightShuttleBuilder: (BuildContext flightContext,
                Animation<double> animation,
                HeroFlightDirection flightDirection,
                BuildContext fromHeroContext,
                BuildContext toHeroContext) {
              return Icon(Icons.rotate_90_degrees_ccw);
            },
          ),
          titleSection,
          buttonSection,
          textSection,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: btn,
          )
        ],
      ),
      floatingActionButton: floatBtn,
    );
  }

  void _floatOnPress() {
    print('press');
  }
}
