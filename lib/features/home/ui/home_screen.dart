import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/spacing.dart';
import 'package:mega_hub/core/widget/app_text_form_field.dart';

import '../../../core/widget/app_bottom_navigation_bar.dart';
import 'widgets/achievements_and_motivation_corner.dart';
import 'widgets/explore_and_grow.dart';
import 'widgets/home_event_card.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/recent_updates.dart';
import 'widgets/user_details_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(selectedIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopBar(),
              verticalSpace(20),
              AppTextFormField(
                hintText: "Hinted search text",
                validator: (value) {
                  return null;
                },
                suffixIcon: Icon(Icons.search),
                prefixIcon: Icon(Icons.menu),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.w,
                ),
              ),
              verticalSpace(8),
              UserDetailsCard(),
              verticalSpace(24),
              ExploreAndGrow(),
              verticalSpace(20),
              HomeEventCard(),
              verticalSpace(20),
              AchievementsAndMotivationCorner(),
              verticalSpace(8),
              RecentUpdates(),
            ],
          ),
        ),
      ),
    );
  }
}
