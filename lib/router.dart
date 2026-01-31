
import 'package:flutter/cupertino.dart';
import 'package:interview_task/core/model/task.dart';
import 'package:interview_task/ui/views/create/task_create_edit_page.dart';
import 'package:interview_task/ui/views/home/home_page.dart';
import 'package:interview_task/ui/views/login/login_page.dart';
import 'package:interview_task/ui/views/splash/splash_page.dart';
import 'package:flutter/material.dart';

const String initialRoute = "login";

class Routes {
  static const String splash = "/";
  static const String home = "/home";
  static const String login = "login";

  static const String createTask = "/createTask";

}

class AppRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

    case Routes.splash:
      return CupertinoPageRoute(
        builder: (_) => SplashPage(),
        settings: RouteSettings(name: settings.name),
      );

    case Routes.home:
      return MaterialPageRoute(
        builder: (_) => HomePage(),
        settings: RouteSettings(name: settings.name),
      );

    case Routes.createTask:
      var data = settings.arguments;
      return MaterialPageRoute(
        builder: (_) => TaskCreateEditPage(data != null ? data as Task : null),
        settings: RouteSettings(name: settings.name),
      );

      case Routes.login:
        var data = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: RouteSettings(name: settings.name),
        );


      default:
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                )
            );

    }

  }

}

/// NoTransitionRoute
/// Custom route which has no transitions
class NoTransitionRoute<T> extends MaterialPageRoute<T> {
  NoTransitionRoute({ required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

/// NoPushTransitionRoute
/// Custom route which has no transition when pushed, but has a pop animation
class NoPushTransitionRoute<T> extends MaterialPageRoute<T> {
  NoPushTransitionRoute({ required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // is popping
    if (animation.status == AnimationStatus.reverse) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return child;
  }
}

/// NoPopTransitionRoute
/// Custom route which has no transition when popped, but has a push animation
class NoPopTransitionRoute<T> extends MaterialPageRoute<T> {
  NoPopTransitionRoute({ required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // is pushing
    if (animation.status == AnimationStatus.forward) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return child;
  }
}

class RouteUtils {
  static RoutePredicate withNameLike(String name) {
    return (Route<dynamic> route) {
      return !route.willHandlePopInternally &&
          route is ModalRoute &&
          route.settings.name != null &&
          route.settings.name?.contains(name) == true;
    };
  }
}