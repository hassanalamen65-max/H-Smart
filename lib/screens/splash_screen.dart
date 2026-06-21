import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:h_smart/config/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: FadeTransition(
        opacity: _fadeController,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // H-Smart Logo with Circuit Pattern
              Stack(
                alignment: Alignment.center,
                children: [
                  // Digital Circuit Pattern Background
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.operational.withOpacity(0.3),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.operational.withOpacity(0.2),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: CustomPaint(
                      painter: CircuitPatternPainter(
                        color: AppColors.operational,
                      ),
                    ),
                  ),
                  // Metallic H Letter
                  Text(
                    'H',
                    style: TextStyle(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      shadows: [
                        Shadow(
                          color: AppColors.operational.withOpacity(0.6),
                          blurRadius: 20,
                          offset: const Offset(0, 0),
                        ),
                        Shadow(
                          color: AppColors.operational.withOpacity(0.3),
                          blurRadius: 40,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // H-Smart Title
              Text(
                'H-Smart',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppColors.operational,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 8),
              // Subtitle
              Text(
                'HVAC Monitoring & Smart Building',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.textSecondary,
                      letterSpacing: 1,
                    ),
              ),
              const SizedBox(height: 50),
              // Loading Indicator
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.operational,
                  ),
                  strokeWidth: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircuitPatternPainter extends CustomPainter {
  final Color color;

  CircuitPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.2)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    // Draw concentric circles
    for (int i = 1; i <= 3; i++) {
      canvas.drawCircle(
        Offset(centerX, centerY),
        radius * (i / 4),
        paint,
      );
    }

    // Draw circuit lines
    for (int i = 0; i < 8; i++) {
      final angle = (i * 45) * 3.14159 / 180;
      final x1 = centerX + (radius * 0.3) * cos(angle);
      final y1 = centerY + (radius * 0.3) * sin(angle);
      final x2 = centerX + (radius * 0.8) * cos(angle);
      final y2 = centerY + (radius * 0.8) * sin(angle);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(CircuitPatternPainter oldDelegate) => false;
}

import 'dart:math';
