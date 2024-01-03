import 'dart:math';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../const/behaviour.dart';

List detailsList = [
  'Access to golf courses worldwide & 12 free lessons/\nyear*',
  'Free 1 night stay* & dining benefits at selected places\nglobally*',
  'HFree memberships to loyalty programs, Hotel Lux &\nmany more*',
  '12% discount on worldwide hotel booking on Agoda*',
  '10% Cashback on Swiggy Spends (up to 1500)',
  '5% Cashback on Online spends (up to 1500)',
  'Free 3 month Swiggy One membership worth 1199*',
];

class LeaderBoardTab extends StatefulWidget {
  const LeaderBoardTab({super.key});

  @override
  State<LeaderBoardTab> createState() => _LeaderBoardTabState();
}

class _LeaderBoardTabState extends State<LeaderBoardTab> {
  List<LeaderBoardModel> postData = [];

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
    postData.add(LeaderBoardModel(
        name: "Pratap Ranjan",
        finId: "FinID202020203201",
        coin: "${Random().nextInt(1999)}"));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Scaffold(
        backgroundColor: AppColor.tabgraycolor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                        Image.asset(
                          '${AppImages.leaderBoardimages}round_blue_image.png',
                          height: 200.h,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      Image.asset(
                        '${AppImages.leaderBoardimages}leader_board_cup.png',
                        height: 230.h,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Image.asset(
                            '${AppImages.leaderBoardimages}my_rank.png',
                            width: 100,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                        child: Column(
                          children: [
                            Card(
                              elevation: 3,
                              shadowColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              color: AppColor.whitecolor,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 200.h,
                                  child: Stack(
                                    children: [
                                      Lottie.asset('${AppImages.leaderBoardimages}celebration.json', fit: BoxFit.cover,width: double.infinity,height: double.infinity),
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //         child: Image.asset(
                                      //           '${AppImages.leaderBoardimages}card_design.png',
                                      //           height: 100,
                                      //           fit: BoxFit.fill,
                                      //         )),
                                      //     Expanded(
                                      //       child: Transform.flip(
                                      //           flipX: true,
                                      //           child: Image.asset(
                                      //             '${AppImages.leaderBoardimages}card_design.png',
                                      //             height: 100,
                                      //             fit: BoxFit.fill,
                                      //           )),
                                      //     ),
                                      //   ],
                                      // ),
                                      Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Image.asset(
                                                '${AppImages.leaderBoardimages}profile_image_1st_rank.png',
                                                width: 210,
                                                height: 110,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Container(
                                              transform: Matrix4.translationValues(
                                                  0.0, -20.0, 0.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    '${AppImages.leaderBoardimages}gold_medal.png',
                                                    width: 45,
                                                    height: 45,
                                                  ),
                                                  Column(
                                                    children: [
                                                      AppText(
                                                        text: 'Pratap Ranjan',
                                                        fontsize: 21.sp,
                                                        fontWeight: FontWeight.bold,
                                                        color: AppColor.darktextcolor,
                                                      ),
                                                      AppText(
                                                        text: 'FinID202020203201',
                                                        fontsize: 16.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: const Color(0xffED6028),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              transform: Matrix4.translationValues(0.0, -7.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Card(
                                  elevation: 3,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20.r),
                                        bottomRight: Radius.circular(20.r),
                                      )),
                                  color: AppColor.whitecolor,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.r),
                                      bottomRight: Radius.circular(20.r),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.h,
                                      color: AppColor.bluecolor,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            '${AppImages.leaderBoardimages}coins.png',
                                            width: 28,
                                            height: 28,
                                          ),
                                          sizeBoxWidth(10),
                                          AppText(
                                            text: '2000 finCoins',
                                            fontsize: 17.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.whitecolor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Container(
                          transform: Matrix4.translationValues(0.0, -35.0, 0.0),
                          child: ListView.builder(
                            itemCount: postData.length,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    elevation: 2,
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    color: AppColor.whitecolor,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 120.h,
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            sizeBoxWidth(5),
                                            SizedBox(
                                              width: 50,
                                              child: index == 0 || index == 1
                                                  ? Center(
                                                child: Image.asset(
                                                  index == 0
                                                      ? '${AppImages.leaderBoardimages}silver_medal.png'
                                                      : '${AppImages.leaderBoardimages}bronze_medal.png',
                                                  width: 45,
                                                  height: 45,
                                                ),
                                              )
                                                  : Center(
                                                child: AppText(
                                                  text: '$index',
                                                  fontsize: 40.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.darkarrowcolor,
                                                ),
                                              ),
                                            ),
                                            Image.asset(
                                              '${AppImages.homeimages}profile.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                            sizeBoxWidth(5),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  AppText(
                                                    text: 'Pratap Ranjan',
                                                    fontsize: 19.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColor.blackcolor,
                                                  ),
                                                  AppText(
                                                    text: 'FinID202020203201',
                                                    fontsize: 15.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(0xffED6028),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            sizeBoxWidth(5),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      '${AppImages.leaderBoardimages}coins.png',
                                                      width: 20,
                                                      height: 20,
                                                      color: AppColor.orangecolor,
                                                    ),
                                                    sizeBoxWidth(5),
                                                    AppText(
                                                      text: '2000',
                                                      fontsize: 17.sp,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColor.orangecolor,
                                                    ),
                                                  ],
                                                ),
                                                AppText(
                                                  text: 'finCoins',
                                                  fontsize: 17.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color(0xffED6028),
                                                ),
                                              ],
                                            ),
                                            sizeBoxWidth(10),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                    elevation: 3,
                    margin: EdgeInsets.zero,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.r),
                          topRight: Radius.circular(25.r),
                        )),
                    color: AppColor.bluecolor,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                      child: SizedBox(
                          width: double.infinity,
                          height: 90.h,
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              sizeBoxWidth(5),
                              SizedBox(
                                width: 50,
                                child: Center(
                                  child: AppText(
                                    text: '50',
                                    fontsize: 40.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.whitecolor,
                                  ),
                                ),
                              ),
                              sizeBoxWidth(10),
                              Image.asset(
                                '${AppImages.homeimages}profile.png',
                                width: 50,
                                height: 50,
                              ),
                              sizeBoxWidth(5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      text: 'Pratap Ranjan',
                                      fontsize: 19.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.whitecolor,
                                    ),
                                    AppText(
                                      text: 'FinID202020203201',
                                      fontsize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.whitecolor,
                                    ),
                                  ],
                                ),
                              ),
                              sizeBoxWidth(5),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        '${AppImages.leaderBoardimages}coins.png',
                                        width: 20,
                                        height: 20,
                                        color: AppColor.whitecolor,
                                      ),
                                      sizeBoxWidth(5),
                                      AppText(
                                        text: '2000',
                                        fontsize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.whitecolor,
                                      ),
                                    ],
                                  ),
                                  AppText(
                                    text: 'finCoins',
                                    fontsize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.whitecolor,
                                  ),
                                ],
                              ),
                              sizeBoxWidth(10),
                            ],
                          ),
                        ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeaderBoardModel {
  String name;
  String finId;
  String coin;

  LeaderBoardModel({
    required this.name,
    required this.finId,
    required this.coin,
  });
}
