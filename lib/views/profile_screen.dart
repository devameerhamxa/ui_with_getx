// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/profile_controller.dart';
import '../utils/app_constants.dart';
import '../widgets/custom_progress_bar.dart';
import '../widgets/profile_info_card.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppConstants.primaryDark),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Text(
                  'Profile - Posts',
                  style: TextStyle(
                    color: const Color(AppConstants.textPrimary),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Background image section with overlay
              Stack(
                children: [
                  // Background image placeholder (car image)
                  Container(
                    height: 250.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1617531653332-bd46c24f2068?w=800',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            const Color(
                              AppConstants.primaryDark,
                            ).withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Overlay icons and badges
                  Positioned(
                    top: 12.h,
                    left: 16.w,
                    child: Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.help_outline,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 12.h,
                    right: 48.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(AppConstants.cardBackground),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${controller.tickets} TICKETS',
                            style: TextStyle(
                              color: const Color(AppConstants.textPrimary),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF9C27B0), Color(0xFFFFEB3B)],
                              ),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        color: const Color(AppConstants.cardBackground),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),

                  // Profile picture
                  Positioned(
                    bottom: -50.h,
                    left: 16.w,
                    child: Container(
                      width: 100.w,
                      height: 100.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(AppConstants.primaryDark),
                          width: 4.w,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 60.h),

              // User information section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userName,
                                style: TextStyle(
                                  color: const Color(AppConstants.textPrimary),
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Text(
                                    controller.username,
                                    style: TextStyle(
                                      color: const Color(
                                        AppConstants.textSecondary,
                                      ),
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  GestureDetector(
                                    onTap: () {
                                      // Handle edit profile
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: const Color(
                                        AppConstants.textSecondary,
                                      ),
                                      size: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: const Color(
                                    AppConstants.textSecondary,
                                  ),
                                  size: 20.sp,
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '${controller.followers}',
                                  style: TextStyle(
                                    color: const Color(
                                      AppConstants.textPrimary,
                                    ),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 16.w),
                            Column(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: const Color(
                                    AppConstants.textSecondary,
                                  ),
                                  size: 20.sp,
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '${controller.following}',
                                  style: TextStyle(
                                    color: const Color(
                                      AppConstants.textPrimary,
                                    ),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    Row(
                      children: [
                        Text(
                          controller.status,
                          style: TextStyle(
                            color: const Color(AppConstants.textPrimary),
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          width: 16.w,
                          height: 16.w,
                          decoration: BoxDecoration(
                            color: const Color(AppConstants.accentBlue),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 10.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      controller.instagramHandle,
                      style: TextStyle(
                        color: const Color(AppConstants.textSecondary),
                        fontSize: 12.sp,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // XP/Level section
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: const Color(AppConstants.cardBackground),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: const Color(AppConstants.accentRed),
                                size: 20.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                controller.level,
                                style: TextStyle(
                                  color: const Color(AppConstants.textPrimary),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'XP',
                            style: TextStyle(
                              color: const Color(AppConstants.textSecondary),
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          CustomProgressBar(
                            progress: controller.xpProgress,
                            current: controller.currentXP,
                            max: controller.maxXP,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Bottom cards row
                    Row(
                      children: [
                        Expanded(
                          child: ProfileInfoCard(
                            title: '${controller.connections}',
                            subtitle: 'Connections',
                            leading: SizedBox(
                              width: 60.w,
                              height: 32.w,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left: 0,
                                    child: Container(
                                      width: 32.w,
                                      height: 32.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(
                                            AppConstants.cardBackground,
                                          ),
                                          width: 2.w,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20.w,
                                    child: Container(
                                      width: 32.w,
                                      height: 32.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(
                                            AppConstants.cardBackground,
                                          ),
                                          width: 2.w,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 40.w,
                                    child: Container(
                                      width: 32.w,
                                      height: 32.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(
                                            AppConstants.cardBackground,
                                          ),
                                          width: 2.w,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 60.w,
                                    child: Container(
                                      width: 32.w,
                                      height: 32.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(
                                            AppConstants.cardBackground,
                                          ),
                                          width: 2.w,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              // Handle connections tap
                            },
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ProfileInfoCard(
                            title: 'PURCHASES',
                            subtitle: 'View your Purchases',
                            onTap: () {
                              // Handle purchases tap
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
