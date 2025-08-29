import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/theming/app_colors.dart';
import 'package:mega_hub/features/achivement/ui/widget/achievementcard.dart';
import 'package:mega_hub/features/achivement/ui/widget/roadmaps.dart';
import 'package:mega_hub/features/achivement/ui/widget/searchbar.dart';

import '../../../core/theming/app_text_styles.dart';
class AchivementScreen extends StatefulWidget {
  const AchivementScreen({super.key});

  @override
  State<AchivementScreen> createState() => _AchivementScreenState();
}

class _AchivementScreenState extends State<AchivementScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SearchBarandIcons(),
                ),
                SizedBox(width: 23.w,),
                Icon(Icons.notifications_active_outlined,size: 32.sp,),
              ],
            ),
            SizedBox(height: 24.h,),
           AchievementCard(num: "30+", text: "podcast", svgs: "assets/svgs/podcast.svg"),
            SizedBox(height: 14.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Roadmaps", style: AppTextStyles.RoadmapText),
                Text("See All", style: AppTextStyles.SeeAllText),
              ],
            ),
SizedBox(height: 10.h,),
            SizedBox(height: 50.h,child: Roadmaps(),)
          ],
        ),
        ),
      )),
    );
  }
}
