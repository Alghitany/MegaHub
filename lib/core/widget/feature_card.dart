import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/app_colors.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final SvgPicture icon;

  const FeatureCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMotivation = title == "Motivation Corner";

    return Container(
      width: 150,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.appMainColor, width: 1),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 35, width: 35, child: icon),
          const SizedBox(height: 6),
          if (!isMotivation)
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            )
          else
            Column(
              children: const [
                Text(
                  "Motivation Corner",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  '"Keep going — every small\nstep forward is still progress\ntoward your bigger dream."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 9,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
