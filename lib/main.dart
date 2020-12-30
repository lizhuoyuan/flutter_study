import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/locale/translations_delegate.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/rxdart/bloc_provider.dart';
import 'package:flutter_app/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

/// Reports [error] along with its [stackTrace] to Sentry.io.
Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  print('-Caught error: $error');

  // Errors thrown in development mode are unlikely to be interesting. You can
  // check if you are running in dev mode using an assertion and omit sending
  // the report.
  if (isInDebugMode) {
    print(stackTrace);
    print('In dev mode. Not sending report to Sentry.io.');
    return;
  }

  print('Reporting to Sentry.io...');

  print('Success! Event ID:  ');
}

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // Sentry.
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };
  runApp(BlocProvider(child: const MyApp()));
//
//  runZonedGuarded<Future<Null>>(() async {
//    runApp(BlocProvider(child: const MyApp()));
//  }, (error, stackTrace) async {
//    await _reportError(error, stackTrace);
//  });
}

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
    return ScreenUtilInit(
        allowFontScaling: false,
        designSize: Size(360, 720),
        child: MaterialApp(
          title: 'Welcome to Flutter_study',
          theme: snapshot.data ? AppTheme().darkTheme : AppTheme().lightTheme,
          localizationsDelegates: [
            const TranslationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [Locale("zh"), Locale("en")],
          initialRoute: '/',
          routes: routes,
          onGenerateRoute: onGenerateRoute,
          navigatorObservers: [
            Ob1(),
          ],
        ));
  }
}

class Ob1 extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print('从${previousRoute?.settings?.name}到${route?.settings?.name}');
  }
}
