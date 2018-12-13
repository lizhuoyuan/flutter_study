import 'package:flutter/material.dart';
import 'package:flutter_app/AnimationPage.dart';
import 'package:flutter_app/ChipPage.dart';
import 'package:flutter_app/ExpansionTilePage.dart';
import 'package:flutter_app/FutureBuilderPage.dart';
import 'package:flutter_app/GridViewPage.dart';
import 'package:flutter_app/ImagePage.dart';
import 'package:flutter_app/KeepAlivePage.dart';
import 'package:flutter_app/MyHomePage.dart';
import 'package:flutter_app/PavlovaPage.dart';
import 'package:flutter_app/RandomWords.dart';
import 'package:flutter_app/Routes.dart';
import 'package:flutter_app/ScreenUtilTest.dart';
import 'package:flutter_app/StateWidgetPage.dart';
import 'package:flutter_app/SwiperPage.dart';
import 'package:flutter_app/ThemePage.dart';
import 'package:flutter_app/Transform3D.dart';
import 'package:flutter_app/WrapPage.dart';
import 'package:flutter_app/backdrop_page.dart';
import 'package:flutter_app/custom_view.dart';
import 'package:flutter_app/draggable_dragtargets.dart';
import 'package:flutter_app/locale/translations_delegate.dart';
import 'package:flutter_app/login_page.dart';
import 'package:flutter_app/rxdart/bloc_provider.dart';
import 'package:flutter_app/share_page.dart';
import 'package:flutter_app/tab_page.dart';
import 'package:flutter_app/textField.dart';
import 'package:flutter_app/theme/app_theme.dart';
import 'package:flutter_app/webview_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(BlocProvider(child: MyApp()));

class MyApp extends StatelessWidget {
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
      },
    );
  }
}
