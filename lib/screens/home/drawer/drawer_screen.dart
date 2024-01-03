// ignore_for_file: library_private_types_in_public_api

import 'package:dotted_line/dotted_line.dart';
import 'package:finjoy_app/api/my%20profile/bloc/get_my_profile_menu_bloc.dart';
import 'package:finjoy_app/api/my%20profile/model/get_my_profile_menu_model.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/drawer/change_mpin.dart';
import 'package:finjoy_app/screens/home/finjoy%20briefcase/analytics_screen.dart';
import 'package:finjoy_app/screens/home/finjoy%20briefcase/visiting_card_screen.dart';
import 'package:finjoy_app/screens/home/referAndEarn/refer_and_earn_screen.dart';
import 'package:finjoy_app/screens/home/website/website_screen.dart';
import 'package:finjoy_app/widgets/custom_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../api/appLabel/app_label_service.dart';
import '../../../utils/shared_pref.dart';
import '../../../widgets/custom_appbar.dart';
import '../../auth/login_screen.dart';
import '../../profile/my_profile_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  void initState() {
    getMyProfileMenuBloc.getMyProfileMenuSink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<GetMyProfileMenuModel>(
        stream: getMyProfileMenuBloc.getMyProfileMenuStream,
        builder: (context,
            AsyncSnapshot<GetMyProfileMenuModel> getMyProfileMenusnapshot) {
          if (!getMyProfileMenusnapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.bluecolor,
              ),
            );
          }
          return Column(
            children: [
              profileBG(),
              sizeBoxHeight(vDefaultPadding),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: vDefaultSize.w, right: vDefaultSize.w),
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: getMyProfileMenusnapshot.data?.data?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            myBusiness(getMyProfileMenusnapshot, index),
                            sizeBoxHeight(vDefaultPadding),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget profileBG() {
    return Stack(
      children: [
        Image.asset('${AppImages.drawerimages}bg.png'),
        Column(
          children: [
            backArrow(),
            sizeBoxHeight(35.h),
            profileDetail(),
          ],
        )
      ],
    );
  }

  Widget backArrow() {
    return Padding(
      padding: EdgeInsets.only(left: 17.w, top: 52.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.5.r),
                  color: AppColor.bluecolor),
              child: Center(
                  child: Image.asset('${AppImages.sellearnimages}back.png',
                      height: 14.h)),
            ),
            sizeBoxWidth(12.w),
            AppText(
              text: getLabel(home),
              fontsize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.blacktextcolor,
            ),
          ],
        ),
      ),
    );
  }

  Widget profileDetail() {
    return Padding(
      padding: EdgeInsets.only(left: 23.w),
      child: Row(
        children: [
          profileImage(context, 60.h, AppColor.bluecolor, false),
          // Container(
          //   height: 60.h,
          //   width: 60.w,
          //   decoration: BoxDecoration(
          //     border: Border.all(color: AppColor.bluecolor, width: 2.w),
          //     borderRadius: BorderRadius.circular(80.r),
          //   ),
          //   child: Center(
          //     child: ClipRRect(
          //         borderRadius: BorderRadius.circular(100),
          //         child: PrefObj.preferences!.get(PrefKeys.ProfileImage).toString().startsWith('assets') ? Image.asset(PrefObj.preferences!.get(PrefKeys.ProfileImage).toString(), width: 60.h, height: 60.h,fit: BoxFit.cover,)
          //             : Image.network(PrefObj.preferences!.get(PrefKeys.ProfileImage).toString(), width: 60.h, height: 60.h,fit: BoxFit.cover,)
          //     ),
          //   ),
          // ),
          sizeBoxWidth(15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: PrefObj.preferences!.get(PrefKeys.FullName).toString(),
                fontsize: 21.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.bluecolor,
              ),
              AppText(
                text: PrefObj.preferences!.get(PrefKeys.FinID).toString(),
                fontsize: 16.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xffED6028),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget myBusiness(
    AsyncSnapshot<GetMyProfileMenuModel> getMyProfileMenusnapshot,
    int index,
  ) {
    var categoryData = getMyProfileMenusnapshot.data?.data?[index];
    bool isLastIndex = index == getMyProfileMenusnapshot.data!.data!.length - 1;

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.whitecolor,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                spreadRadius: 3.r,
                blurRadius: 3.r,
                color: Colors.grey.shade100,
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 0.h),
                child: Column(
                  children: [
                    categoryData!.showcategoryname == true
                        ? Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 13.h),
                                child: Container(
                                  height: 20.h,
                                  width: 6.w,
                                  decoration: BoxDecoration(
                                    color: AppColor.bluecolor,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                              ),
                              sizeBoxWidth(20.w),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: AppText(
                                  text:
                                      categoryData.showcategorynametoshow ?? '',
                                  fontsize: 14.7.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.blackcolor,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                    sizeBoxHeight(27.h),
                    SizedBox(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: categoryData.menus?.length,
                        itemBuilder: (context, innerIndex) {
                          var innerData = categoryData.menus?[innerIndex];
                          bool isLastItem =
                              innerIndex == categoryData.menus!.length - 1;

                          return Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (innerData?.cta == "logout") {
                                      showLogoutDailog();
                                    } else if (innerData?.cta == "changempin") {
                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                        builder: (context) {
                                          return const ChangeMenuMPinScreen(
                                            currentMpin: '',
                                          );
                                        },
                                      ));
                                    } else if (innerData?.cta == "myprofile") {
                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                        builder: (context) {
                                          return const MyProfileScreen(
                                            navigate:
                                                BackNavigatorType.onnavigate,
                                          );
                                        },
                                      ));
                                    } else if (innerData?.cta ==
                                        "myvisitingcard") {
                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                        builder: (context) {
                                          return const VisitingCardScreen(
                                              visitingcardName:
                                                  'Visiting Card');
                                        },
                                      ));
                                    } else if (innerData?.cta == "mystore") {
                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                        builder: (context) {
                                          return const WebSiteScreen();
                                        },
                                      ));
                                    } else if (innerData?.cta ==
                                        "referandearn") {
                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                        builder: (context) {
                                          return const ReferAndEarnScreen();
                                        },
                                      ));
                                    } else if (innerData?.cta == "analytics") {
                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                        builder: (context) {
                                          return const AnalyticsScreen();
                                        },
                                      ));
                                    } else if (innerData?.menutitle ==
                                        "Rate Us") {
                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                        builder: (context) {
                                          return const MyWebView(
                                              url:
                                                  'https://play.google.com/store/apps/details?id=com.spreadit.finjoy');
                                        },
                                      ));
                                    } else {}
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 39.h,
                                              width: 39.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(39.r),
                                              ),
                                              child: getIcons(
                                                          innerData?.iconurl)
                                                      .endsWith(".json")
                                                  ? Lottie.network(
                                                      getIcons(
                                                          innerData?.iconurl),
                                                    )
                                                  : CustomImageView(
                                                      imagePath: getIcons(
                                                          innerData?.iconurl),
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          ],
                                        ),
                                        sizeBoxWidth(15.w),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              text: innerData?.menutitle ?? '',
                                              fontsize: 14.5.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.darktextcolor,
                                            ),
                                            AppText(
                                              text:
                                                  innerData?.menudescription ??
                                                      '',
                                              fontsize: 10.62.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.graytext1color,
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.darkarrowcolor,
                                          size: 15.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                sizeBoxHeight(14.h),
                                if (!isLastItem)
                                  Column(
                                    children: [
                                      dottedDividerr(),
                                      sizeBoxHeight(14.h),
                                    ],
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (isLastIndex)
          Column(
            children: [
              sizeBoxHeight(vDefaultPadding),
              appLogo(context),
            ],
          ),
      ],
    );
  }

  String getIcons(url) {
    if (url.startsWith("http")) {
      return url;
    } else {
      return '${AppImages.staticIcons}$url';
    }
  }

  void showLogoutDailog() {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Theme(
              data: ThemeData.light(),
              child: CupertinoAlertDialog(
                title: AppText(
                  text: getLabel(are_you_sure_you_want_to_logout),
                  fontWeight: FontWeight.w600,
                  fontsize: 16.sp,
                  color: AppColor.blackcolor,
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      PrefObj.preferences?.put(PrefKeys.isLogout, true);
                      PrefObj.preferences!.put(PrefKeys.DEVICETOKEN, '');
                      PrefObj.preferences!.put(PrefKeys.FullName, '');
                      PrefObj.preferences!.put(PrefKeys.ProfileImage, '');
                      PrefObj.preferences!.put(PrefKeys.MobileNumber, '');
                      PrefObj.preferences!.put(PrefKeys.FinID,
                          '${AppImages.profileimages}profile.png');
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (Route<dynamic> route) => false);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: AppColor.bluecolor,
                        content: AppText(
                          text: getLabel(logoutsuccessfully),
                          fontWeight: FontWeight.w600,
                          fontsize: 16.sp,
                          color: AppColor.whitecolor,
                        ),
                      ));
                    },
                    isDefaultAction: true,
                    isDestructiveAction: true,
                    child: AppText(
                      text: getLabel(yes),
                      fontWeight: FontWeight.w600,
                      fontsize: 18.sp,
                      color: Colors.red,
                    ),
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    isDefaultAction: false,
                    isDestructiveAction: false,
                    child: AppText(
                      text: getLabel(no),
                      fontWeight: FontWeight.w600,
                      fontsize: 18.sp,
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ));
        });
  }
}

Widget appLogo(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('${AppImages.selectlanguageimages}finjoy logo.png', height: 52.h),
      sizeBoxHeight(vDefaultPadding.h),
      SizedBox(
        width: MediaQuery.of(context).size.width / 1.3.w,
        child: AppText(
          text:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever ',
          fontsize: 7.62.sp,
          textCenter: true,
          fontWeight: FontWeight.w400,
          color: AppColor.graytext1color,
        ),
      ),
    ],
  );
}

Widget dottedDividerr() {
  return Padding(
    padding: EdgeInsets.only(left: 52.w),
    child: DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: Colors.grey.shade300,
      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 0.0,
    ),
  );
}

// class MyWebView extends StatefulWidget {
//   final String url;

//   const MyWebView({super.key, required this.url});

//   @override
//   _MyWebViewState createState() => _MyWebViewState();
// }

// class _MyWebViewState extends State<MyWebView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: vDefaultPadding),
//           child: WebView(
//             initialUrl: widget.url,
//             javascriptMode: JavascriptMode.disabled,
//           ),
//         ),
//       ),
//     );
//   }
// }
class MyWebView extends StatefulWidget {
  final String url;

  const MyWebView({Key? key, required this.url}) : super(key: key);

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.disabled,
              onPageStarted: (String url) {
                setState(() {
                  isLoading = true;
                });
              },
              onPageFinished: (String url) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColor.bluecolor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
