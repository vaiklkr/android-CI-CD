import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/training/courses_tab.dart';
import 'package:finjoy_app/screens/home/training/live_tab.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/appLabel/app_label_service.dart';

class TraningScreen extends StatefulWidget {
  const TraningScreen({super.key});

  @override
  State<TraningScreen> createState() => _TraningScreenState();
}

class _TraningScreenState extends State<TraningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [const HomeCustomAppbar(), trainingDetails()]));
  }

  Widget trainingDetails() {
    return DefaultTabController(
      length: 2,
      child: Container(
        margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
        decoration: BoxDecoration(
            color: AppColor.whitecolor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              topLeft: Radius.circular(30.r),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            trainingHeader(),
            sizeBoxHeight(12.h),
            tabBar(),
          ],
        ),
      ),
    );
  }

  Widget trainingHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 15.w, left: 15.w),
      child: Row(
        children: [
          AppText(
            text: getLabel(training),
            fontsize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.blacktextcolor,
          ),
        ],
      ),
    );
  }

  Widget tabBar() {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15.w, left: 15.w),
            child: Container(
              height: 58.h,
              decoration: BoxDecoration(
                  color: AppColor.tabgraycolor,
                  borderRadius: BorderRadius.circular(100.0)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: TabBar(
                  indicator: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 3.r,
                          blurRadius: 3.r,
                          color: Colors.grey.shade200)
                    ],
                    borderRadius: BorderRadius.circular(42.r),
                    color: AppColor.whitecolor,
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: AppColor.bluecolor,
                  labelStyle: GoogleFonts.poppins(
                      color: AppColor.bluecolor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                  unselectedLabelColor: AppColor.graycolor,
                  tabs: [
                    Tab(text: getLabel(courses)),
                    Tab(text: getLabel(live)),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                CoursesTab(),
                LiveTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
