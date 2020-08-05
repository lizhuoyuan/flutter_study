import 'package:flutter/material.dart';
import 'package:flutter_app/locale/translations_delegate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoutePage extends StatelessWidget {
  final List<ListItem> listData = [];

  void initData(BuildContext context) {
    listData.clear();

    listData.add(ListItem("Home Page", "Home", Icons.home));
    listData.add(ListItem("Pavlova示例", "Pavlova", Icons.panorama_vertical));
    listData.add(ListItem("randomWords示例", "randomWords", Icons.book));
    listData.add(ListItem("图片", "Image", Icons.image));
    listData.add(ListItem("GridView", "GridView", Icons.grid_on));
    listData.add(ListItem("StateWidget", "StateWidget", Icons.widgets));
    listData.add(ListItem("TextField", "TextField", Icons.text_fields));
    listData.add(ListItem("KeepAlive", "KeepAlive", Icons.live_tv));
    listData.add(ListItem("Swiper", "Swiper", Icons.landscape));
    listData.add(ListItem("流式布局", "Wrap", Icons.landscape));
    listData.add(ListItem("动画", "Animation", Icons.landscape));
    listData.add(ListItem('动画2', 'AnimationTwo', Icons.android));
    listData.add(ListItem("屏幕适配示例", "ScreenUtilPage", Icons.landscape));
    listData.add(
        ListItem("futureBuilder", "FutureBuilderPage", Icons.hourglass_full));
    listData.add(ListItem("主题", "ThemePage", Icons.landscape));
    listData.add(ListItem("Chip", "ChipPage", Icons.landscape));
    listData
        .add(ListItem("ExpansionTile", "ExpansionTilePage", Icons.landscape));
    listData.add(ListItem("Transform 3D效果", "TransformPage", Icons.landscape));
    listData.add(ListItem("登录页", "LoginPage", Icons.landscape));
    listData.add(ListItem("WebView", "WebViewPage", Icons.web));
    listData.add(ListItem("自定义View", "CustomViewPage", Icons.view_quilt));
    listData.add(ListItem("Tab的使用", "TabPae", Icons.view_quilt));
    listData.add(ListItem("backdropPage", "backdropPage", Icons.view_quilt));
    listData.add(ListItem('可拖动组件', 'Draggable', Icons.drag_handle));
    listData.add(ListItem('分享', 'SharePage', Icons.share));
    listData.add(ListItem('搜索', 'SearchPage', Icons.search));
    listData.add(ListItem('mp4视频播放', 'VideoPlayerPage', Icons.video_library));
    listData.add(
        ListItem('Youtube视频播放', 'FlutterYoutubePage', Icons.video_library));
    listData
        .add(ListItem('FlutterNativeWeb插件的使用', 'FlutterNativeWeb', Icons.web));
    listData.add(ListItem('sqflite的使用', 'SqfLitePage', Icons.crop_square));
    listData.add(ListItem('步骤条Stepper ', 'StepperPage', Icons.short_text));
    listData.add(ListItem('类似于qq列表的组件树', 'TreePage', Icons.people));
    listData.add(ListItem('Sliver', 'Sliver', Icons.list));
    listData.add(ListItem('CupertinoActionSheet', 'CupertinoActionSheetPage',
        Icons.call_to_action));
  }

  @override
  Widget build(BuildContext context) {
    initData(context);

    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context,width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('列表'),
        centerTitle: true,
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
    return ListTile(
        title: Text(listItem.title),
        leading: Icon(listItem.iconData),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.pushNamed(context, listItem.routeName,
              arguments: listItem.title);
        });
  }
}
