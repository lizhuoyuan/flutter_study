/*
 * author: Created by 李卓原 on 2018/10/23.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'package:flutter/material.dart';

class BackdropPage extends StatefulWidget {
  @override
  _BackdropPageState createState() => _BackdropPageState();
}

class _BackdropPageState extends State<BackdropPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  bool select = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween(begin: 0.0, end: 0.25).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            _BackAppBar(
                title: Text(
                  'title',
                ),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                trailing: RotationTransition(
                  turns: _animation,
                  child: IconButton(
                    icon: Icon(Icons.call_to_action),
                    onPressed: _showMore,
                  ),
                )),
            Container(
              height: _animation.value * 1200,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Text(
                      '夜间模式',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Switch(
                      value: select,
                      onChanged: (value) {
                        setState(() {
                          select = value;
                        });
                      },
                      activeColor: Colors.blue[100],
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      '日间模式',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Switch(
                      value: !select,
                      onChanged: (value) {
                        setState(() {
                          select = value;
                        });
                      },
                      activeColor: Colors.blue[100],
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      '没有模式',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Switch(
                      value: select,
                      onChanged: (value) {
                        setState(() {
                          select = value;
                        });
                      },
                      activeColor: Colors.blue[100],
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      '没有模式',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Switch(
                      value: select,
                      onChanged: (value) {
                        setState(() {
                          select = value;
                        });
                      },
                      activeColor: Colors.blue[100],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            Text('hello'),
            Image.asset('images/beauty.jpg'),
          ],
        ),
      ),
    );
  }

  void _showMore() {
    if (_animation.value == 0.25) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}

class _BackAppBar extends StatelessWidget {
  const _BackAppBar({
    Key key,
    this.leading = const SizedBox(width: 56.0),
    @required this.title,
    this.trailing,
  })  : assert(leading != null),
        assert(title != null),
        super(key: key);

  final Widget leading;
  final Widget title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[
      new Container(
        alignment: Alignment.center,
        width: 56.0,
        child: leading,
      ),
      new Expanded(
        child: title,
      ),
    ];

    if (trailing != null) {
      children.add(
        new Container(
          alignment: Alignment.center,
          width: 56.0,
          child: trailing,
        ),
      );
    }

    final ThemeData theme = Theme.of(context);

    return IconTheme.merge(
        data: theme.primaryIconTheme,
        child: new DefaultTextStyle(
          style: theme.primaryTextTheme.title,
          child: Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(children: children),
              decoration: BoxDecoration(color: Colors.blue)),
        ));
  }
}
