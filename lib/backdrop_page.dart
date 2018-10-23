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

class _BackdropPageState extends State<BackdropPage> {
  double width, height;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    width = 200.0;
    height = 56.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        child: Column(
          children: <Widget>[
            ListTile(

              title: Text('title'),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _showMore() {
    setState(() {
      height = height == 56.0 ? 300.0 : 56.0;
    });
  }
}

class _BackAppBar extends StatelessWidget {
  const _BackAppBar({
    Key key,
    this.leading = const SizedBox(width: 56.0),
    @required this.title,
    this.trailing,
  }) : assert(leading != null), assert(title != null), super(key: key);

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
        child: new SizedBox(
          height: _kBackAppBarHeight,
          child: new Row(children: children),
        ),
      ),
    );
  }
}