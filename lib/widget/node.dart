import 'package:flutter/material.dart';

class Node {
  Widget me;
  List<Node> children;

  Node({this.me, this.children});
}

class NodeWidget extends StatefulWidget {
  final Node node;

  NodeWidget({Key key, this.node}) : super(key: key);

  @override
  _NodeWidgetState createState() => _NodeWidgetState();
}

class _NodeWidgetState extends State<NodeWidget> {
  bool showList = false;
  Node node;
  @override
  Widget build(BuildContext context) {
    var me = InkWell(
      child: widget.node.me,
      onTap: () {
        setState(() {
          showList = !showList;
        });
      },
    );
    return Column(
      children: <Widget>[
        me,
        if (showList)
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: widget.node.children.map((node) => node.me).toList(),
            ),
          )
      ],
    );
  }
}
