import 'package:flutter/foundation.dart' show immutable;

@immutable
class RouteLocation {
  const RouteLocation._();
  static String get splash => '/';
  static String get signUp => '/signUp';
  static String get signIn => '/signIn';
  static String get home => '/home';
}
