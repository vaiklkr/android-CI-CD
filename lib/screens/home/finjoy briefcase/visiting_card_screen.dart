// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, deprecated_member_use

import 'dart:io';

import 'package:finjoy_app/api/dashboard/bloc/get_financial_dashboard_bloc.dart';
import 'package:finjoy_app/api/dashboard/model/get_financial_dashboard_model.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/finjoy%20briefcase/my_id_card_screen.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../api/visiting card/bloc/visiting_card_bloc.dart';
import '../../../api/visiting card/model/visiting_card_model.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_button.dart';
import '../referAndEarn/refer_and_earn_screen.dart';
import 'analytics_screen.dart';

class VisitingCardScreen extends StatefulWidget {
  const VisitingCardScreen({super.key, this.visitingcardName});

  final String? visitingcardName;
  @override
  State<VisitingCardScreen> createState() => _VisitingCardScreen();
}

class _VisitingCardScreen extends State<VisitingCardScreen> {
  bool isStartScreen = true;
  List<Menus> visitingCardData = [];
  late int current = 0;
  WidgetsToImageController controller = WidgetsToImageController();
  @override
  void initState() {
    getVisitingCardBloc.getVisitingCardSink();
    getFinancialDashboardBloc.getFinancialDashboardSink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bluecolor,
      body: StreamBuilder<VisitingCardModel>(
          stream: getVisitingCardBloc.getVisitingCardStream,
          builder: (
            context,
            AsyncSnapshot<VisitingCardModel> getVisitingCardSnapshot,
          ) {
            if (!getVisitingCardSnapshot.hasData) {
              return Container(
                color: AppColor.whitecolor,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.bluecolor,
                  ),
                ),
              );
            } else {
              VisitingCardModel idCard = getVisitingCardSnapshot.data!;
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      title: appBar(),
                      leadingWidth: 0.0,
                      actions: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: vDefaultPadding),
                          child: Row(
                            children: [
                              Image.asset(
                                '${AppImages.homeimages}finjoy.png',
                                height: appBarOtherImageSize,
                              ),
                              sizeBoxWidth(vDefaultPadding),
                              Image.asset(
                                '${AppImages.homeimages}noti.png',
                                height: appBarOtherImageSize,
                              ),
                            ],
                          ),
                        ),
                      ],
                      backgroundColor: AppColor.bluecolor,
                      leading: const SizedBox.shrink(),
                      expandedHeight: 360.h,
                      // expandedHeight: MediaQuery.of(context).size.height / 2.9.h,
                      elevation: 0.0,
                      floating: true,
                      pinned: true,
                      flexibleSpace:
                          FlexibleSpaceBar(background: bgImage(idCard)),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          ScrollConfiguration(
                              behavior: MyBehavior(),
                              child:
                                  SingleChildScrollView(child: homeDetails())),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  Widget bgImage(VisitingCardModel IDCard) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              '${AppImages.homeimages}homebg.png',
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(top: 95.h),
              child: Column(
                children: [
                  visitingCard(IDCard),
                  sizeBoxHeight(15.h),
                  shareButton(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget appBar() {
    return Row(
      children: [
        profileImage(context, appBarProfileImageSize, AppColor.whitecolor, true),
        sizeBoxWidth(vDefaultPadding),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            statusWidget(),
            AppText(
              text: PrefObj.preferences!.get(PrefKeys.FullName).toString(),
              fontWeight: FontWeight.bold,
              color: AppColor.whitecolor,
              fontsize: 18.sp,
            ),
          ],
        ),
      ],
    );
  }

  Widget visitingCard(VisitingCardModel idcArd) {
    return WidgetsToImage(
      controller: controller,
      child: SizedBox(
        height: 213.h,
        width: 394.w,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              '${AppImages.finjoybriefcaseimages}visitingcard.png',
              height: 213.h,
              width: 394.w,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 30.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: idcArd.data!.name.toString(),
                            fontsize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.blackcolor,
                          ),
                          AppText(
                            text: "Financial Experts",
                            fontsize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blackcolor,
                          ),
                        ],
                      ),
                      Image.asset(
                        '${AppImages.finjoybriefcaseimages}logo.png',
                        height: 37.h,
                      ),
                    ],
                  ),
                  sizeBoxHeight(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.mail_outline,
                                    size: 15.sp,
                                    color: AppColor.blackcolor,
                                  ),
                                  sizeBoxHeight(7.h),
                                  Icon(
                                    Icons.call_outlined,
                                    size: 15.sp,
                                    color: AppColor.blackcolor,
                                  ),
                                  sizeBoxHeight(7.h),
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 15.sp,
                                    color: AppColor.blackcolor,
                                  ),
                                ],
                              ),
                              sizeBoxWidth(8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: idcArd.data!.mailId.toString(),
                                    fontsize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.blackcolor,
                                  ),
                                  sizeBoxHeight(7.h),
                                  AppText(
                                    text: idcArd.data!.mobileNumber.toString(),
                                    fontsize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.blackcolor,
                                  ),
                                  sizeBoxHeight(7.h),
                                  AppText(
                                    text: idcArd.data!.address.toString(),
                                    fontsize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.blackcolor,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Image.asset(
                        '${AppImages.finjoybriefcaseimages}scan.png',
                        height: 75.h,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget shareButton() {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                Loader().showLoader(context);
                final bytes = await controller.capture();
                final temp = await getTemporaryDirectory();
                final path = '${temp.path}/image.jpg';
                File(path).writeAsBytesSync(bytes as List<int>);
                Share.shareFiles([path], text: '');
                Loader().hideLoader(context);
              },
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: AppColor.whitecolor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      '${AppImages.finjoybriefcaseimages}share.png',
                      height: 18.h,
                    ),
                    sizeBoxWidth(12.w),
                    AppText(
                      text: getLabel(share),
                      fontsize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.bluecolor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          sizeBoxWidth(15.w),
          Expanded(
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: AppColor.whitecolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    '${AppImages.finjoybriefcaseimages}edit.png',
                    height: 18.h,
                  ),
                  sizeBoxWidth(12.w),
                  AppText(
                    text: getLabel(edit),
                    fontsize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.bluecolor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget homeDetails() {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.whitecolor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r), topLeft: Radius.circular(30.r))),
      child: SizedBox(
        // height: 815.h,
        height: 838.h,
        child: Column(
          children: [
            sellearn(),
            sizeBoxHeight(15.h),
            sellearnDetails(),
          ],
        ),
      ),
    );
  }

  Widget sellearn() {
    return Padding(
      padding: const EdgeInsets.only(
          left: vDefaultSize, right: vDefaultSize, top: vDefaultPadding),
      child: Row(
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
            text: getLabel(visiting_card),
            fontsize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.blacktextcolor,
          ),
        ],
      ),
    );
  }

  Widget sellearnDetails() {
    return StreamBuilder<GetDashboardMenuModel>(
        stream: getFinancialDashboardBloc.getFinancialDashboardStream,
        builder: (context,
            AsyncSnapshot<GetDashboardMenuModel>
                getFinancialDashboardsnapshot) {
          if (!getFinancialDashboardsnapshot.hasData) {
            return Container(
              color: AppColor.whitecolor,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColor.bluecolor,
                ),
              ),
            );
          }
          if (isStartScreen) {
            for (var i = 0;
                i < getFinancialDashboardsnapshot.data!.data!.length;
                i++) {
              for (var m = 0;
                  m <
                      getFinancialDashboardsnapshot
                          .data!.data![i].menus!.length;
                  m++) {
                if (getFinancialDashboardsnapshot.data!.data![i].sectionid ==
                    3) {
                  if (widget.visitingcardName !=
                      getFinancialDashboardsnapshot
                          .data!.data![i].menus![m].categoryType) {
                    visitingCardData.add(
                        getFinancialDashboardsnapshot.data!.data![i].menus![m]);
                  }
                }
              }
            }
            isStartScreen = false;
          }
          return GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              mainAxisSpacing: 0.0,
              children: List.generate(visitingCardData.length, (index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) {
                          return const MyIdCardScreen(
                              visitingcardName: 'My Id Card');
                        },
                      ));
                    } else if (index == 1) {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) {
                          return const ReferAndEarnScreen();
                        },
                      ));
                    } else if (index == 2) {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) {
                          return const AnalyticsScreen();
                        },
                      ));
                    } else {}
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(visitingCardData[index].iconUrl ?? '',
                          height: 35.h),
                      sizeBoxHeight(vDefaultSize),
                      SizedBox(
                        width: 100.w,
                        child: AppText(
                          text: visitingCardData[index].categoryType ?? "",
                          fontsize: 13.sp,
                          fontWeight: FontWeight.w500,
                          maxLines: 1,
                          textCenter: true,
                          overflow: TextOverflow.ellipsis,
                          color: AppColor.textlightblackcolor,
                        ),
                      ),
                    ],
                  ),
                );
              }));
        });
  }
}
