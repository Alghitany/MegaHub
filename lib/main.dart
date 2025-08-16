import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependecy_injection.dart';
import 'core/routing/app_router.dart';
import 'mega_hub_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(MegaHubApp(appRouter: AppRouter()));
}
