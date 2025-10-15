import 'package:flutter/material.dart';

class FidesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FidesAppBar({super.key, required this.title, this.leading, this.actions});

  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      leading: leading,
      actions: actions,
    );
  }
}
