//-------------------------------------DRAWER------------------------------------------//
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/profile/my_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Map drawerList = {
  'data': [
    {
      'image': '${AppImages.drawerimages}profile.png',
      'name': 'My Profile',
    },
    {
      'image': '${AppImages.drawerimages}scan.png',
      'name': 'My Website/My Store and QR',
    },
    {
      'image': '${AppImages.drawerimages}case.png',
      'name': 'My Briefcase',
    },
    {
      'image': '${AppImages.drawerimages}limit.png',
      'name': 'Free Credit Score',
    },
    {
      'image': '${AppImages.drawerimages}refer.png',
      'name': 'Refer And Earn',
    },
    {
      'image': '${AppImages.drawerimages}privacy.png',
      'name': 'Terms & Conditions',
    },
    {
      'image': '${AppImages.drawerimages}term.png',
      'name': 'Privacy Policy',
    },
    {
      'image': '${AppImages.drawerimages}langu.png',
      'name': 'Change Language',
    },
    {
      'image': '${AppImages.drawerimages}faqs.png',
      'name': 'FAQS',
    },
    {
      'image': '${AppImages.drawerimages}support.png',
      'name': 'Supports',
    },
    {
      'image': '${AppImages.drawerimages}logout.png',
      'name': 'Logout',
    },
  ]
};

Widget dawer() {
  return Drawer(
    child: ScrollConfiguration(
      behavior: MyBehavior(),
      child: Column(
        children: [
          SizedBox(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        '${AppImages.homeimages}homebg.png',
                        height: 150.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: vDefaultPadding, top: vDefaultPadding),
                        child: Row(
                          children: [
                            Container(
                              height: 80.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                      '${AppImages.homeimages}profile.png',
                                    ),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            sizeBoxWidth(15.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: 'Pratap Ranjan',
                                  color: AppColor.whitecolor,
                                  fontsize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                sizeBoxHeight(2.h),
                                AppText(
                                  text: '+91 9638527410',
                                  color: AppColor.whitecolor,
                                  fontsize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: vDefaultPadding),
                      //   child: Column(
                      //     children: [
                      //       Container(
                      //         height: 110.h,
                      //         width: 110.w,
                      //         decoration: BoxDecoration(
                      //           color: Colors.transparent,
                      //           shape: BoxShape.circle,
                      //           image: DecorationImage(
                      //               image: AssetImage(
                      //                 '${AppImages.homeimages}profile.png',
                      //               ),
                      //               fit: BoxFit.fill),
                      //         ),
                      //       ),
                      //       sizeBoxHeight(vDefaultSize),
                      //       AppText(
                      //         text: 'Pratap Ranjan',
                      //         color: AppColor.whitecolor,
                      //         fontsize: 18.sp,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //       sizeBoxHeight(2.h),
                      //       AppText(
                      //         text: '+91 9638527410',
                      //         color: AppColor.whitecolor,
                      //         fontsize: 15.sp,
                      //         fontWeight: FontWeight.w500,
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: drawerList['data'].length,
                itemBuilder: (context, index) => ListTile(
                  dense: true,
                  horizontalTitleGap: 20,
                  onTap: () {
                    if (index == 0) {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const MyProfileScreen(
                              navigate: BackNavigatorType.onnavigate);
                        },
                      ));
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  // onTap: (() {
                  //   setState(() {
                  //     Future.delayed(const Duration(milliseconds: 10), () {
                  //       Navigator.pop(context);
                  // if (index == 6) {
                  //   showLogoutDailog();
                  // } else {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) =>
                  //                     callpagelist[index])).then((value) {
                  //           imageData =
                  //               PrefObj.preferences!.get(PrefKeys.IMAGEURL);
                  //           data = json.decode(
                  //               PrefObj.preferences!.get(PrefKeys.USERDATA));
                  //           setState(() {});
                  //         });
                  //       }
                  //     });
                  //   });
                  // }),
                  leading: Image.asset(
                    drawerList['data'][index]['image'],

                    height: 20.h,
                    // width: 25.w,
                  ),
                  title: AppText(
                    text: drawerList['data'][index]['name'],
                    fontsize: 16.sp,
                    color: AppColor.blackcolor,
                    fontWeight: FontWeight.w500,
                  ),
                  minLeadingWidth: 15.w,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
