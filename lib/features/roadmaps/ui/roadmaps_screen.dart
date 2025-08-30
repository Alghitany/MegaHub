import 'package:flutter/material.dart';

import '../../../core/widget/app_bottom_navigation_bar.dart';

class RoadmapsScreen extends StatelessWidget {
  const RoadmapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(selectedIndex: 2),
      body: Center(child: Text("Welcome to RoadMaps Screen ")),
    );
  }
}
