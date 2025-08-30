import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../data/models/user_details_response_model.dart';

class HomeTopBar extends StatelessWidget {
  final UserDetailsResponseModel userDetails;

  const HomeTopBar({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  userDetails.profilePictureUrl != null &&
                      userDetails.profilePictureUrl!.isNotEmpty
                  ? NetworkImage(userDetails.profilePictureUrl!)
                  : null,
              child:
                  (userDetails.profilePictureUrl == null ||
                      userDetails.profilePictureUrl!.isEmpty)
                  ? const Icon(Icons.person, size: 24)
                  : null,
            ),
            horizontalSpace(8),
            Text(
              "Hello,\n${userDetails.userName ?? "User"}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Icon(Icons.notifications_active_outlined),
      ],
    );
  }
}
