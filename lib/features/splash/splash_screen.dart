import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/extensions.dart';
import 'package:mega_hub/core/theming/app_colors.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';

import '../../core/routing/app_router.dart';
import '../../core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  final AppRouter? appRouter;

  const SplashScreen({super.key, this.appRouter});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _progressController;
  late AnimationController _logoPartsController;

  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoFadeAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _textFadeAnimation;
  late Animation<double> _progressAnimation;

  // Animations for logo parts
  late Animation<Offset> _leftPartAnimation;
  late Animation<Offset> _rightPartAnimation;
  late Animation<Offset> _centerPartAnimation;
  late Animation<double> _logoRotationAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startSplashSequence();
  }

  void _initializeAnimations() {
    // Logo parts animation controller
    _logoPartsController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Individual logo parts animations
    _leftPartAnimation = Tween<Offset>(
      begin: const Offset(-2.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _logoPartsController,
      curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
    ));

    _rightPartAnimation = Tween<Offset>(
      begin: const Offset(2.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _logoPartsController,
      curve: const Interval(0.1, 0.7, curve: Curves.elasticOut),
    ));

    _centerPartAnimation = Tween<Offset>(
      begin: const Offset(0, -2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _logoPartsController,
      curve: const Interval(0.2, 0.8, curve: Curves.bounceOut),
    ));

    _logoRotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoPartsController,
      curve: const Interval(0.8, 1.0, curve: Curves.easeInOut),
    ));

    // Main logo animations
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    _logoScaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    ));

    _logoFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
    ));

    // Text animations
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOutBack,
    ));

    _textFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeInOut,
    ));

    // Progress animation
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOut,
    ));
  }

  void _startSplashSequence() async {
    // Remove native splash after a delay
    await Future.delayed(const Duration(milliseconds: 800));
    FlutterNativeSplash.remove();

    // Start logo parts animation
    _logoPartsController.forward();

    // Start main logo animation with slight delay
    await Future.delayed(const Duration(milliseconds: 400));
    _logoController.forward();

    // Start text animation
    await Future.delayed(const Duration(milliseconds: 600));
    _textController.forward();

    // Start progress animation
    await Future.delayed(const Duration(milliseconds: 800));
    _progressController.forward();

    // Initialize app
    await _initializeApp();

    // Extra delay before navigation
    await Future.delayed(const Duration(milliseconds: 1500));

    // Navigate to home screen
    if (mounted) {
      context.pushReplacementNamed(Routes.homeScreen);
    }
  }

  Future<void> _initializeApp() async {
    try {
      await Future.wait([
        _simulateInitialization("Loading MEGA services...", 800),
        _simulateInitialization("Preparing your hub...", 900),
        _simulateInitialization("Finalizing setup...", 700),
      ]);
    } catch (e) {
      debugPrint('Initialization error: $e');
    }
  }

  Future<void> _simulateInitialization(String task, int delayMs) async {
    await Future.delayed(Duration(milliseconds: delayMs));
    debugPrint('Completed: $task');
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _progressController.dispose();
    _logoPartsController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedMegaLogo() {
    return SizedBox(
      width: 140.w,
      height: 140.h,
      child: AnimatedBuilder(
        animation: _logoRotationAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _logoRotationAnimation.value * 0.1, // Subtle rotation
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Left part of the M
                AnimatedBuilder(
                  animation: _leftPartAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        _leftPartAnimation.value.dx * 50,
                        _leftPartAnimation.value.dy * 50,
                      ),
                      child: CustomPaint(
                        size: Size(140.w, 140.h),
                        painter: MegaLogoLeftPainter(),
                      ),
                    );
                  },
                ),
                // Right part of the M
                AnimatedBuilder(
                  animation: _rightPartAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        _rightPartAnimation.value.dx * 50,
                        _rightPartAnimation.value.dy * 50,
                      ),
                      child: CustomPaint(
                        size: Size(140.w, 140.h),
                        painter: MegaLogoRightPainter(),
                      ),
                    );
                  },
                ),
                // Center part
                AnimatedBuilder(
                  animation: _centerPartAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        _centerPartAnimation.value.dx * 50,
                        _centerPartAnimation.value.dy * 50,
                      ),
                      child: CustomPaint(
                        size: Size(140.w, 140.h),
                        painter: MegaLogoCenterPainter(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appMainColor, // MEGA red background
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated MEGA Logo
                    AnimatedBuilder(
                      animation: Listenable.merge([
                        _logoScaleAnimation,
                        _logoFadeAnimation,
                      ]),
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _logoScaleAnimation.value,
                          child: FadeTransition(
                            opacity: _logoFadeAnimation,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: _buildAnimatedMegaLogo(),
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 50.h),

                    // Animated MEGA Text
                    AnimatedBuilder(
                      animation: Listenable.merge([
                        _textSlideAnimation,
                        _textFadeAnimation,
                      ]),
                      builder: (context, child) {
                        return SlideTransition(
                          position: _textSlideAnimation,
                          child: FadeTransition(
                            opacity: _textFadeAnimation,
                            child: Text(
                              'MEGA',
                              style: AppTextStyles.megaSplash
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Progress indicator at bottom
            Padding(
              padding: EdgeInsets.only(bottom: 80.h),
              child: AnimatedBuilder(
                animation: _progressAnimation,
                builder: (context, child) {
                  return Column(
                    children: [
                      SizedBox(
                        width: 200.w,
                        height: 3.h,
                        child: LinearProgressIndicator(
                          value: _progressAnimation.value,
                          backgroundColor: Colors.white.withValues(alpha: 0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      FadeTransition(
                        opacity: _textFadeAnimation,
                        child: Text(
                          'Initializing MEGA...',
                          style: AppTextStyles.loadingSplash
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painters for MEGA logo parts
class MegaLogoLeftPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final w = size.width * 0.3;
    final h = size.height * 0.4;

    // Left part of M shape
    path.moveTo(center.dx - w, center.dy - h);
    path.lineTo(center.dx - w/2, center.dy - h);
    path.lineTo(center.dx - w/4, center.dy);
    path.lineTo(center.dx - w/2, center.dy + h);
    path.lineTo(center.dx - w, center.dy + h);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MegaLogoRightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final w = size.width * 0.3;
    final h = size.height * 0.4;

    // Right part of M shape
    path.moveTo(center.dx + w, center.dy - h);
    path.lineTo(center.dx + w, center.dy + h);
    path.lineTo(center.dx + w/2, center.dy + h);
    path.lineTo(center.dx + w/4, center.dy);
    path.lineTo(center.dx + w/2, center.dy - h);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MegaLogoCenterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final w = size.width * 0.15;
    final h = size.height * 0.4;

    // Center part of M
    path.moveTo(center.dx - w/2, center.dy - h);
    path.lineTo(center.dx + w/2, center.dy - h);
    path.lineTo(center.dx, center.dy - h/3);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}