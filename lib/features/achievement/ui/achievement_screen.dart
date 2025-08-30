import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/extensions.dart';
import 'package:mega_hub/features/achievement/ui/widget/achievement_card.dart';
import 'package:mega_hub/features/achievement/ui/widget/achievement_category.dart';
import 'package:mega_hub/features/achievement/ui/widget/events.dart';

import '../../../core/theming/app_text_styles.dart';
import '../../../core/widget/searchbar.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({super.key});

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      context.pop();
                    }, icon: Icon(Icons.arrow_back)),
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
                    Text("Achievements", style: AppTextStyles.AchievmentsText),
                    Text("See All", style: AppTextStyles.SeeAllText),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(height: 39.h, child: AchievementCategory()),
                SizedBox(height: 24.h),
                EventsCard(
                  megaEvents: MegaEvents(
                    title: "MegaCast",
                    description:
                        "An educational podcast designed specifically for students looking to boost their productivity and stand out from the crowd. it offers practical tips and insights on time management, study techniques, personal development, and career planning. Whether you're in high school or college,Megcast provides the guidance and inspiration you need to excel academically and personally.",
                    iconsvgs: "assets/svgs/material-icon.svg",
                    imageAsset: "assets/images/megcast.png",
                    buttonText: 'Join the Experience',
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 8.h),
                EventsCard(
                  megaEvents: MegaEvents(
                    title: "MegaVerse",
                    description:
                        "Megaverse, an event dedicated to the exploration of the metaverse. This groundbreaking gathering brought together a remarkable assembly of over 10 distinguished speakers, each offering unique insights into the rapidly evolving realm of the metaverse.Megaverse fostered engaging discussions and in-depth explorations of the metaverse's potential impact on our digital landscape.",
                    iconsvgs: "assets/svgs/megaverse.svg",
                    imageAsset: "assets/images/megaverse.png",
                    buttonText: 'Join the Experience',
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 8.h),
                EventsCard(
                  megaEvents: MegaEvents(
                    title: "Fight Fear",
                    description:
                        "Fight Fear event stands as a significant milestone in our journey of empowering students within the field of computer science. This event was a testament to our commitment to breaking down barriers and instilling confidence in aspiring technologists. With the aim of helping students overcome their fears and uncertainties, 'Fight Fear' provided a transformative experience. It encouraged individuals to take their first steps toward mastering the world of computer science.",
                    iconsvgs: "assets/svgs/megaverse.svg",
                    imageAsset: "assets/images/fightfear.png",
                    buttonText: 'Join the Experience',
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 8.h),
                EventsCard(
                  megaEvents: MegaEvents(
                    title: "Get Switched On",
                    description:
                        "Get switched on workshop was organized by us to assist students in getting started with the track, conducted in collaboration with UCCD and certified by them. This workshop aimed to provide students with the necessary knowledge and skills to begin their journey in the field. It covered various topics, including front-end, back-end development, flutter development and Security.",
                    iconsvgs: "assets/svgs/get switchedon.svg",
                    imageAsset: "assets/images/getswitchedon.png",
                    buttonText: 'Join the Experience',
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 8.h),
                EventsCard(
                  megaEvents: MegaEvents(
                    title: "YLF Finalists",
                    description:
                        "YLF Leaders League is a prestigious national competition encompassing a wide range of student activities. We are proud to have reached the finals in the Leaders League 3 competition, specifically in the field of Technology and Innovation. Our achievement stands out among 500 student initiatives, showcasing our innovative concept. This recognition underscores our commitment to making a meaningful impact on society through technology and innovation.",
                    iconsvgs: "assets/svgs/ylffinalists.svg",
                    imageAsset: "assets/images/ylffinalists.png",
                    buttonText: 'Join the Experience',
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
