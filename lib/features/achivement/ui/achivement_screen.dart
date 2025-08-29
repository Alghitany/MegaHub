import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theming/app_colors.dart';
class AchivementScreen extends StatelessWidget {
  const AchivementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Hinted search text",
                      suffixIcon: Icon(Icons.search),
                      prefixIcon: Icon(Icons.menu),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 23,),
                Icon(Icons.notifications_active_outlined,size: 32,),
              ],
            ),
SizedBox(height: 24,),
            Container(
              height: 155,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16), 
              decoration: BoxDecoration(
                color: Color(0xFFFFDEDE),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.appMainColor, width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("30+", style: TextStyle(fontSize: 66, fontWeight: FontWeight.w600, color: AppColors.appMainColor,),),
                      Text("Podcast", style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600,),),
                    ],
                  ),
                  Flexible(
                    child: SvgPicture.asset("assets/svgs/podcast.svg",
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),),
      )),
    );
  }
}
