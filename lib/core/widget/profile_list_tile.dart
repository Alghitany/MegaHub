import 'package:flutter/material.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';

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
      leading: leading,
      title: Text(
        title,
        style: titleTextStyle ?? AppTextStyles.listTileTitleStyle,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
