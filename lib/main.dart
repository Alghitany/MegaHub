import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';
import 'mega_hub_app.dart';

void main() async {
  runApp(MegaHubApp(
    appRouter: AppRouter(),
  ));
}
