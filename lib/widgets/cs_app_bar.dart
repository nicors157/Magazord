import 'package:flutter/material.dart';

class CsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CsAppBar({
    required this.title,
    this.actions,
    this.leading,
    this.preferredSize = const Size.fromHeight(45),
    this.elevation = 8,
    this.icon,
    super.key,
  });

  @override
  final Size preferredSize;

  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final double elevation;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      centerTitle: true,
      elevation: elevation,
      backgroundColor: theme.colorScheme.primary,
      actionsIconTheme: theme.appBarTheme.iconTheme,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold
        ),
      ),
      actions: actions,
      leading: leading,
    );
  }
}
