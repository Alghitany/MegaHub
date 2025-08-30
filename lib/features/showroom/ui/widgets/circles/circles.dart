import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import 'circle_card.dart';

class Circles extends StatelessWidget {
  const Circles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Circles", style: AppTextStyles.font20InderRegularDarkJungleGreen),
        verticalSpace(8),

        Row(
          children: [
            Expanded(
              child: CircleCard(
                imagePath: "assets/images/rd.png",
                title: "R&D",
                subText:
                    "The R&D circle within our team serves a dual purpose, addressing both internal and external aspects. Internally, it focuses on skill enhancement...",
                onMoreTap: () {
                  debugPrint("Navigate to R&D details page");
                },
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: CircleCard(
                imagePath: "assets/images/hr.png",
                title: "HR",
                subText:
                    "Human Resources Circle is the first follower and represents the spirit of all team members. The tasks of the Circle are as follows: Raising team spirit and maintaining balance among ...",
                onMoreTap: () {
                  debugPrint("Navigate to details page");
                },
              ),
            ),
          ],
        ),
        verticalSpace(16),

        Row(
          children: [
            Expanded(
              child: CircleCard(
                imagePath: "assets/images/media.png",
                title: "Media",
                subText:
                    "The Media Circle holds a significant responsibility in the team by overseeing the creation of essential designs for advertisements. Their diverse tasks encompass various ...",
                onMoreTap: () {
                  debugPrint("Navigate to R&D details page");
                },
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: CircleCard(
                imagePath: "assets/images/pr.png",
                title: "PR&FR",
                subText:
                    "The PR circle has a special role in representing the team, and here are their important tasks: They communicate with different activities, organizations, and important people",
                onMoreTap: () {
                  debugPrint("Navigate to details page");
                },
              ),
            ),
          ],
        ),
        verticalSpace(16),

        Container(
          height: 150.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.appMainColor, width: 1.w),
          ),
          child: Row(
            children: [
              // Text side
              Expanded(
                flex: 2, // take 2/3 of space
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Logistics",
                        style: AppTextStyles.font24InderRegularLavaRed,
                      ),
                      verticalSpace(8),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                "The Logistics Circle plays a crucial role in representing the team at various events and ensuring a strong team presence. They are responsible for managing the team's booth, showcasing",
                              ),
                              TextSpan(
                                text: " more..",
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    debugPrint("More tapped on Logistics");
                                  },
                              ),
                            ],
                          ),
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.black,
                            height: 1.4,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Image side
              Expanded(
                flex: 1, // take 1/3 of space
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                  child: Image.asset(
                    "assets/images/logistics.png",
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        )

      ],
    );
  }
}
