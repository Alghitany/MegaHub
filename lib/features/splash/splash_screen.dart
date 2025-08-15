import 'dart:math' as Math;
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
  late AnimationController _barsController;
  late AnimationController _textController;
  late AnimationController _progressController;
  late AnimationController _floatingController;

  // Individual bar animations
  late Animation<Offset> _bar1SlideAnimation;
  late Animation<Offset> _bar2SlideAnimation;
  late Animation<Offset> _bar3SlideAnimation;
  late Animation<Offset> _bar4SlideAnimation;

  late Animation<double> _bar1ScaleAnimation;
  late Animation<double> _bar2ScaleAnimation;
  late Animation<double> _bar3ScaleAnimation;
  late Animation<double> _bar4ScaleAnimation;

  late Animation<double> _bar1RotationAnimation;
  late Animation<double> _bar2RotationAnimation;
  late Animation<double> _bar3RotationAnimation;
  late Animation<double> _bar4RotationAnimation;

  late Animation<double> _barsOpacityAnimation;

  // Floating animation
  late Animation<double> _floatingAnimation;

  // Text animations
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _textFadeAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startSplashSequence();
  }

  void _initializeAnimations() {
    // Main bars animation controller
    _barsController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    // Floating animation controller for continuous movement
    _floatingController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Bars opacity
    _barsOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
    ));

    // Bar 1 animations (leftmost bar - lean right)
    _bar1SlideAnimation = Tween<Offset>(
      begin: const Offset(-4.0, -2.0),
      end: const Offset(-1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
    ));

    _bar1ScaleAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.0, 0.5, curve: Curves.bounceOut),
    ));

    _bar1RotationAnimation = Tween<double>(
      begin: -0.8,
      end: 0.15, // Lean right (15 degrees)
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.2, 0.7, curve: Curves.elasticOut),
    ));

    // Bar 2 animations (second bar - lean left)
    _bar2SlideAnimation = Tween<Offset>(
      begin: const Offset(-2.0, -4.0),
      end: const Offset(-0.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.1, 0.7, curve: Curves.elasticOut),
    ));

    _bar2ScaleAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.1, 0.6, curve: Curves.bounceOut),
    ));

    _bar2RotationAnimation = Tween<double>(
      begin: 0.8,
      end: -0.15, // Lean left (-15 degrees)
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.3, 0.8, curve: Curves.elasticOut),
    ));

    // Bar 3 animations (third bar - lean right)
    _bar3SlideAnimation = Tween<Offset>(
      begin: const Offset(2.0, -4.0),
      end: const Offset(0.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    _bar3ScaleAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.2, 0.7, curve: Curves.bounceOut),
    ));

    _bar3RotationAnimation = Tween<double>(
      begin: -0.6,
      end: 0.15, // Lean right (15 degrees)
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.4, 0.9, curve: Curves.elasticOut),
    ));

    // Bar 4 animations (rightmost bar - lean left)
    _bar4SlideAnimation = Tween<Offset>(
      begin: const Offset(4.0, -2.0),
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.3, 0.9, curve: Curves.elasticOut),
    ));

    _bar4ScaleAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.3, 0.8, curve: Curves.bounceOut),
    ));

    _bar4RotationAnimation = Tween<double>(
      begin: 0.6,
      end: -0.15, // Lean left (-15 degrees)
    ).animate(CurvedAnimation(
      parent: _barsController,
      curve: const Interval(0.5, 1.0, curve: Curves.elasticOut),
    ));

    // Floating animation for continuous subtle movement
    _floatingAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _floatingController,
      curve: Curves.easeInOut,
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

    // Start bars animation
    _barsController.forward();

    // Start floating animation and repeat
    await Future.delayed(const Duration(milliseconds: 2000));
    _floatingController.repeat(reverse: true);

    // Start text animation
    await Future.delayed(const Duration(milliseconds: 500));
    _textController.forward();

    // Start progress animation
    await Future.delayed(const Duration(milliseconds: 300));
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
    _barsController.dispose();
    _textController.dispose();
    _progressController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  Widget _buildSingleBar({
    required Animation<Offset> slideAnimation,
    required Animation<double> scaleAnimation,
    required Animation<double> rotationAnimation,
    required double floatingOffset,
    required double zIndex,
  }) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        slideAnimation,
        scaleAnimation,
        rotationAnimation,
        _barsOpacityAnimation,
        _floatingAnimation,
      ]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            slideAnimation.value.dx * 40.w + (floatingOffset * _floatingAnimation.value * 2),
            slideAnimation.value.dy * 40.h + (Math.sin(_floatingAnimation.value * 2 * 3.14159 + floatingOffset) * 1.5),
          ),
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: Transform.rotate(
              angle: rotationAnimation.value,
              child: Opacity(
                opacity: _barsOpacityAnimation.value * (0.7 + (zIndex * 0.1)), // Depth effect
                child: Container(
                  width: 35.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3 - (zIndex * 0.05)),
                        blurRadius: 15 - (zIndex * 2),
                        offset: Offset(zIndex * 2, 8 - (zIndex * 1)),
                      ),
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: 0.4),
                          Colors.white.withValues(alpha: 0.1),
                          Colors.black.withValues(alpha: 0.1),
                        ],
                        stops: const [0.0, 0.6, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedBars() {
    return SizedBox(
      width: 280.w,
      height: 200.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Bar 1 (leftmost bar - lean right) - Behind all others
          _buildSingleBar(
            slideAnimation: _bar1SlideAnimation,
            scaleAnimation: _bar1ScaleAnimation,
            rotationAnimation: _bar1RotationAnimation,
            floatingOffset: 1.0,
            zIndex: 3.0, // Furthest back
          ),
          // Bar 2 (second bar - lean left)
          _buildSingleBar(
            slideAnimation: _bar2SlideAnimation,
            scaleAnimation: _bar2ScaleAnimation,
            rotationAnimation: _bar2RotationAnimation,
            floatingOffset: -0.8,
            zIndex: 2.0,
          ),
          // Bar 3 (third bar - lean right)
          _buildSingleBar(
            slideAnimation: _bar3SlideAnimation,
            scaleAnimation: _bar3ScaleAnimation,
            rotationAnimation: _bar3RotationAnimation,
            floatingOffset: -1.2,
            zIndex: 1.0,
          ),
          // Bar 4 (rightmost bar - lean left) - In front
          _buildSingleBar(
            slideAnimation: _bar4SlideAnimation,
            scaleAnimation: _bar4ScaleAnimation,
            rotationAnimation: _bar4RotationAnimation,
            floatingOffset: 0.6,
            zIndex: 0.0, // Closest to front
          ),
        ],
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
                    // Animated Four Bars
                    _buildAnimatedBars(),

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
                              style: AppTextStyles.megaSplash,
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
                          style: AppTextStyles.loadingSplash,
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