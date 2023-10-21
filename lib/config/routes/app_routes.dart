import 'package:space_cats_app/config/config.dart';
import 'package:space_cats_app/screens/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:space_cats_app/screens/signin_screen.dart';
import 'package:space_cats_app/screens/signup_screen.dart';
import 'package:space_cats_app/screens/splash_screen.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.splash,
    parentNavigatorKey: navigationKey,
    builder: SplashScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.signUp,
    parentNavigatorKey: navigationKey,
    builder: SignupScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.signIn,
    parentNavigatorKey: navigationKey,
    builder: SigninScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
];
