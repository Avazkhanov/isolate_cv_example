import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_images/app_images.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.c_FDFDFD,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.pdf),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 36.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Languages",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 36.h),
          ...List.generate(
            titles.length,
            (index) => ListTile(
              onTap: () {},
              leading: Image.asset(
                images[index],
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
              title: Text(
                titles[index],
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                subtitles[index],
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> titles = ["Uzbek", "Russian", "English"];
List<String> subtitles = [
  "native speaker",
  "native speaker",
  "Beginner",
];
List<String> images = [
  AppImages.uzbekFlag,
  AppImages.russianFlag,
  AppImages.usaFlag
];
