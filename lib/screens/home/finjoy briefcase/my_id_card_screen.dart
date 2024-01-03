// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:io';

import 'package:finjoy_app/api/dashboard/bloc/get_financial_dashboard_bloc.dart';
import 'package:finjoy_app/api/dashboard/model/get_financial_dashboard_model.dart';
import 'package:finjoy_app/api/visiting%20card/model/visiting_card_model.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/drawer/drawer_screen.dart';
import 'package:finjoy_app/screens/home/finjoy%20briefcase/analytics_screen.dart';
import 'package:finjoy_app/screens/home/finjoy%20briefcase/visiting_card_screen.dart';
import 'package:finjoy_app/screens/home/referAndEarn/refer_and_earn_screen.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../api/visiting card/bloc/visiting_card_bloc.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_button.dart';

List sellList1 = [
  {
    'image': '${AppImages.finjoybriefcaseimages}visiting.png',
    'name': 'Visiting Card',
  },
  {
    'image': '${AppImages.finjoybriefcaseimages}ana.png',
    'name': 'Analytics',
  },
  {
    'image': '${AppImages.finjoybriefcaseimages}team.png',
    'name': 'My Team',
  },
  {
    'image': '${AppImages.finjoybriefcaseimages}cus.png',
    'name': 'Customers',
  },
  {
    'image': '${AppImages.finjoybriefcaseimages}refer.png',
    'name': 'Refer & Earn',
  },
];

class MyIdCardScreen extends StatefulWidget {
  const MyIdCardScreen({super.key, this.visitingcardName});
  final String? visitingcardName;
  @override
  State<MyIdCardScreen> createState() => _MyIdCardScreen();
}

class _MyIdCardScreen extends State<MyIdCardScreen> {
  bool isStartScreen = true;
  List<Menus> myIdCardCardData = [];
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
            VisitingCardModel visitingCard = getVisitingCardSnapshot.data!;
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    title: appBar(),
                    leadingWidth: 0.0,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: vDefaultPadding),
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
                    expandedHeight: 535,
                    elevation: 0.0,
                    floating: true,
                    pinned: true,
                    flexibleSpace:
                    FlexibleSpaceBar(background: bgImage(visitingCard)),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: SingleChildScrollView(
                              child: homeDetails(),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget bgImage(VisitingCardModel visitingCard) {
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
              padding: const EdgeInsets.only(top: 85),
              // padding: EdgeInsets.only(top: vDefaultPadding * 3.2.h),
              child: Column(
                children: [
                  idcardCard(visitingCard),
                  sizeBoxHeight(15),
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

  Widget idcardCard(VisitingCardModel visitingCard) {
    return WidgetsToImage(
      controller: controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SizedBox(
          height: 400,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                '${AppImages.finjoybriefcaseimages}idcard.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 15),
                child: Column(
                  children: [
                    Image.asset(
                      '${AppImages.finjoybriefcaseimages}logo.png',
                      height: 54.h,
                    ),
                    sizeBoxHeight(37.w),
                    profileImage(context, 150.h, AppColor.bluecolor, false),
                    // Container(
                    //   height: 150.h,
                    //   width: 150.w,
                    //   decoration: BoxDecoration(
                    //     border:
                    //     Border.all(color: AppColor.bluecolor, width: 2.w),
                    //     borderRadius: BorderRadius.circular(80.r),
                    //   ),
                    //   child: Center(
                    //     child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(100),
                    //         child: PrefObj.preferences!.get(PrefKeys.ProfileImage).toString().startsWith('assets') ? Image.asset(PrefObj.preferences!.get(PrefKeys.ProfileImage).toString(), width: 150.h, height: 150.h,fit: BoxFit.cover,)
                    //             : Image.network(PrefObj.preferences!.get(PrefKeys.ProfileImage).toString(), width: 150.h, height: 150.h,fit: BoxFit.cover,)
                    //     ),
                    //   ),
                    // ),
                    sizeBoxHeight(25.w),
                    AppText(
                      text: visitingCard.data!.name.toString(),
                      fontsize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackcolor,
                    ),
                    AppText(
                      text: visitingCard.data!.occupation.toString(),
                      fontsize: 16.sp,
                      textCenter: true,
                      fontWeight: FontWeight.w400,
                      color: AppColor.blackcolor,
                    ),
                    sizeBoxHeight(25.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail_outline,
                          size: 10.sp,
                          color: AppColor.blackcolor,
                        ),
                        sizeBoxWidth(8.w),
                        AppText(
                          text: visitingCard.data!.mailId.toString(),
                          fontsize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackcolor,
                        ),
                      ],
                    ),
                    sizeBoxHeight(3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call_outlined,
                          size: 10.sp,
                          color: AppColor.blackcolor,
                        ),
                        sizeBoxWidth(8.w),
                        AppText(
                          text: visitingCard.data!.mobileNumber.toString(),
                          fontsize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackcolor,
                        ),
                      ],
                    ),
                    sizeBoxHeight(3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 10.sp,
                          color: AppColor.blackcolor,
                        ),
                        sizeBoxWidth(8.w),
                        AppText(
                          text: visitingCard.data!.address.toString(),
                          fontsize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackcolor,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
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
                height: 45,
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
              height: 45,
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
        // height: MediaQuery.of(context).size.height / 1.23.h,
        // height: 820.h,
        // height: 835.h,
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
            text: getLabel(my_id_card),
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
                    myIdCardCardData.add(
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
              children: List.generate(myIdCardCardData.length, (index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) {
                          return MyIdCardScreen(
                            visitingcardName: widget.visitingcardName,
                          );
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
                      Image.network(myIdCardCardData[index].iconUrl ?? '',
                          height: 35.h),
                      sizeBoxHeight(vDefaultSize),
                      SizedBox(
                        width: 100.w,
                        child: AppText(
                          text: myIdCardCardData[index].categoryType ?? "",
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
