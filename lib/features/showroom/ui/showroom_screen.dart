import 'package:flutter/material.dart';

import '../../../core/widget/app_bottom_navigation_bar.dart';

class ShowroomScreen extends StatelessWidget {
  const ShowroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(selectedIndex: 1),
      body: Center(child: Text("Welcome to ShowRoom Screen!!!!! ")),
    );
  }
}
