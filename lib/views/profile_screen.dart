// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/profile_controller.dart';
import '../utils/app_constants.dart';
import '../widgets/custom_progress_bar.dart';
import '../widgets/profile_info_card.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(AppConstants.primaryDark),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Background image section with overlay
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Background image placeholder (car image)
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: const Color(0xFF2A2A2A)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.r),
                          topRight: Radius.circular(32.r),
                        ),
                        child: Image.asset(
                          'assets/images/carImage.jpg',
                          width: double.infinity,

                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
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
                    ],
                  ),
                ),

                // Overlay icons and badges
                Positioned(
                  top: 18.h,
                  left: 14.w,
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(7.w),
                    child: SvgPicture.asset('assets/svgs/qmark.svg'),
                  ),
                ),

                Positioned(
                  top: 18.h,
                  right: 50.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
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
                          style: GoogleFonts.lato(
                            color: const Color(AppConstants.textPrimary),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        SvgPicture.asset(
                          'assets/svgs/ticket.svg',
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 18.h,
                  right: 12.w,
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: const Color(0xff131417),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(7.w),
                    child: SvgPicture.asset(
                      'assets/svgs/setting.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Profile picture
                Positioned(
                  bottom: -50.h,
                  left: 16.w,
                  child: Container(
                    width: 111.w,
                    height: 110.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(AppConstants.primaryDark),
                      border: Border.all(
                        color: const Color(0xff131417),
                        width: 6.w,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/dp.jpg',
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
                            Row(
                              children: [
                                Text(
                                  controller.userName,
                                  style: GoogleFonts.lato(
                                    color: const Color(
                                      AppConstants.textPrimary,
                                    ),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.username,
                                        style: TextStyle(
                                          fontFamily: 'Eudoxus Sans',
                                          color: const Color(
                                            AppConstants.textPrimary,
                                          ),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        '${controller.status} 🌀',

                        style: TextStyle(
                          color: const Color(AppConstants.textPrimary),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.instagramHandle,
                        style: TextStyle(
                          color: const Color(AppConstants.textSecondary),
                          fontSize: 12.sp,
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/person1.svg',
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                '${controller.followers}',
                                style: TextStyle(
                                  fontFamily: 'Eudoxus Sans',
                                  color: const Color(AppConstants.textPrimary),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16.w),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/person2.svg',
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                '${controller.following}',
                                style: TextStyle(
                                  fontFamily: 'Eudoxus Sans',
                                  color: const Color(AppConstants.textPrimary),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),

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
                            SizedBox(width: 5.w),
                            Text(
                              controller.level,
                              style: TextStyle(
                                fontFamily: 'Baron Neue',
                                color: const Color(AppConstants.textPrimary),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'XP',
                              style: TextStyle(
                                color: const Color(AppConstants.textSecondary),
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              '${controller.currentXP}/${controller.maxXP}',
                              style: TextStyle(
                                color: const Color(AppConstants.textPrimary),
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
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
                                          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
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
                                          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
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
                                          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
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
                                          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
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
    );
  }
}
