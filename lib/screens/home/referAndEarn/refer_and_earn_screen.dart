

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finjoy_app/screens/home/referAndEarn/refer_and_earn_guide_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../core/app_color.dart';
import '../../../core/app_image.dart';
import '../../../core/app_sized_box.dart';
import '../../../core/app_text.dart';
import '../../../widgets/custom_appbar.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({super.key});

  @override
  State<ReferAndEarnScreen> createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  final CarouselController _controller = CarouselController();
  late int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [const HomeCustomAppbar(), mainContainer()]));
  }

  Widget mainContainer() {
    return Container(
      margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
      decoration: BoxDecoration(
          color: AppColor.whitecolor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
          )),
      child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 55),
              color: AppColor.tabgraycolor,
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header(),
                      sizeBoxHeight(15.h),
                    ],
                  ),
                ),
                sizeBoxHeight(10),
                slider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      referralId(),
                      sizeBoxHeight(25),
                      otherContent(),
                    ],
                  ),
                ),
                // Expanded(
                //     child: Container(
                //       width: double.infinity,
                //       height: double.infinity,
                //       color: AppColor.tabgraycolor,
                //       child: Padding(
                //         padding: EdgeInsets.symmetric(vertical: 20.h),
                //         child: Column(
                //           children: [
                //             slider(),
                //             Padding(
                //               padding: const EdgeInsets.symmetric(horizontal: 20),
                //               child: Column(
                //                 children: [
                //                   referralId(),
                //                   sizeBoxHeight(25),
                //                   otherContent(),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     )),
              ],
            ),
          ]
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.5.r),
                color: AppColor.bluecolor),
            child: Center(
                child: Image.asset('${AppImages.sellearnimages}back.png',
                    height: 14.h)),
          ),
        ),
        sizeBoxWidth(12.w),
        Expanded(
          child: AppText(
            text: getLabel(refer_and_earn),
            fontsize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.blacktextcolor,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ReferAndEarnGuideScreen();
              },
            ));
          },
          child: Image.asset(
            '${AppImages.referAndEarnImages}question.png',
            height: 30.h,
            width: 30.w,
          ),
        ),
      ],
    );
  }

  Widget slider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          items: [
            Image.asset(
              '${AppImages.referAndEarnImages}slider_image1.png',
              width: 320.w,
              fit: BoxFit.fill,
            ),
            Image.asset(
              '${AppImages.referAndEarnImages}slider_image2.png',
              width: 320.w,
              // width: MediaQuery.of(context).size.width / 1.1.w,
              fit: BoxFit.fill,
            ),
            Image.asset(
              '${AppImages.referAndEarnImages}slider_image1.png',
              width: 320.w,
              // width: MediaQuery.of(context).size.width / 1.1.w,
              fit: BoxFit.fill,
            ),
          ],
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            },
            enlargeCenterPage: true,
            autoPlay: true,
            height: 180.h,
            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8.w,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [1, 2, 3].asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                    width: 6.0,
                    height: 6.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 3.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: current == entry.key
                            ? AppColor.curcolor
                            : AppColor.graytextcolor)),
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget referralId() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
            offset: Offset(1, 1), // Shadow position
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Container(
                    width: 5,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: AppColor.bluecolor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                  sizeBoxWidth(15),
                  AppText(
                    text: getLabel(my_referral_id),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontsize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackcolor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColor.whitecolor,
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.grayDashcolor,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppText(
                          text: '3498370927971finjoy-pratap',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontsize: 15.sp,
                          color: AppColor.blackcolor,
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          color: AppColor.lightBlue,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              '${AppImages.websiteImages}copy.png',
                              width: 18.w,
                              height: 18.h,
                            ),
                            sizeBoxWidth(8.w),
                            AppText(
                              text: getLabel(copy),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontsize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.whitecolor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  commonButton(
                      onTap: () {},
                      text: getLabel(share),
                      iconPath: '${AppImages.websiteImages}share.png'),
                  commonButton(
                      onTap: () {},
                      text: getLabel(visit),
                      iconPath:
                      '${AppImages.referAndEarnImages}whatsapp_icon.png',
                      borderColor: AppColor.greenncolor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget otherContent() {
    return Row(
      children: [
        otherContentCommonContainer(getLabel(earnings), 'Rs 298.02',
            '${AppImages.referAndEarnImages}total_earning.png'),
        sizeBoxWidth(15),
        otherContentCommonContainer(getLabel(people_joined), '5',
            '${AppImages.referAndEarnImages}people_joined.png'),
      ],
    );
  }

  Widget otherContentCommonContainer(
      String title, String value, String imagePath) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              blurStyle: BlurStyle.outer,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 50.w,
                  height: 50.h,
                ),
                sizeBoxWidth(5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontsize: 14.sp,
                        color: AppColor.graycolor,
                      ),
                      AppText(
                        text: value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontsize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.darkarrowcolor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commonButton({
    required VoidCallback onTap,
    String text = '',
    String iconPath = '',
    Color borderColor = AppColor.bluecolor,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            height: 47.h,
            decoration: BoxDecoration(
                color: AppColor.whitecolor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: borderColor, width: 1)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconPath,
                    width: 25.w,
                    height: 25.h,
                  ),
                  sizeBoxWidth(8.w),
                  AppText(
                    text: text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontsize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: borderColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
