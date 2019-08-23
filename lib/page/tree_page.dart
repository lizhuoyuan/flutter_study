import 'package:flutter/material.dart';
import 'package:flutter_app/widget/node.dart';

///类似于qq列表的组件树
class TreePage extends StatefulWidget {
  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  List<String> goodFriends2 = ['刘亦菲', '李一桐', '信'];
  List<String> goodFriends = ['陈浩', '胡歌', '周杰伦', '田馥甄'];
  List<String> sb = ['罗永浩', '陈年', '特朗普', '安倍晋三'];

  @override
  Widget build(BuildContext context) {
    print(goodFriends.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("类似于qq列表的组件树"),
      ),
      body: NodeWidget(
        node: Node(me: Text('我的好友'), children: <Node>[
          Node(
              me: NodeWidget(
                  node: Node(
                      me: Text('好友1'),
                      children:
                          goodFriends.map((f) => Node(me: Text(f))).toList()))),
          Node(
              me: NodeWidget(
            node: Node(me: Text('家人'), children: [
              ...goodFriends2.map((item) => Node(me: Text(item)))
            ]),
          )),
          Node(
            me: NodeWidget(
              node: Node(
                  children: [...sb.map((item) => Node(me: Text(item)))],
                  me: Text('MDZZ')),
            ),
          )
        ]),
      ),
    );
  }
}
