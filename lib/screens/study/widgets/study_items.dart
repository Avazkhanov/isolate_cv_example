import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isolate_cv_example/utils/app_colors/app_colors.dart';
import 'package:isolate_cv_example/utils/app_images/app_images.dart';

class StudyItems extends StatelessWidget {
  const StudyItems(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4});

  final String text1;
  final String text2;
  final String text3;
  final String text4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(AppImages.save),
              SizedBox(height: 16.h),
              Text(
                text1,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              SizedBox(height: 30.h),
              Text(
                text2,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              SizedBox(height: 30.h),
              Text(
                text3,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),

          Row(
            children: [
              SizedBox(width: 30.w),
              Text(
                text4,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
