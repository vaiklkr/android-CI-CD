import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/locale/language.dart';
import 'package:finjoy_app/core/locale/locale_constant.dart';
import 'package:finjoy_app/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/appLabel/app_label_service.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {

  int? _value = 1;
  String? languageName = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whitecolor,
        body: Padding(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 70, bottom: 40),
          child: Column(
            children: [
              appLogo(),
              sizeBoxHeight(20),
              mainImage(),
              sizeBoxHeight(30),
              Expanded(child: selectLanguageBg()),
              // sizeBoxHeight(40.h),
              // selectLanguage(),
              sizeBoxHeight(30),
              continueButton(),
            ],
          ),
        ));
  }

  Widget appLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('${AppImages.selectlanguageimages}logo.png', height: 50.h),
      ],
    );
  }

  Widget mainImage() {
    return Image.asset(
      '${AppImages.selectlanguageimages}language.png',
      height: 250,
    );
  }

  Widget selectLanguage() {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    changeLanguage(context, "en");
                    _value = 1;
                    languageName = 'English';
                  });
                },
                child: Container(
                  height: 93.h,
                  decoration: BoxDecoration(
                      border: _value == 1
                          ? Border.all(color: AppColor.greencolor)
                          : null,
                      color: _value == 1
                          ? AppColor.backgreencolor
                          : AppColor.whitecolor,
                      // color: AppColor.whitecolor,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            color: Colors.grey.shade100),
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 11.h, right: 15.w, left: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              // text: Languages.of(context)!.english,
                              text: 'English',
                              fontWeight: FontWeight.w600,
                              fontsize: 17.sp,
                              color: AppColor.blackkcolor,
                            ),
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: Radio(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                fillColor: const MaterialStatePropertyAll(
                                    AppColor.greencolor),
                                value: 1,
                                groupValue: _value,
                                onChanged: (value) {},
                              ),
                            )
                          ],
                        ),
                        sizeBoxHeight(6.h),
                        AppText(
                          text: 'English',
                          fontWeight: FontWeight.w400,
                          fontsize: 13.sp,
                          color: AppColor.blackkcolor,
                        ),
                        // Text(
                        //   Languages.of(context)!.english,
                        //   style: GoogleFonts.roboto(
                        //       color: AppColor.blackcolor,
                        //       fontSize: 12.sp,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            sizeBoxWidth(vDefaultPadding * 1.5.w),
            Flexible(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    changeLanguage(context, "hi");
                    _value = 2;
                    languageName = 'Hindi';
                  });
                },
                child: Container(
                  height: 93.h,
                  decoration: BoxDecoration(
                      border: _value == 2
                          ? Border.all(color: AppColor.greencolor)
                          : null,
                      color: _value == 2
                          ? AppColor.backgreencolor
                          : AppColor.whitecolor,
                      // color: AppColor.whitecolor,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            color: Colors.grey.shade100),
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 11.h, right: 15.w, left: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              // text: Languages.of(context)!.hindi,
                              text: 'Hindi',
                              fontWeight: FontWeight.w600,
                              fontsize: 17.sp,
                              color: AppColor.blackkcolor,
                            ),
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: Radio(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                fillColor: const MaterialStatePropertyAll(
                                    AppColor.greencolor),
                                value: 2,
                                groupValue: _value,
                                onChanged: (value) {},
                              ),
                            )
                          ],
                        ),
                        sizeBoxHeight(6.h),
                        AppText(
                          text: 'हिंदी',
                          fontWeight: FontWeight.w400,
                          fontsize: 13.sp,
                          color: AppColor.blackkcolor,
                        ),
                        // Text(
                        //   Languages.of(context)!.hindi,
                        //   style: GoogleFonts.roboto(
                        //       color: AppColor.blackcolor,
                        //       fontSize: 12.sp,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        sizeBoxHeight(vDefaultPadding * 1.5.h),
        Row(
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    changeLanguage(context, "mr");
                    _value = 3;
                    languageName = 'Marathi';
                  });
                },
                child: Container(
                  height: 93.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: _value == 3
                          ? Border.all(color: AppColor.greencolor)
                          : null,
                      color: _value == 3
                          ? AppColor.backgreencolor
                          : AppColor.whitecolor,
                      // color: AppColor.whitecolor,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            color: Colors.grey.shade100),
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 11.h, right: 15.w, left: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              // text: Languages.of(context)!.marathi,
                              text: 'Marathi',
                              fontWeight: FontWeight.w600,
                              fontsize: 17.sp,
                              color: AppColor.blackkcolor,
                            ),
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: Radio(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                fillColor: const MaterialStatePropertyAll(
                                    AppColor.greencolor),
                                value: 3,
                                groupValue: _value,
                                onChanged: (value) {},
                              ),
                            )
                          ],
                        ),
                        sizeBoxHeight(6.h),
                        AppText(
                          text: 'मराठी',
                          fontWeight: FontWeight.w400,
                          fontsize: 13.sp,
                          color: AppColor.blackkcolor,
                        ),
                        // Text(
                        //   // Languages.of(context)!.marathi,
                        //   text: 'मराठी',
                        //   style: GoogleFonts.roboto(
                        //       color: AppColor.blackcolor,
                        //       fontSize: 12.sp,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            sizeBoxWidth(vDefaultPadding * 1.5.w),
            Flexible(
              child: GestureDetector(
                onTap: () {
                  // setState(() {
                  //   changeLanguage(context, "ta");
                  //   _value = 4;
                  // });
                },
                child: Container(
                  height: 93.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      // border: _value == 4
                      //     ? Border.all(color: AppColor.greencolor)
                      //     : null,
                      // color: _value == 4
                      //     ? AppColor.backgreencolor
                      //     : AppColor.whitecolor,
                      color: AppColor.whitecolor,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            color: Colors.grey.shade100),
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 11.h, right: 15.w, left: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              // text: Languages.of(context)!.tamil,
                              text: 'Other Languages',
                              fontWeight: FontWeight.w600,
                              fontsize: 17.sp,
                              color: AppColor.blackkcolor,
                            ),
                            // SizedBox(
                            //   height: 20.h,
                            //   width: 20.w,
                            //   child: Radio(
                            //     materialTapTargetSize:
                            //         MaterialTapTargetSize.shrinkWrap,
                            //     fillColor: const MaterialStatePropertyAll(
                            //         AppColor.greencolor),
                            //     value: 4,
                            //     groupValue: _value,
                            //     onChanged: (value) {},
                            //   ),
                            // )
                          ],
                        ),
                        sizeBoxHeight(6.h),
                        AppText(
                          // text: Languages.of(context)!.tamil,
                          text: 'Coming Soon...',
                          color: AppColor.blackcolor,
                          fontsize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        // Text(
                        //   'Coming Soon...',
                        //   // Languages.of(context)!.tamil,
                        //   style: GoogleFonts.roboto(
                        //       color: AppColor.blackcolor,
                        //       fontSize: 13.sp,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget selectLanguageBg() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              // languageCommonBox('en', 'English', 'English', 1),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      changeLanguage(context, "en");
                      _value = 1;
                      languageName = 'English';
                    });
                  },
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: _value == 1
                          ? Colors.transparent
                          : AppColor.whitecolor,
                      border: _value == 1
                          ? Border.all(width: 1, color: Colors.green)
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: _value == 1
                          ? [
                              const BoxShadow(
                                // color: Colors.green.shade100,
                                color: AppColor.greenBoxBg,
                              ),
                              const BoxShadow(
                                color: Colors.white70,
                                spreadRadius: -5.0,
                                blurRadius: 20.0,
                              ),
                            ]
                          : [
                        const BoxShadow(
                          color: Colors.white,
                        ),
                              BoxShadow(
                                color: Colors.grey.shade100,
                                spreadRadius: 5.0,
                                blurRadius: 5.0,
                              ),
                            ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: 'English',
                                fontWeight: FontWeight.w500,
                                fontsize: 16.sp,
                                color: AppColor.blackkcolor,
                              ),
                              SizedBox(
                                height: 20.h,
                                width: 20.w,
                                child: Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  fillColor: const MaterialStatePropertyAll(
                                      AppColor.greencolor),
                                  value: 1,
                                  groupValue: _value,
                                  onChanged: (value) {},
                                ),
                              )
                            ],
                          ),
                          sizeBoxHeight(4.h),
                          AppText(
                            text: 'English',
                            fontWeight: FontWeight.w400,
                            fontsize: 13.sp,
                            color: AppColor.blackkcolor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              sizeBoxWidth(15),
              // languageCommonBox('hi', 'Hindi', 'हिंदी', 2),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      changeLanguage(context, "hi");
                      _value = 2;
                      languageName = 'Hindi';
                    });
                  },
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: _value == 2
                          ? Colors.transparent
                          : AppColor.whitecolor,
                      border: _value == 2
                          ? Border.all(width: 2, color: Colors.green)
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: _value == 2
                          ? [
                              const BoxShadow(
                                // color: Colors.green.shade100,
                                color: AppColor.greenBoxBg,
                              ),
                              const BoxShadow(
                                color: Colors.white70,
                                spreadRadius: -5.0,
                                blurRadius: 20.0,
                              ),
                            ]
                          : [
                        const BoxShadow(
                          color: Colors.white,
                        ),
                              BoxShadow(
                                color: Colors.grey.shade100,
                                spreadRadius: 5.0,
                                blurRadius: 5.0,
                              ),
                            ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: 'Hindi',
                                fontWeight: FontWeight.w500,
                                fontsize: 16.sp,
                                color: AppColor.blackkcolor,
                              ),
                              SizedBox(
                                height: 20.h,
                                width: 20.w,
                                child: Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  fillColor: const MaterialStatePropertyAll(
                                      AppColor.greencolor),
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (value) {},
                                ),
                              )
                            ],
                          ),
                          sizeBoxHeight(4.h),
                          AppText(
                            text: 'हिंदी',
                            fontWeight: FontWeight.w400,
                            fontsize: 13.sp,
                            color: AppColor.blackkcolor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          sizeBoxHeight(15),
          Row(
            children: [
              // languageCommonBox('mr', 'Marathi', 'मराठी', 3),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      changeLanguage(context, "mr");
                      _value = 3;
                      languageName = 'Marathi';
                    });
                  },
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: _value == 3
                          ? Colors.transparent
                          : AppColor.whitecolor,
                      border: _value == 3
                          ? Border.all(width: 1, color: Colors.green)
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: _value == 3
                          ? [
                              const BoxShadow(
                                // color: Colors.green.shade100,
                                color: AppColor.greenBoxBg,
                              ),
                              const BoxShadow(
                                color: Colors.white70,
                                spreadRadius: -5.0,
                                blurRadius: 20.0,
                              ),
                            ]
                          : [
                              const BoxShadow(
                                color: Colors.white,
                              ),
                              BoxShadow(
                                color: Colors.grey.shade100,
                                spreadRadius: 5.0,
                                blurRadius: 5.0,
                              ),
                            ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: 'Marathi',
                                fontWeight: FontWeight.w500,
                                fontsize: 16.sp,
                                color: AppColor.blackkcolor,
                              ),
                              SizedBox(
                                height: 20.h,
                                width: 20.w,
                                child: Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  fillColor: const MaterialStatePropertyAll(
                                      AppColor.greencolor),
                                  value: 3,
                                  groupValue: _value,
                                  onChanged: (value) {},
                                ),
                              )
                            ],
                          ),
                          sizeBoxHeight(4.h),
                          AppText(
                            text: 'मराठी',
                            fontWeight: FontWeight.w400,
                            fontsize: 13.sp,
                            color: AppColor.blackkcolor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              sizeBoxWidth(15),
              Expanded(
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColor.whitecolor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.white,
                      ),
                      BoxShadow(
                        color: Colors.grey.shade100,
                        spreadRadius: 5.0,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AppText(
                            text: 'Other Languages Coming Soon...',
                            fontWeight: FontWeight.w400,
                            fontsize: 15.sp,
                            color: AppColor.blackkcolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget continueButton() {
    return GestureDetector(
      onTap: () async {
        await AppLabels.fetchData(languageName ?? 'English');
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) {
            return const OnboardingScreen();
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 58.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(41.r),
            color: AppColor.bluecolor,
          ),
          child: Center(
            child: AppText(
              text: Languages.of(context)!.continute,
              fontWeight: FontWeight.w400,
              fontsize: 18.sp,
              color: AppColor.whitecolor,
            ),
          ),
        ),
      ),
    );
  }
}
