import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/app_colors.dart';

class SessionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.appMainColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CV writing session', style: TextStyle(color: AppColors.appMainColor, fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('1/8/2025', style: TextStyle(fontSize: 14)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:  AppColors.appMainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                ),
                child: Text('Book Now!', style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/svgs/recentupdateicon.svg",
            width: 52,
            height: 52,
          ),        ],
      ),
    );
  }
}
