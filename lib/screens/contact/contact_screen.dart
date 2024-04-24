import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isolate_cv_example/screens/contact/widgets/contact_button.dart';
import 'package:isolate_cv_example/utils/app_colors/app_colors.dart';
import 'package:isolate_cv_example/utils/app_images/app_images.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
        padding: EdgeInsets.only(left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36.h),
            Text(
              "Contact",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 36.h),
            Text(
              "Hello there! I live in Uzbekistan, Qibray (Tashkent), and there are many ways to contact me:",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 20.h),
            ContactButton(
              iconsPath: AppImages.callSvg,
              title: "+998 94 936 93 97",
              onTab: () {
                final Uri phoneUrl = Uri(
                  scheme: 'tel',
                  path: '+998949369397',
                );
                UrlLauncher.launchUrl(phoneUrl);
              },
            ),
            SizedBox(height: 10.h),
            ContactButton(
              iconsPath: AppImages.messegSvg,
              title: "avazkxanovdadaxon@gmail.com",
              onTab: () {
                final Uri mailUrl = Uri(
                  scheme:'mailto',
                  path: 'avazkxanovdadaxon@gmail.com',
                );
                UrlLauncher.launchUrl(mailUrl);
              },
            ),
            SizedBox(height: 10.h),
            ContactButton(
              iconsPath: AppImages.globusSvg,
              title: "avazkxanovdadaxon@gmail.com",
              onTab: () {
                final Uri mailUrl = Uri(
                  scheme:'mailto',
                  path: 'avazkxanovdadaxon@gmail.com',
                );
                UrlLauncher.launchUrl(mailUrl);
              },
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Uri instagramUrl = Uri.parse(
                        "https://www.linkedin.com/in/avazkhanov-dadakhan-074a03297/");
                    UrlLauncher.launchUrl(instagramUrl);
                  },
                  child: SvgPicture.asset(
                    AppImages.linkSvg,
                    width: 32.w,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Uri instagramUrl =
                        Uri.parse("https://www.instagram.com/_avazkxanov_/");
                    UrlLauncher.launchUrl(instagramUrl);
                  },
                  child: SvgPicture.asset(
                    AppImages.instagramSvg,
                    width: 32.w,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
