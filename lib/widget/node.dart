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
      child: Row(
        children: <Widget>[
          Icon(
            showList ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
            size: 20,
          ),
          widget.node.me
        ],
      ),
      onTap: () {
        setState(() {
          showList = !showList;
        });
      },
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        me,
        if (showList)
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.node.children.map((node) => node.me).toList(),
            ),
          )
      ],
    );
  }
}
