import 'package:flutter/material.dart';
import 'package:space_cats_app/utils/utils.dart';

@immutable
class AppAlerts {
  const AppAlerts._();

  static displaySnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.bodyMedium,
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
