import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage('')),
            horizontalSpace(8),
            Text(
              "Hello,\nUser Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            horizontalSpace(10),
            Icon(Icons.notifications_active_outlined),
          ],
        ),
      ],
    );
  }
}
