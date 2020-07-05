/*
 * author: Created by 李卓原 on 2020/7/5
 * email: zhuoyuan93@gmail.com
 *
 */
import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  List list = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              automaticallyImplyLeading: false,
              elevation: 5,
              forceElevated: true,
              expandedHeight: 200,
              floating: true,
              snap: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('SliverAppBar'),
                background: Image.asset(
                  'images/pic1.jpg',
                  fit: BoxFit.fill,
                ),
                //标题是否居中
                centerTitle: false,
                //标题间距
                //titlePadding: EdgeInsetsDirectional.only(start: 0, bottom: 16),
                collapseMode: CollapseMode.parallax,
              )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              _reportBuilder,
              childCount: list.length + 1,
            ),
          ),
          SliverToBoxAdapter(
            child: Text('Title'),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400),
            delegate: SliverChildBuilderDelegate(
              _reportBuilder,
              childCount: list.length + 1,
            ),
          )
        ],
      ),
    );
  }

  Widget _reportBuilder(BuildContext context, int index) {
    const header = Text('I am title');

    if (index <= 0) {
      return header;
    } else {
      int listIndex = index - 1;
      print(listIndex);
      return Container(
        color: Colors.blue,
        height: 200,
        child: Text('${list[listIndex]}'),
      );
    }
  }
}
