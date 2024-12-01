import 'package:flutter/material.dart';

import 'navigation_service.dart';
import 'service_locator.dart';

final _navigatorKey = getIt<NavigationService>().navigatorKey;

void showSnackbar({
  required String description,
  int seconds = 3,
  SnackBarAction? action,
  SnackBarBehavior? behavior,
}) {
  ScaffoldMessenger.of(_navigatorKey.currentContext!).removeCurrentSnackBar();

  ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
      duration: Duration(seconds: seconds),
      behavior: behavior ?? SnackBarBehavior.floating,
      action: action,
      backgroundColor: Colors.white,
    ),
  );
}
