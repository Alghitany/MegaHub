import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theming/app_colors.dart';

class SearchBarandIcons extends StatelessWidget {
  SearchBarandIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Hinted search text",
        suffixIcon: const Icon(Icons.search),
        prefixIcon: const Icon(Icons.menu),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
class AchievementCard extends StatelessWidget {
  final String num;
  final String text;
  final String svgs;

  const AchievementCard({
    super.key,
    required this.num,
    required this.text,
    required this.svgs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.appMainColor, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                num,
                style: TextStyle(
                  fontSize: 66,
                  fontWeight: FontWeight.w600,
                  color: AppColors.appMainColor,
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Flexible(
            child: SvgPicture.asset(
              svgs,
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
