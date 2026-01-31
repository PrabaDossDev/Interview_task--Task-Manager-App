import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_task/router.dart';
import 'package:interview_task/services/shared/dialog_service.dart';
import 'package:interview_task/services/shared/navigator_service.dart';
import 'core/res/styles.dart';
import 'helper/dialog_manager.dart';
import 'locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  runZoned<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    setupLocator();

    FlutterError.onError = (FlutterErrorDetails details) {
      print(details.toString());
    };

    runApp(MyApp());
  }, onError: (Object obj, StackTrace stack) {
    print(stack.toString());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Platform.isIOS ? Brightness.light : Brightness.dark));

    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder:(context,child)=> MaterialApp(
        title: "InterView Task",
        theme: AppStyle.appTheme,
        builder: _setupDialogManager,
        initialRoute:  Routes.splash,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigationService.navigatorKey,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      ),
    );
  }

  Widget _setupDialogManager(context, widget) {
    return Navigator(
      key: locator<DialogService>().dialogNavigationKey,
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        final MediaQueryData data = MediaQuery.of(context);
        return DialogManager(
          child: MediaQuery(
            data: data.copyWith(textScaleFactor: 1.0),
            child: widget,
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
