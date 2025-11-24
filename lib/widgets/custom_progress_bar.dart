import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_constants.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress;
  final int current;
  final int max;

  const CustomProgressBar({
    super.key,
    required this.progress,
    required this.current,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    final clampedProgress = progress.clamp(0.0, 1.0);
    
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 8.h,
            decoration: BoxDecoration(
              color: const Color(AppConstants.progressBarEmpty),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                // Filled portion
                FractionallySizedBox(
                  widthFactor: clampedProgress,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(AppConstants.progressBarFill),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
                // Chevron pattern for empty portion only
                Positioned.fill(
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.centerRight,
                      widthFactor: 1.0 - clampedProgress,
                      child: CustomPaint(
                        painter: ChevronPatternPainter(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          '$current/$max',
          style: TextStyle(
            color: const Color(AppConstants.textPrimary),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ChevronPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(AppConstants.progressBarEmpty)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const double chevronWidth = 6.0;
    const double chevronSpacing = 2.0;

    for (double x = 0; x < size.width; x += chevronWidth + chevronSpacing) {
      final path = Path()
        ..moveTo(x, size.height / 2)
        ..lineTo(x + chevronWidth / 2, 0)
        ..lineTo(x + chevronWidth, size.height / 2)
        ..lineTo(x + chevronWidth / 2, size.height)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

