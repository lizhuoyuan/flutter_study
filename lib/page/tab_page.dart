/*
 * author: Created by 李卓原 on 2018/10/18.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  TabController _mysTabController;
  Color _color;
  final List<Color> _colors = [
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.yellow,
    Colors.red,
    Colors.purple,
    Colors.grey,
  ];
  final List<Tab> myTabs = <Tab>[
    Tab(text: '明教'),
    Tab(text: '霸刀'),
    Tab(text: '天策'),
    Tab(text: '纯阳'),
    Tab(text: '少林'),
    Tab(text: '藏剑'),
    Tab(text: '五毒'),
  ];

  final List<Tab> myTabBarViews = <Tab>[
    Tab(text: '喵喵喵喵喵喵喵喵喵喵'),
    Tab(text: '叨叨叨叨叨叨叨叨叨叨'),
    Tab(text: '汪汪汪汪汪汪汪汪汪汪'),
    Tab(text: '咩咩咩咩咩咩咩咩咩咩'),
    Tab(text: '观自在菩萨,行深般若波罗蜜多时'),
    Tab(text: '君子如风,藏剑西湖'),
    Tab(text: '情之所依，心之所系。代君受命，保君平安。'),
  ];

  @override
  void initState() {
    _color ??= _colors[0]; //设置一个颜色的初始值
    _mysTabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
    _mysTabController.animation.addListener(() {
      setState(() {
        _color = _colors[_mysTabController.index];

        //当Tab向右滑动时
        if (_mysTabController.offset > 0) {
          final ColorTween myscolor = ColorTween(
            begin: _colors[_mysTabController.index],
            end: _colors[_mysTabController.index + 1],
          );
          _color = myscolor.lerp(_mysTabController.offset);
        } else if (_mysTabController.offset < 0) {
          //当Tab向左滑动时
          final ColorTween myscolor = ColorTween(
            begin: _colors[_mysTabController.index],
            end: _colors[_mysTabController.index - 1],
          );
          _color = myscolor.lerp(-_mysTabController.offset);
        }
        print(_mysTabController.offset);
      });
    });
  }

  @override
  void dispose() {
    _mysTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Column(
        children: <Widget>[
          Container(
            color: _color,
            height: ScreenUtil().statusBarHeight,
          ),
          CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Text('asda'),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: TabBar(
                    controller: _mysTabController,
                    labelColor: Colors.black,
                    tabs: <Widget>[...myTabs],
                    isScrollable: true,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 500,
                  child: TabBarView(
                      controller: _mysTabController,
                      children: myTabBarViews
                          .map((Tab tab) => Container(
                                alignment: Alignment.center,
                                // color: _color,
                                child: Text(
                                  tab.text,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList()),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 20,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
