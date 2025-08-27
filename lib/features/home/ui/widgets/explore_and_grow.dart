import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widget/action_button.dart';

class ExploreAndGrow extends StatelessWidget {
  const ExploreAndGrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore & Grow",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w800),
        ),
        verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ActionButton(
                label: "Show Room",
                icon: SvgPicture.asset("assets/svgs/showroom.svg"),
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: ActionButton(
                label: "Roadmaps",
                icon: SvgPicture.asset("assets/svgs/roadmaps.svg"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
