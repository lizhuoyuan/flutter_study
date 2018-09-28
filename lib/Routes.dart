import 'package:flutter/material.dart';

class Routes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RouteState();
  }
}

class RouteState extends State<Routes> {
  final List<ListItem> listData = [];

  @override
  void initState() {
    super.initState();
    listData.add(ListItem("页面Home", "Home", Icons.home));
    listData.add(ListItem("页面Pavlova", "Pavlova", Icons.panorama_vertical));
    listData.add(ListItem("页面randomWords", "randomWords", Icons.book));
    listData.add(ListItem("图片", "Image", Icons.image));
    listData.add(ListItem("GridView", "GridView", Icons.grid_on));
    listData.add(ListItem("StateWidget", "StateWidget", Icons.widgets));
    listData.add(ListItem("TextField", "TextField", Icons.text_fields));
    listData.add(ListItem("KeepAlive", "KeepAlive", Icons.live_tv));
    listData.add(ListItem("Swiper", "Swiper", Icons.landscape));
    listData.add(ListItem("流式布局", "Wrap", Icons.landscape));
    listData.add(ListItem("动画", "Animation", Icons.landscape));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListItemWidget(listData[index]);
        },
        itemCount: listData.length,
      ),
    );
  }
}

class ListItem {
  final String title;
  final String routeName;
  final IconData iconData;

  ListItem(this.title, this.routeName, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: Text(listItem.title),
        leading: Icon(listItem.iconData),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.pushNamed(context, listItem.routeName);
          /*showDialog(
              context: context,
              child: new SimpleDialog(
                contentPadding: const EdgeInsets.all(10.0),
                title: new Text("我是标题"),
                children: <Widget>[new Text("我是内容区域")],
              ));*/
        });
  }
}
