/*
 * author: Created by 李卓原 on 2018/10/18.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  List list = [1, 2, 3];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: list.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab的使用'),
        bottom: TabBar(
            controller: _tabController,
            tabs: list
                .map(
                  (item) => Tab(
                    key: PageStorageKey('$item'),
                    child: Text(
                      '$item',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
                .toList()),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: list
                    .map(
                      (item) => ListView(
                        children: <Widget>[
                          Container(
                            key: PageStorageKey('$item'),
                            child: TabItemView(item: item),
                          )
                        ],
                      ),
                    )
                    .toList()),
          ),
        ],
      ),
    );
  }
}

class TarItemState extends State<TabItemView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          widget.item.toString(),
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: widget.item == 2 ? Colors.blue : Colors.green,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('${widget.item} dispose');
  }
}

class TabItemView extends StatefulWidget {
  final item;

  TabItemView({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TarItemState();
}
