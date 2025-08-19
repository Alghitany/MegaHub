import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/widget/action_button.dart';
import '../../../core/widget/feature_card.dart';
import '../../../core/widget/session_card.dart';
import '../../../core/widget/timer.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  CircleAvatar(backgroundImage: AssetImage('')),
                  SizedBox(width: 7),
                  Text(
                    "Hello,\nUser Name",
                    style: TextStyle(fontWeight: FontWeight.bold),),],),
              Row(
                children: const [
                  Icon(Icons.link),
                  SizedBox(width: 10),
                  Icon(Icons.notifications_active_outlined),],),],),
               SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "Hinted search text",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),),),),
               SizedBox(height: 10),
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.red, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(backgroundImage: AssetImage('')),
                      const SizedBox(width: 11.5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User Details"),
                          Text("UserName"),
                          Text("ID: D124589"),
                          Text("Progress Level: Beginner"),],),],),),),
               SizedBox(height: 24),
              Text("Exploar & Grow", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
               SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: ActionButton(label: "Show Room",icon: SvgPicture.asset("assets/svgs/showroom.svg"),)),
                  SizedBox(width: 10),
                  Expanded(child: ActionButton(label: "Roadmaps",icon: SvgPicture.asset("assets/svgs/roadmaps.svg"),),),],),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.red, width: 1),),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 28, backgroundImage: AssetImage('')),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("MEGA Event",
                                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.red, fontSize: 16)),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                                const SizedBox(width: 4),
                                Text("15 August, 2025", style: TextStyle(color: Colors.grey)),
                                const SizedBox(width: 8),
                                Icon(Icons.access_time, size: 14, color: Colors.grey),
                                const SizedBox(width: 4),
                                Text("02:00 PM", style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            const SizedBox(height: 6),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: StadiumBorder(),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                elevation: 0,
                              ),
                              child: Text("Book Now", style: TextStyle(color: Colors.white)),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TimerBlock(value: "02", label: "Days"),
                                TimerBlock(value: "48", label: "Hours"),
                                TimerBlock(value: "28", label: "Minutes"),],),],),),],),),),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeatureCard(title: "Achievements", icon: SvgPicture.asset("assets/svgs/achievments.svg"),),
                  FeatureCard(title: "Motivation Corner", icon: SvgPicture.asset("assets/svgs/motivationcorner.svg"),),],),
               SizedBox(height: 20),
              Text("Recent Updates", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              SizedBox(
                height: 130,
                child: PageView(
                  controller: _pageController,
                  children: [SessionCard(), SessionCard(), SessionCard()],),),
              SizedBox(height: 10),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.red,
                    dotHeight: 8,
                    dotWidth: 20,),),),],),),);}}
