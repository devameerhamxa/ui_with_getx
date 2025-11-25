// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../controllers/profile_controller.dart';
import '../utils/app_constants.dart';

class EditProfileScreen extends GetView<ProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameController = TextEditingController(
      text: controller.fullName.value,
    );
    final bioController = TextEditingController(text: controller.bio.value);

    return Scaffold(
      backgroundColor: const Color(AppConstants.primaryDark),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header section with background image
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: 200.h,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32.r),
                                bottomRight: Radius.circular(32.r),
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
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(32.r),
                                  bottomRight: Radius.circular(32.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Back arrow
                      Positioned(
                        top: 16.h,
                        left: 20.w,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                      // X icon
                      Positioned(
                        top: 16.h,
                        right: 20.w,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                      // Profile picture
                      Positioned(
                        bottom: -60.h,
                        left: 16.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                try {
                                  final ImagePicker picker = ImagePicker();
                                  final XFile? image = await picker.pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  if (image != null) {
                                    log(
                                      'Updating profile image: ${image.path}',
                                    );
                                    // Update profile image with the selected image
                                    controller.updateProfileImage(image.path);
                                    log('Profile image updated');
                                  }
                                } catch (e, stackTrace) {
                                  // Handle error if image picker fails
                                  log('Error picking image: $e');
                                  log('Stack trace: $stackTrace');
                                }
                              },
                              child: Container(
                                width: 120.w,
                                height: 120.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(AppConstants.primaryDark),
                                  border: Border.all(
                                    color: const Color(0xff131417),
                                    width: 6.w,
                                  ),
                                ),
                                child: ClipOval(
                                  child: Obx(() {
                                    final imagePath =
                                        controller.profileImagePath.value;
                                    if (imagePath.startsWith('/')) {
                                      // File path from image picker
                                      return Image.file(
                                        File(imagePath),
                                        fit: BoxFit.cover,
                                      );
                                    } else {
                                      // Asset path
                                      return Image.asset(
                                        imagePath,
                                        fit: BoxFit.cover,
                                      );
                                    }
                                  }),
                                ),
                              ),
                            ),
                            // Upload icon (visual indicator only)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xff131417),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(
                                      AppConstants.primaryDark,
                                    ),
                                    width: 2.w,
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                  size: 22.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80.h),
                  // Content fields
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Full Name field
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 32.w),
                                  Text(
                                    'Full Name',
                                    style: TextStyle(
                                      color: const Color(
                                        AppConstants.textSecondary,
                                      ),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 32.w),
                                    child: TextField(
                                      controller: fullNameController,
                                      style: TextStyle(
                                        color: const Color(
                                          AppConstants.textPrimary,
                                        ),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: -5,
                                    bottom: 5,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 24.w,
                                        height: 24.w,
                                        child: Icon(
                                          Icons.mail,
                                          color: Colors.white,
                                          size: 18.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        // Bio field
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 32.w),
                                  Text(
                                    'Bio',
                                    style: TextStyle(
                                      color: const Color(
                                        AppConstants.textSecondary,
                                      ),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 32.w),
                                    child: TextField(
                                      controller: bioController,
                                      maxLines: 3,
                                      style: TextStyle(
                                        color: const Color(
                                          AppConstants.textPrimary,
                                        ),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: SizedBox(
                                      width: 24.w,
                                      height: 24.w,
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                        size: 18.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 270.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: const Color(AppConstants.primaryDark),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.updateProfile(
                          fullNameController.text,
                          bioController.text,
                        );
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.r),
                        ),
                      ),
                      child: Text(
                        'UPDATE',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
