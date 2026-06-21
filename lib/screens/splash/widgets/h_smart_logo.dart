import 'package:flutter/material.dart';
import '../../../config/theme/app_theme.dart';

class HSmartLogo extends StatefulWidget {
  const HSmartLogo({Key? key}) : super(key: key);

  @override
  State<HSmartLogo> createState() => _HSmartLogoState();
}

class _HSmartLogoState extends State<HSmartLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
      reverse: true,
    )..repeat();
    _glowAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.statusOk
                        .withOpacity(0.3 + _glowAnimation.value * 0.4),
                    blurRadius: 40 + _glowAnimation.value * 20,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.statusOk
                      .withOpacity(0.6 + _glowAnimation.value * 0.4),
                  width: 2,
                ),
              ),
            ),
            Text(
              'H',
              style: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                color: Colors.grey[300],
                shadows: [
                  Shadow(
                    offset: const Offset(4, 4),
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
