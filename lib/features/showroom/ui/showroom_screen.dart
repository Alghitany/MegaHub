import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/spacing.dart';
import 'package:mega_hub/features/showroom/ui/widgets/showroom_top_bar.dart';

import '../../../core/widget/app_bottom_navigation_bar.dart';
import '../../achievement/ui/widget/achievement_card.dart';
import 'widgets/about_us.dart';
import 'widgets/circles/circles.dart';
import 'widgets/our_goal.dart';

class ShowroomScreen extends StatelessWidget {
  const ShowroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(selectedIndex: 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ShowroomTopBar(),
                verticalSpace(24),
                AchievementCard(
                  num: "30+",
                  text: "podcast",
                  svgs: "assets/svgs/podcast.svg",
                ),
                verticalSpace(16),
                AboutUs(),
                verticalSpace(16),
                OurGoal(),
                verticalSpace(16),
                Circles(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
