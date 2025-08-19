import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_hub/features/home/ui/home_screen.dart';

import '../../features/profile/ui/profile_screen.dart';
import '../../features/roadmaps/ui/roadmaps_screen.dart';
import '../../features/showroom/ui/showroomscreen.dart';
import '../theming/app_colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  final List<Widget> screens =  [
    HomeScreen(),
    ShowRoomScreen(),
    ProfileScreen(),
    RoadMapsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: AppColors.appMainColor,
        unselectedItemColor: Color(0XFF757575),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
           BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/svgs/showroom.svg"), label: "ShowRoom"),
          BottomNavigationBarItem(icon:SvgPicture.asset("assets/svgs/roadmaps.svg"), label: "RoadMaps"),
           BottomNavigationBarItem(icon: SvgPicture.asset("assets/svgs/person.svg "), label: "Prpfile"),
        ],
      ),
    );
  }
}
