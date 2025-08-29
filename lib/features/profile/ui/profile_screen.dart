import 'package:flutter/material.dart';
import 'package:mega_hub/core/helpers/spacing.dart';
import 'package:mega_hub/core/routing/routes.dart';

import '../../../core/helpers/shared_pref_helper.dart';
import '../../../core/networking/dio_factory.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/widget/app_bottom_navigation_bar.dart';
import '../../../core/widget/profile_list_tile.dart';
import 'widgets/profile_image_and_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(selectedIndex: 3),
      body: Column(
        children: [
          verticalSpace(64),
          ProfileImageAndName(),
          verticalSpace(20),
          CustomListTile(
            onTap: () {},
            title: "Account and Profile",
            leading: Icon(
              Icons.person_outline,
              size: 32,
              color: AppColors.appMainColor,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          verticalSpace(16),
          CustomListTile(
            onTap: () {},
            title: "Manage payment Method",
            leading: Icon(
              Icons.payment_outlined,
              size: 32,
              color: AppColors.appMainColor,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          verticalSpace(16),
          CustomListTile(
            onTap: () {},
            title: "Contact Support",
            leading: Icon(
              Icons.contact_support_outlined,
              size: 32,
              color: AppColors.appMainColor,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          verticalSpace(16),
          CustomListTile(
            onTap: () {},
            title: "Write a Review",
            leading: Icon(
              Icons.reviews_outlined,
              size: 32,
              color: AppColors.appMainColor,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          verticalSpace(16),
          CustomListTile(
            onTap: () {},
            title: "Privacy Policy",
            leading: Icon(
              Icons.mark_unread_chat_alt,
              size: 32,
              color: AppColors.appMainColor,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          verticalSpace(16),
          CustomListTile(
            onTap: () {},
            title: "Invite Friends",
            leading: Icon(
              Icons.person_add,
              size: 32,
              color: AppColors.appMainColor,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          verticalSpace(16),
          CustomListTile(
            onTap: () async {
              final navigator = Navigator.of(context);
              await SharedPrefHelper.clearAllData();
              await SharedPrefHelper.clearAllSecuredData();
              DioFactory.setTokenIntoHeaderAfterLogin("");
              navigator.pushNamedAndRemoveUntil(
                Routes.loginScreen,
                (route) => false,
              );
            },
            title: "Logout",
            leading: Icon(
              Icons.logout,
              size: 32,
              color: AppColors.appMainColor,
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
      ),
    );
  }
}
