import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatefulWidget {
  @override
  _CustomScrollViewPageState createState() => _CustomScrollViewPageState();
}

class _CustomScrollViewPageState extends State<CustomScrollViewPage>
    with SingleTickerProviderStateMixin {
  var tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(color: Colors.green, height: 100, child: Text('我的可滚动列表上面的一些文')),
            ),
            SliverAppBar(
              //标题居中
              centerTitle: true,
              //展开高度200
              expandedHeight: 200.0,
              //不随着滑动隐藏标题
              floating: false,
              //固定在顶部
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  child: Column(
                    children: <Widget>[

                      Text('我是一个FlexibleSpaceBar')
                    ],
                  ),
                ),
                background: Image.network(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  controller: tabController,
                  labelColor: Colors.black,
                  tabs: <Widget>[
                    Tab(text: '资讯'),
                    Tab(text: '技术'),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text('我的可滚动列表上面的一些文'),
            ),
            SliverList(delegate: SliverChildBuilderDelegate(itemBuilder, childCount: 10)),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              }, childCount: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.green.withOpacity(index / 10),
      height: 200,
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
