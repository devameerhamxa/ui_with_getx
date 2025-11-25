import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_constants.dart';

class ProfileInfoCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final VoidCallback? onTap;

  const ProfileInfoCard({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (leading != null) ...[leading!, SizedBox(width: 12.w)],
            Text(
              title,
              style: TextStyle(
                color: const Color(AppConstants.textPrimary),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: Icon(
                Icons.chevron_right,
                color: const Color(AppConstants.textPrimary),
                size: 30.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
