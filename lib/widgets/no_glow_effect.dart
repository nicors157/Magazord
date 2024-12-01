import 'package:flutter/material.dart';

class NoGlowEffect extends ScrollBehavior {
  const NoGlowEffect();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
