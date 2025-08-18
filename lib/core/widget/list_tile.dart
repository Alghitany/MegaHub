import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? titleTextStyle;

  const CustomListTile({
    super.key,
    required this.title,
    required this.onTap,
    this.leading,
    this.trailing,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle:titleTextStyle ,
      leading: leading,
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
