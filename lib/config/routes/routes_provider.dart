import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_cats_app/config/config.dart';
import 'package:go_router/go_router.dart';

final navigationKey = GlobalKey<NavigatorState>();

final routesProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: RouteLocation.splash,
      navigatorKey: navigationKey,
      routes: appRoutes,
    );
  },
);
