import 'package:flutter/material.dart';
import 'package:flutter_app/page/MyHomePage.dart';

class GridViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridViewState();
  }
}

class GridViewState extends State<GridViewPage> {
  final List<ListItem> listData = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++) {
      listData.add(new ListItem("我是测试标题$i", Icons.cake));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //每行2个
            mainAxisSpacing: 10.0, //主轴(竖直)方向间距
            crossAxisSpacing: 10.0, //纵轴(水平)方向间距
            childAspectRatio: 1.0 //纵轴缩放比例
            ),
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItemWidget(listData[index], index);
        },
      ),
    );
  }
}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;
  final int index;
  ListItemWidget(this.listItem, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
                tag: listItem.title,
                child: Image(
                  image: AssetImage(
                      index == 5 ? 'images/jay.jpg' : 'images/pic3.jpg'),
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.fill,
                  /*listItem.iconData,
                size: 50.0,
                color: Colors.white,*/
                )),
            Text(
              listItem.title,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      onTap: () {
        /*Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(listItem.title),
        ));*/
        Navigator.of(context).push(PageRouteBuilder(pageBuilder:
            (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
          return MyHomePage(tag: listItem.title);
        }));
      },
    );
  }
}
