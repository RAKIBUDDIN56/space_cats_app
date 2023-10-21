import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_cats_app/app/app.dart';
import 'package:space_cats_app/utils/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Services();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
