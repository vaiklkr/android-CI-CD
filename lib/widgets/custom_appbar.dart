import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/drawer/drawer_screen.dart';
import 'package:finjoy_app/screens/home/notification/notification_screen.dart';
import 'package:finjoy_app/screens/home/story%20screen/finjoy_story_screen.dart';
import 'package:finjoy_app/screens/profile/my_profile_screen.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class CustomAppBar extends StatelessWidget {
  final Size preferredSize;
  final double? elevation;
  final String? title;
  final String? subtitle;
  final VoidCallback? onPressed;
  final List<Widget>? actions;
  final BackNavigatorType navigate;
  final Widget? leading;
  final bool? centerTitle = false;

  const CustomAppBar({
    this.title,
    this.subtitle,
    this.onPressed,
    this.actions,
    this.elevation = 1,
    this.leading,
    Key? key,
    this.navigate = BackNavigatorType.onnavigate,
  })  : preferredSize = const Size.fromHeight(65.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: vDefaultPadding),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (navigate == BackNavigatorType.myprofile) {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const BottomBarPage();
                  },
                ));
              } else {
                Navigator.pop(context);
              }
            },
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                  color: AppColor.whitecolor,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xffE8ECF4))),
              child: Center(
                child: Image.asset(
                  '${AppImages.signupimages}back.png',
                  height: 14.h,
                ),
              ),
            ),
          ),
          sizeBoxWidth(16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                  text: title ?? '',
                  color: AppColor.blackcolor,
                  fontsize: 20.sp,
                  fontWeight: FontWeight.w500),
              // sizeBoxHeight(5.h),
              AppText(
                  text: subtitle ?? '',
                  color: AppColor.graytextcolor,
                  fontsize: 15.sp,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeCustomAppbar extends StatefulWidget {
  const HomeCustomAppbar({super.key});

  @override
  State<HomeCustomAppbar> createState() => _HomeCustomAppbarState();
}

class _HomeCustomAppbarState extends State<HomeCustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return bgImage();
  }

  Widget bgImage() {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            '${AppImages.homeimages}homebg.png',
          ),
          Padding(
              padding: EdgeInsets.only(top: vDefaultPadding * 3.h),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: vDefaultPadding, right: vDefaultPadding),
                    child: Row(
                      children: [
                        profileImage(context, appBarProfileImageSize,
                            AppColor.whitecolor, true),
                        sizeBoxWidth(vDefaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            statusWidget(),
                            AppText(
                              text: PrefObj.preferences!
                                  .get(PrefKeys.FullName)
                                  .toString(),
                              fontWeight: FontWeight.bold,
                              color: AppColor.whitecolor,
                              fontsize: 18.sp,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const FinjoyStoryScreen();
                                }));
                              },
                              child: Image.asset(
                                '${AppImages.homeimages}finjoy.png',
                                height: appBarOtherImageSize,
                              ),
                            ),
                            sizeBoxWidth(vDefaultPadding),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const NotificationScreen();
                                }));
                              },
                              child: Image.asset(
                                '${AppImages.homeimages}noti.png',
                                height: appBarOtherImageSize,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      )
    ]);
  }
}

double appBarProfileImageSize = 50.h;
double appBarOtherImageSize = 42.h;

Widget profileImage(BuildContext context, double imageSize, Color borderColor, bool isClickable) {
  return GestureDetector(
    onTap: () {
      if(isClickable) {
        Navigator.of(context).push(PageTransition(
            type: PageTransitionType.leftToRight,
            child: const DrawerScreen(),
            duration: const Duration(milliseconds: 100)));
      }
      // Navigator.push(context, CupertinoPageRoute(builder: (context) {
      //   return DrawerScreen();
      // }));
    },
    child: Container(
      height: imageSize,
      width: imageSize,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2.w),
        // border: Border.all(color: AppColor.whitecolor, width: 2.w),
        borderRadius: BorderRadius.circular(80.r),
      ),
      child: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: PrefObj.preferences!
                    .get(PrefKeys.ProfileImage)
                    .toString() == ''
                    // .startsWith('assets')
                ? SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(children: [
                      Image.asset(
                        '${AppImages.drawerimages}profile_text_bg.webp',
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                      ),
                      Center(
                        child: AppText(
                          text: getTwoCharacters(PrefObj.preferences!
                              .get(PrefKeys.FullName)
                              .toString()),
                            color: AppColor.whitecolor,
                          fontsize: imageSize >= appBarProfileImageSize && imageSize < 80.h ? 20 : 50,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
                  )
                /*Image.asset(
                    PrefObj.preferences!.get(PrefKeys.ProfileImage).toString(),
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  )*/
                : Image.network(
                    PrefObj.preferences!.get(PrefKeys.ProfileImage).toString(),
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  )),
      ),
    ),
  );
}

String getTwoCharacters(String input) {
  if (input.isNotEmpty) {
    String extractedCharacters =
        input.substring(0, input.length <= 2 ? input.length : 2).toUpperCase();
    return extractedCharacters;
  } else {
    // Handle the case where the input is empty
    // You might want to return an empty string or handle it based on your needs.
    return '';
  }
}

Widget statusWidget() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      AppText(
          text: getStatusFromTime(),
          fontWeight: FontWeight.w400,
          color: AppColor.whitecolor,
          fontsize: 12.sp),
      sizeBoxWidth(3),
      Image.asset(
        getStatusImage(),
        height: 15.h,
        width: 15.h,
      )
    ],
  );
}

String getStatusFromTime() {
  DateTime now = DateTime.now();
  int currentHour = now.hour;

  if (currentHour >= 5 && currentHour < 12) {
    return 'Good Morning';
  } else if (currentHour >= 12 && currentHour < 17) {
    return 'Good Afternoon';
  } else if (currentHour >= 17 && currentHour < 24) {
    return 'Good Evening';
  } else {
    return '';
  }
}

String getStatusImage() {
  DateTime now = DateTime.now();
  int currentHour = now.hour;

  if (currentHour >= 5 && currentHour < 12) {
    return '${AppImages.homeimages}status_morning.png';
  } else if (currentHour >= 12 && currentHour < 17) {
    return '${AppImages.homeimages}status_afternoon.png';
  } else if (currentHour >= 17 && currentHour < 24) {
    return '${AppImages.homeimages}status_evening.png';
  } else {
    return '';
  }
}
