import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isolate_cv_example/screens/study/widgets/study_items.dart';
import 'package:isolate_cv_example/utils/app_colors/app_colors.dart';
import 'package:isolate_cv_example/utils/app_images/app_images.dart';


class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_FDFDFD,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36.h),
            Text(
              "Academic backgr.",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 36.h),
            const StudyItems(
              text1: "Specialization",
              text2: 'UX/UI Design',
              text3: "La Zona - FUE (Fundación\nUniversidad Empresa)",
              text4: "Year: 2022",
            ),
            SizedBox(height: 36.h),
            const StudyItems(
              text1: "Specialization",
              text2: 'UX/UI Design',
              text3: "La Zona - FUE (Fundación\nUniversidad Empresa)",
              text4: "Year: 2022",
            ),
          ],
        ),
      ),
    );
  }
}
