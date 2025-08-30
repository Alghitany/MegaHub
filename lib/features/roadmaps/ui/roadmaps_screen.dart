import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/features/roadmaps/ui/widget/roadmap_card.dart';
import 'package:mega_hub/features/roadmaps/ui/widget/roadmaps_category.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../achivement/ui/widget/achievementcard.dart';
import '../../achivement/ui/widget/searchbar.dart';

class RoadMapsScreen extends StatelessWidget {
  const RoadMapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: SearchBarAndIcons()),
                    SizedBox(width: 23.w),
                    Icon(Icons.notifications_active_outlined, size: 32.sp),
                  ],
                ),
                SizedBox(height: 24.h),
                AchievementCard(
                  num: "30+",
                  text: "podcast",
                  svgs: "assets/svgs/podcast.svg",
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Roadmaps", style: AppTextStyles.AchievmentsText),
                    GestureDetector(
                      onTap: () {

                      },
                      child: Text(
                        "See All",
                        style: AppTextStyles.SeeAllText.copyWith(
                          color: AppColors.appMainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 39.h, child: RoadmapsCategory()),
                SizedBox(height: 24.h),
                SizedBox(
                  height: 600.h,
                  child:   GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    children: [
                      RoadmapCard(
                        svgpath: 'assets/svgs/flutter-roadmap-icon.svg',
                        Texttitle: 'Flutter Roadmap',
                        onPressed: () {},
                      ),
                      RoadmapCard(
                        svgpath: 'assets/svgs/uiux-icon.svg',
                        Texttitle: 'UIUX Design Roadmap',
                        onPressed: () {},
                      ),
                      RoadmapCard(
                        imagepath: "assets/svgs/fullstack-icon.png",
                        Texttitle: 'Full Stack Roadmap',
                        onPressed: () {},
                      ),
                      RoadmapCard(
                        svgpath: 'assets/svgs/cyber-security-icon.svg',
                        Texttitle: 'Cyber Security Roadmap',
                        onPressed: () {},
                      ),
                      RoadmapCard(
                        imagepath: "assets/svgs/backend-icon.png",
                        Texttitle: 'Backend Roadmap',
                        onPressed: () {},
                      ),
                      RoadmapCard(
                        imagepath: "assets/svgs/frontend-icon.png",
                        Texttitle: 'Frontend Roadmap',
                        onPressed: () {},
                      ),
                    ],
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
