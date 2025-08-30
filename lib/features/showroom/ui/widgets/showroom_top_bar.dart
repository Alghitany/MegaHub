import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/searchbar.dart';

class ShowroomTopBar extends StatelessWidget {
  const ShowroomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: SearchBarAndIcons()),
        SizedBox(width: 23.w),
        Icon(Icons.notifications_active_outlined, size: 32.sp),
      ],
    );
  }
}
