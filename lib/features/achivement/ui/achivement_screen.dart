import 'package:flutter/material.dart';
import '../widget/achievement.dart';
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
                  child: SearchBarandIcons(),
                ),
                SizedBox(width: 23,),
                Icon(Icons.notifications_active_outlined,size: 32,),
              ],
            ),
SizedBox(height: 24,),
           AchievementCard(num: "30+", text: "podcast", svgs: "assets/svgs/podcast.svg")
          ],
        ),),
      )),
    );
  }
}
