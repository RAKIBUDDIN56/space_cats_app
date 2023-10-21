import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../config/routes/routes_location.dart';
import '../utils/services/services.dart';

class SplashScreen extends StatefulWidget {
  static SplashScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SplashScreen();
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  navigate() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Services.user == null
          ? context.go(RouteLocation.signUp)
          : context.go(RouteLocation.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/logo.jpeg')),
    );
  }
}
