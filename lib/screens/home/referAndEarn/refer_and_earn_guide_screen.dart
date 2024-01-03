import 'package:dotted_line/dotted_line.dart';
import 'package:finjoy_app/api/appLabel/app_label_service.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/behaviour.dart';

class ReferAndEarnGuideScreen extends StatefulWidget {
  const ReferAndEarnGuideScreen({super.key});

  @override
  State<ReferAndEarnGuideScreen> createState() =>
      _ReferAndEarnGuideScreenState();
}

class _ReferAndEarnGuideScreenState extends State<ReferAndEarnGuideScreen> {
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
      child: Column(
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
          Expanded(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColor.tabgraycolor,
            child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  child: Column(
                    children: [
                      processContainer(),
                      sizeBoxHeight(25),
                      referralSale(),
                    ],
                  ),
                ))),
          )),
        ],
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
        AppText(
          text: getLabel(how_refer_and_earn_works),
          fontsize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.blacktextcolor,
        ),
      ],
    );
  }

  Widget processContainer() {
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
        child: Stack(
          // Wrap the contents with a Stack
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
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
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        sizeBoxWidth(15),
                        AppText(
                          text: getLabel(process),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontsize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackcolor,
                        ),
                      ],
                    ),
                  ),
                  steps('${AppImages.referAndEarnImages}step1.png',
                      getLabel(refer_finjoy_app_through_link)),
                  steps('${AppImages.referAndEarnImages}step2.png',
                      getLabel(your_friend_download_the_app)),
                  steps('${AppImages.referAndEarnImages}step3.png',
                      getLabel(he_she_starts_selling_on_finjoy)),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  sizeBoxWidth(15),
                  Image.asset(
                    '${AppImages.referAndEarnImages}gift1.png',
                    fit: BoxFit.fitHeight,
                    height: 90,
                    width: 110,
                  ),
                  Image.asset(
                    '${AppImages.referAndEarnImages}gift1.png',
                    fit: BoxFit.fitHeight,
                    height: 70,
                    width: 85,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget referralSale() {
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
        child: Stack(
          // Wrap the contents with a Stack
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
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
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        sizeBoxWidth(15),
                        AppText(
                          text: getLabel(referrals_sales),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontsize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackcolor,
                        ),
                      ],
                    ),
                  ),
                  sizeBoxHeight(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColor.bluecolor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.graybordercolor,
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer,
                            offset: Offset(1, 1), // Shadow position
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 20),
                                  child: AppText(
                                    text: getLabel(finjoy_registration),
                                    fontsize: 18.sp,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.whitecolor,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 25,
                                    decoration: const BoxDecoration(
                                        color: AppColor.perrotColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          bottomLeft: Radius.circular(25),
                                        )),
                                    child: Center(
                                      child: AppText(
                                        text: '2000 finCoins',
                                        fontsize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.orangecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            sizeBoxHeight(20),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: AppColor.whitecolor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.graybordercolor,
                                      blurRadius: 4,
                                      blurStyle: BlurStyle.outer,
                                      offset: Offset(1, 1), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: AppText(
                                    text: getLabel(claim_reward),
                                    fontsize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.bluecolor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  sizeBoxHeight(10),
                  referralSaleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget referralSaleList() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 12,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return referralSaleListItem(index);
        });
  }

  Widget referralSaleListItem(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.whitecolor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: AppColor.graybordercolor,
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 20),
                    child: AppText(
                      text: '${index + 1}’st Sale',
                      fontsize: 18.sp,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackcolor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 25,
                      decoration: const BoxDecoration(
                          color: AppColor.perrotColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          )),
                      child: Center(
                        child: AppText(
                          text: '2000 finCoins',
                          fontsize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.orangecolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              sizeBoxHeight(10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: AppText(
                    text: '5% from referral earning',
                    fontsize: 15.sp,
                    color: AppColor.bluecolor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget steps(String imagePath, String title) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 200.w,
          height: 90.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            transform: Matrix4.translationValues(0.0, -20.0, 0.0),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColor.whitecolor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: AppColor.graybordercolor,
                  blurRadius: 4,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(1, 1), // Shadow position
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    text: title,
                    fontsize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackcolor,
                  ),
                  sizeBoxHeight(10),
                  AppText(
                    text:
                        'Share referal link > your friend will download the app through the link > Enter your referal Id',
                    fontsize: 10.sp,
                    color: AppColor.blackcolor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget dottedDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DottedLine(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        lineLength: double.infinity,
        lineThickness: 1.5,
        dashLength: 2.5,
        dashColor: Colors.grey.shade300,
        dashRadius: 0.0,
        dashGapLength: 2.5,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
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
