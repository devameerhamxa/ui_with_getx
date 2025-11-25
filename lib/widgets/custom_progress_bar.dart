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
            height: 20.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Stack(
                children: [
                  // Background (dark grey)
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: const Color(0xFF4A4A4A),
                  ),

                  if (clampedProgress < 1.0)
                    Positioned.fill(
                      child: ClipRect(
                        child: Align(
                          alignment: Alignment.centerRight,
                          widthFactor: 1.0 - clampedProgress,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return CustomPaint(
                                size: Size(
                                  constraints.maxWidth,
                                  constraints.maxHeight,
                                ),
                                painter: GreaterThanPatternPainter(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                  FractionallySizedBox(
                    widthFactor: clampedProgress,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                      child: Container(
                        color: const Color(AppConstants.progressBarFill),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GreaterThanPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    // Smaller font size to ensure full visibility within bar height
    final textStyle = TextStyle(
      color: const Color(0xFF2A2A2A),
      fontSize: 50,
      fontWeight: FontWeight.w200,
    );

    final textPainter = TextPainter(
      text: TextSpan(text: '>', style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final charWidth = textPainter.width;
    final charHeight = textPainter.height;

    final spacing = 2.0;
    final totalWidth = charWidth + spacing;
    final count = ((size.width) / totalWidth).floor();

    for (int i = 0; i < count; i++) {
      final x = i * totalWidth + spacing;
      // Center vertically with padding to ensure full visibility
      final y = (size.height - charHeight) / 2;

      textPainter.paint(canvas, Offset(x, y));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
