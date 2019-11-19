import 'package:flutter/material.dart';
import 'package:flutter_app/locale/translations_delegate.dart';
import 'package:flutter_app/page/ChipPage.dart';
import 'package:flutter_app/page/ExpansionTilePage.dart';
import 'package:flutter_app/page/FutureBuilderPage.dart';
import 'package:flutter_app/page/GridViewPage.dart';
import 'package:flutter_app/page/ImagePage.dart';
import 'package:flutter_app/page/KeepAlivePage.dart';
import 'package:flutter_app/page/MyHomePage.dart';
import 'package:flutter_app/page/PavlovaPage.dart';
import 'package:flutter_app/page/RandomWords.dart';
import 'package:flutter_app/page/Routes.dart';
import 'package:flutter_app/page/ScreenUtilTest.dart';
import 'package:flutter_app/page/StateWidgetPage.dart';
import 'package:flutter_app/page/SwiperPage.dart';
import 'package:flutter_app/page/ThemePage.dart';
import 'package:flutter_app/page/Transform3D.dart';
import 'package:flutter_app/page/WrapPage.dart';
import 'package:flutter_app/page/animation_page.dart';
import 'package:flutter_app/page/animation_two.dart';
import 'package:flutter_app/page/backdrop_page.dart';
import 'package:flutter_app/page/custom_view.dart';
import 'package:flutter_app/page/draggable_dragtargets.dart';
import 'package:flutter_app/page/flutter_native_web.dart';
import 'package:flutter_app/page/flutter_youtube_page.dart';
import 'package:flutter_app/page/login_page.dart';
import 'package:flutter_app/page/search_page.dart';
import 'package:flutter_app/page/share_page.dart';
import 'package:flutter_app/page/sqflite_page.dart';
import 'package:flutter_app/page/tab_page.dart';
import 'package:flutter_app/page/textField.dart';
import 'package:flutter_app/page/tree_page.dart';
import 'package:flutter_app/page/video_player.dart';
import 'package:flutter_app/page/webview_page.dart';
import 'package:flutter_app/page/youtube_player_page.dart';
import 'package:flutter_app/rxdart/bloc_provider.dart';
import 'package:flutter_app/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'page/stepper_page.dart';

void main() => runApp(BlocProvider(child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    //AppModel appModel = AppModel();
    final themeSelect = BlocProvider.of(context);
    return StreamBuilder(
      builder: _builder,
      stream: themeSelect.value,
      initialData: false,
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot snapshot) {
    return MaterialApp(
      title: 'Welcome to Flutter_study',
      theme: snapshot.data ? AppTheme().darkTheme : AppTheme().lightTheme,
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("zh"), Locale("en")],
      home: Routes(),
      routes: <String, WidgetBuilder>{
        //静态路由,无法传参
        'route': (_) => Routes(),
        'randomWords': (_) => RandomWords(),
        'Home': (_) => MyHomePage(),
        'Pavlova': (_) => PavlovaPage(),
        'Image': (_) => ImagePage(),
        'GridView': (_) => GridViewPage(),
        'StateWidget': (_) => StateWidgetPage(),
        'TextField': (_) => TextFieldAndCheckPage(),
        'KeepAlive': (_) => KeepAliveDemo(),
        'Swiper': (_) => SwiperPage(),
        'Wrap': (_) => WrapPage(),
        'Animation': (_) => AnimationPage(),
        'ScreenUtilPage': (_) => ScreenUtilTest(title: 'ScreenUtil测试'),
        'FutureBuilderPage': (_) => FutureBuilderPage(),
        'ThemePage': (_) => ThemePage(),
        'ChipPage': (_) => ChipPage(),
        'ExpansionTilePage': (_) => ExpansionTilePage(),
        'TransformPage': (_) => Transform3D(),
        'LoginPage': (_) => LoginPage(),
        'WebViewPage': (_) => WebViewPage(),
        'CustomViewPage': (_) => CustomViewPage(),
        'TabPae': (_) => TabPage(),
        'backdropPage': (_) => BackdropPage(),
        'Draggable': (_) => DraggableDragtargets(),
        'SharePage': (_) => SharePage(),
        'AnimationTwo': (_) => AnimationTwo(),
        'SearchPage': (_) => SearchPage(),
        'VideoPlayerPage': (_) => VideoPlayerPage(),
        'FlutterYoutubePage': (_) => FlutterYoutubePage(),
        'YoutubePlayerPage': (_) => YoutubePlayerPage(),
        'FlutterNativeWeb': (_) => FlutterNativeWebPage(),
        'SqfLitePage': (_) => SqfLite(),
        'StepperPage': (_) => StepperPage(),
        'TreePage': (_) => TreePage(),
      },
    );
  }
}
