import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/app_constants.dart';

class UrbanApexCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isActive;
  final String difficulty;
  final String date;
  final String duration;

  const UrbanApexCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.isActive,
    required this.difficulty,
    required this.date,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFF676D75), width: 1),
      ),
      child: Row(
        children: [
          // Thumbnail image
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          // Content section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(AppConstants.textPrimary),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Duration on the right
                    Text(
                      duration,
                      style: TextStyle(
                        color: const Color(AppConstants.textPrimary),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    if (isActive) ...[
                      Icon(
                        Icons.check,
                        color: const Color(0xffE1B651),
                        size: 14.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Active',
                        style: TextStyle(
                          color: const Color(AppConstants.textPrimary),
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 4.w),
                    ],
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/fire.svg',
                          width: 14.w,
                          height: 14.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          difficulty,
                          style: TextStyle(
                            color: const Color(AppConstants.textPrimary),
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  date,
                  style: TextStyle(
                    color: const Color(AppConstants.textPrimary),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
