import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/theming/app_colors.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../data/models/user_details_response_model.dart';

class UserDetailsCard extends StatelessWidget {
  final UserDetailsResponseModel userDetails;

  const UserDetailsCard({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.appMainColor, width: 1.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28.r,
              backgroundImage:
                  userDetails.profilePictureUrl != null &&
                      userDetails.profilePictureUrl!.isNotEmpty
                  ? NetworkImage(userDetails.profilePictureUrl!)
                  : null,
              child:
                  (userDetails.profilePictureUrl == null ||
                      userDetails.profilePictureUrl!.isEmpty)
                  ? const Icon(Icons.person, size: 28)
                  : null,
            ),
            horizontalSpace(11.5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "User Details",
                    style: AppTextStyles.font16plusJakartaSansExtraBoldLavaRed,
                  ),
                  Text(
                    userDetails.userName ?? "Unknown User",
                    style: AppTextStyles.font12plusJakartaSansRegularCarbonGrey,
                  ),
                  Text(
                    "ID: ${userDetails.id ?? "N/A"}",
                    style: AppTextStyles.font12plusJakartaSansRegularCarbonGrey,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "Progress Level: Unknown",
                    style: AppTextStyles.font12plusJakartaSansRegularCarbonGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
