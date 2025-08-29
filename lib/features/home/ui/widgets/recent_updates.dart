import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widget/session_card.dart';

class RecentUpdates extends StatefulWidget {
  const RecentUpdates({super.key});

  @override
  State<RecentUpdates> createState() => _RecentUpdatesState();
}

class _RecentUpdatesState extends State<RecentUpdates> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent Updates",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
        ),
        verticalSpace(8),
        SizedBox(
          height: 150.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            padEnds: false,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: const SessionCard(),
              );
            },
          ),
        ),
        verticalSpace(10),
        Center(
          child: SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: WormEffect(
              dotColor: Colors.grey,
              activeDotColor: Colors.red,
              dotHeight: 8.h,
              dotWidth: 20.w,
            ),
          ),
        ),
      ],
    );
  }
}
