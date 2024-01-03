// ignore_for_file: unnecessary_string_interpolations

import 'package:audioplayers/audioplayers.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:finjoy_app/api/dashboard/bloc/get_financial_dashboard_bloc.dart';
import 'package:finjoy_app/api/dashboard/model/get_financial_dashboard_model.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/credit%20card/credit_card_screen.dart';
import 'package:finjoy_app/screens/home/finjoy%20briefcase/analytics_screen.dart';
import 'package:finjoy_app/screens/home/finjoy%20briefcase/my_id_card_screen.dart';
import 'package:finjoy_app/screens/home/finjoy%20briefcase/visiting_card_screen.dart';
import 'package:finjoy_app/screens/home/referAndEarn/refer_and_earn_screen.dart';
import 'package:finjoy_app/screens/home/sell%20&%20earn/sell_earn_screen.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../api/appLabel/app_label_service.dart';

class FinancialTab extends StatefulWidget {
  const FinancialTab({super.key});

  @override
  State<FinancialTab> createState() => _FinancialTabState();
}

class _FinancialTabState extends State<FinancialTab> {
  @override
  void initState() {
    getFinancialDashboardBloc.getFinancialDashboardSink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: Container(
              margin: EdgeInsets.only(top: 130),
              color: AppColor.whitecolor,
              child: ListView.builder(
                  itemCount: getFinancialDashboardsnapshot.data?.data?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        sellearn(getFinancialDashboardsnapshot, index),
                      ],
                    );
                  }),
            ),
          );
        });
  }

  // Widget sellearn(
  //   AsyncSnapshot<GetDashboardMenuModel> getFinancialDashboardsnapshot,
  //   int index,
  // ) {
  //   return AnimatedListItem(index);
  // }

  Widget sellearn(
      AsyncSnapshot<GetDashboardMenuModel> getFinancialDashboardsnapshot,
      int index) {
    return Column(
      children: [
        if (getFinancialDashboardsnapshot.data!.data![index].menus!.isNotEmpty)
          Padding(
            padding:
                const EdgeInsets.only(left: vDefaultSize, right: vDefaultSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (getFinancialDashboardsnapshot
                                    .data?.data?[index].sectionid !=
                                5 &&
                            getFinancialDashboardsnapshot
                                    .data?.data?[index].sectionid !=
                                6)
                        ? AppText(
                            text:
                                '${getFinancialDashboardsnapshot.data?.data?[index].sectionname ?? ''}',
                            fontsize: 19.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blacktextcolor,
                          )
                        : const SizedBox.shrink(),
                    Visibility(
                      visible: getFinancialDashboardsnapshot
                              .data?.data?[index].description !=
                          getLabel(see_all),
                      child: AppText(
                        text: getFinancialDashboardsnapshot
                                .data?.data?[index].description ??
                            '',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blacktextcolor,
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: getFinancialDashboardsnapshot
                          .data?.data?[index].description ==
                      getLabel(see_all),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) {
                          return const SellEarnScreen();
                        },
                      ));
                    },
                    child: AppText(
                      text: getFinancialDashboardsnapshot
                              .data?.data?[index].description ??
                          '',
                      fontsize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.bluecolor,
                    ),
                  ),
                )
              ],
            ),
          ),
        if (getFinancialDashboardsnapshot.data?.data?[index].sectionid == 1)
          sellDetails(sellList1,
              getFinancialDashboardsnapshot.data?.data?[index] ?? Data()),
        if (getFinancialDashboardsnapshot.data?.data?[index].sectionid == 2)
          checkCredit(
              getFinancialDashboardsnapshot.data?.data?[index] ?? Data()),
        if (getFinancialDashboardsnapshot.data?.data?[index].sectionid == 3)
          finjoybrieface(
              getFinancialDashboardsnapshot.data?.data?[index] ?? Data()),
        if (getFinancialDashboardsnapshot.data?.data?[index].sectionid == 4)
          finjoyextra(
              getFinancialDashboardsnapshot.data?.data?[index] ?? Data()),
        if (getFinancialDashboardsnapshot.data?.data?[index].sectionid == 5)
          getWithdrawel(
              getFinancialDashboardsnapshot.data?.data?[index] ?? Data()),
        if (getFinancialDashboardsnapshot.data?.data?[index].sectionid == 6)
          getInstant(
              getFinancialDashboardsnapshot.data?.data?[index] ?? Data()),
        if (getFinancialDashboardsnapshot.data?.data?[index].sectionid == 7)
          understanding(
              getFinancialDashboardsnapshot.data?.data?[index] ?? Data()),
        if (getFinancialDashboardsnapshot.data?.data?[index].sectionid == 8)
          Column(
            children: [
              joinUs(
                  getFinancialDashboardsnapshot.data?.data?[index] ?? Data()),
              Image.network('https://finjoyapp.com/images/pune.png')
            ],
          ),
      ],
    );
  }

  Widget sellDetails(List sellList, Data financialDashboardData) {
    return Padding(
      padding: const EdgeInsets.only(left: vDefaultSize, right: vDefaultSize),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: financialDashboardData.menus!
                  .asMap()
                  .entries
                  .where((entry) => entry.key < 4)
                  .map((entry) {
                final index = entry.key;
                return GestureDetector(
                  onTap: () {
                    PrefObj.preferences!.put(PrefKeys.CategoryId,
                        financialDashboardData.menus?[index].categoryid);
                    PrefObj.preferences!.put(PrefKeys.SellEarnHeaderImage,
                        financialDashboardData.menus?[index].bgimage);
                    PrefObj.preferences!.put(PrefKeys.SellEarnLayoutType,
                        financialDashboardData.menus?[index].layoutType);
                    // if (financialDashboardData.menus?[index].categoryid == 1) {
                    Navigator.push(context, CupertinoPageRoute(
                      builder: (context) {
                        return CreditCardScreen(
                          headerName: financialDashboardData
                              .menus![index].categoryType
                              .toString(),
                          catId: financialDashboardData.menus![index].categoryid
                              .toString(),
                        );
                      },
                    ));

                    // } else if (financialDashboardData
                    //         .menus?[index].categoryid ==
                    //     2) {
                    //   Navigator.push(context, CupertinoPageRoute(
                    //     builder: (context) {
                    //       return LoansScreen(
                    //         fullName: PrefObj.preferences!
                    //             .get(PrefKeys.FullName)
                    //             .toString(),
                    //       );
                    //     },
                    //   ));
                    // }

                    // else if (index == 2) {
                    //   Navigator.push(context, CupertinoPageRoute(
                    //     builder: (context) {
                    //       return SellEarnScreen(
                    //           fullName: widget.fullName.toString());
                    //     },
                    //   ));
                    // } else if (index == 3) {
                    //   Navigator.push(context, CupertinoPageRoute(
                    //     builder: (context) {
                    //       return SellEarnScreen(
                    //           fullName: widget.fullName.toString());
                    //     },
                    //   ));
                    // }
                  },
                  child: SizedBox(
                    width: 90.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        sizeBoxHeight(vDefaultSize),

                        // CustomImageView(
                        //   imagePath:
                        //       financialDashboardData.menus![index].iconUrl!,
                        //   height: 36.h,
                        // ),
                        Image.network(
                            financialDashboardData.menus![index].iconUrl!,
                            height: 36.h),
                        // financialDashboardData.menus![index].iconUrl!
                        //         .endsWith('.json')
                        //     ? Lottie.network(
                        //         financialDashboardData.menus?[index].iconUrl ??
                        //             '',
                        //         height: 36.h)
                        //     : Image.network(
                        //         financialDashboardData.menus?[index].iconUrl ??
                        //             '',
                        //         height: 36.h),
                        // financialDashboardData.menus![index].iconUrl!
                        //         .endsWith('.json')
                        //     ? Lottie.network(
                        //         financialDashboardData.menus?[index].iconUrl ??
                        //             '',
                        //         height: 36.h)
                        //     : Image.network(
                        //         financialDashboardData.menus?[index].iconUrl ??
                        //             '',
                        //         height: 36.h),
                        sizeBoxHeight(vDefaultSize),
                        AppText(
                          text: financialDashboardData
                                  .menus?[index].categoryType ??
                              '',
                          fontsize: 12.sp,
                          fontWeight: FontWeight.w500,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          color: AppColor.textlightblackcolor,
                        ),
                        sizeBoxHeight(vDefaultSize / 2),
                        financialDashboardData
                                .menus![index].description!.isNotEmpty
                            ? Container(
                                decoration: BoxDecoration(
                                    color: AppColor.greenncolor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(2.r),
                                      topLeft: Radius.circular(2.r),
                                      bottomLeft: Radius.circular(10.r),
                                      bottomRight: Radius.circular(10.r),
                                    )),
                                child: Center(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 2.h),
                                      child: AppText(
                                        text: financialDashboardData
                                                .menus?[index].description ??
                                            "",
                                        fontsize: 11.sp,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.whitecolor,
                                      )),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(2.r),
                                      topLeft: Radius.circular(2.r),
                                      bottomLeft: Radius.circular(10.r),
                                      bottomRight: Radius.circular(10.r),
                                    )),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 2.h),
                                    child: Text(
                                      financialDashboardData
                                              .menus?[index].description ??
                                          "",
                                      style: GoogleFonts.poppins(
                                          fontSize: 11.sp,
                                          color: Colors.transparent,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                );
              }).toList()),
          sizeBoxHeight(vDefaultPadding),
          dottedDivider(),
          sizeBoxHeight(vDefaultSize),
        ],
      ),
    );
  }

  Widget checkCredit(Data data) {
    return Padding(
      padding: const EdgeInsets.only(left: vDefaultSize, right: vDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizeBoxHeight(vDefaultPadding),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.dividercolor, width: 1.5.w),
                borderRadius: BorderRadius.circular(26.r)),
            child: Padding(
              padding: EdgeInsets.only(bottom: 0.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          height: 17.h,
                          width: 95.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6.r),
                                  topRight: Radius.circular(12.r),
                                  bottomLeft: Radius.circular(6.r)),
                              color: AppColor.greenncolor),
                          child: Center(
                            child: AppText(
                              text: data.menus?[0].highlightText ?? "",
                              fontsize: 11.sp,
                              color: AppColor.whitecolor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 9.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Lottie.network(data.menus?[0].iconUrl ?? "",
                            height: 130.h, width: 130.w),
                        sizeBoxWidth(20.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // sizeBoxHeight(vDefaultPadding),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2.w,
                              child: AppText(
                                text: data.menus?[0].description ?? "",
                                fontsize: 13.sp,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                color: AppColor.blackcolor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            sizeBoxHeight(15.h),
                            Container(
                              height: 29.h,
                              width: 115.w,
                              decoration: BoxDecoration(
                                color: AppColor.bluecolor,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Center(
                                child: AppText(
                                  text: getLabel(know_more),
                                  fontsize: 12.sp,
                                  color: AppColor.whitecolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          sizeBoxHeight(vDefaultPadding * 1.5),
          dottedDivider(),
          sizeBoxHeight(vDefaultSize),
        ],
      ),
    );
  }

  Widget finjoybrieface(Data data) {
    return Padding(
      padding: const EdgeInsets.only(left: vDefaultSize, right: vDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              mainAxisSpacing: 0.0,
              children: List.generate(data.menus!.length, (index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return VisitingCardScreen(
                            visitingcardName: data.menus?[index].categoryType);
                      }));
                    } else if (index == 1) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return MyIdCardScreen(
                            visitingcardName: data.menus?[index].categoryType);
                      }));
                    } else if (index == 2) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const ReferAndEarnScreen();
                      }));
                    } else if (index == 3) {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return const AnalyticsScreen();
                      }));
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CustomImageView(
                      //   imagePath: data.menus?[index].iconUrl ?? "",
                      //   height: 40.h,
                      // ),
                      Image.network(
                        data.menus?[index].iconUrl ?? "",
                        height: 40.h,
                      ),
                      sizeBoxHeight(vDefaultSize),
                      SizedBox(
                        width: 100.w,
                        child: AppText(
                          text: data.menus?[index].categoryType ?? "",
                          fontsize: 12.5.sp,
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
              })),
          dottedDivider(),
          sizeBoxHeight(vDefaultSize),
        ],
      ),
    );
    // ]));
  }

  Widget finjoyextra(Data data) {
    return Padding(
      padding: const EdgeInsets.only(left: vDefaultSize, right: vDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 75,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data.menus?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: vDefaultPadding),
                    child: Stack(
                      children: [
                        Image.asset(
                            '${AppImages.finjoybriefcaseimages}instantBG.png',
                            height: 90),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Row(
                                children: [
                                  RotatedBox(
                                      quarterTurns: -1,
                                      child: AppText(
                                          text: data.menus?[index]
                                                  .highlightText ??
                                              "",
                                          color: AppColor.whitecolor,
                                          fontWeight: FontWeight.w500,
                                          fontsize: 14.sp)),
                                  sizeBoxWidth(18),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 6.8,
                                    child: AppText(
                                        text: data.menus?[index].description ??
                                            "",
                                        color: AppColor.fontblackcolor,
                                        fontWeight: FontWeight.w700,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        fontsize: 11),
                                  ),
                                ],
                              ),
                            ),
                            data.menus![index].iconUrl!.endsWith('.json')
                                ? Lottie.network(
                                    data.menus?[index].iconUrl ?? '',
                                    height: 35)
                                : Image.network(
                                    data.menus?[index].iconUrl ?? '',
                                    height: 35),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget getInstant(Data data) {
    return Padding(
      padding: const EdgeInsets.only(left: vDefaultSize, right: vDefaultSize),
      child: Column(
        children: [
          SizedBox(
            height: 115.h,
            child: ListView.builder(
                itemCount: data.menus?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        right: vDefaultSize, bottom: vDefaultSize),
                    child: Image.network(
                      data.menus?[index].iconUrl ?? "",
                      height: 100.h,
                    ),
                  );
                }),
          ),
          sizeBoxHeight(vDefaultSize),
          dottedDivider(),
          sizeBoxHeight(vDefaultSize),
        ],
      ),
    );
  }

  Widget getWithdrawel(Data data) {
    return Padding(
      padding: const EdgeInsets.only(left: vDefaultSize, right: vDefaultSize),
      child: SizedBox(
        height: 115,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: data.menus?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    right: vDefaultPadding, bottom: vDefaultSize),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Image.network(
                      data.menus?[index].iconUrl ?? "",
                      height: 115,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 42),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: AppText(
                              textCenter: true,
                              text: data.menus?[index].description ?? "",
                              color: AppColor.whitecolor,
                              fontWeight: FontWeight.w700,
                              fontsize: 12,
                            ),
                          ),
                          sizeBoxHeight(vDefaultSize),
                          Container(
                            height: 17,
                            width: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColor.whitecolor),
                            child: Center(
                              child: AppText(
                                  text: data.menus?[index].knowmorebutton ?? "",
                                  fontsize: 9.sp,
                                  color: AppColor.blackcolor,
                                  fontWeight: FontWeight.normal),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  // Widget getWithdrawelDetails() {
  //   return Padding(
  //     padding: const EdgeInsets.only(
  //         top: vDefaultPadding * 1.2, left: vDefaultPadding * 1.5),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         AppText(
  //           text: 'Get Instant\nWithdraw',
  //           fontsize: 22.sp,
  //           fontWeight: FontWeight.w500,
  //           color: AppColor.whitecolor,
  //         ),
  //         sizeBoxHeight(14.h),
  //         Row(
  //           children: [
  //             AppText(
  //               text: 'know more',
  //               fontsize: 12.sp,
  //               fontWeight: FontWeight.w400,
  //               color: AppColor.whitecolor,
  //             ),
  //             sizeBoxWidth(10.w),
  //             Image.asset(
  //               '${AppImages.homeimages}arrow.png',
  //               height: 8.h,
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget understanding(Data data) {
    return Padding(
      padding: const EdgeInsets.only(left: vDefaultSize, right: vDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 270.h,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data.menus?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: vDefaultPadding.w),
                    child: Row(
                      children: [
                        Image.network(
                          data.menus?[index].iconUrl ?? "",
                        ),
                      ],
                    ),
                  );
                }),
          ),
          sizeBoxHeight(vDefaultPadding * 1.5.h),
          dottedDivider(),
          sizeBoxHeight(vDefaultSize),
        ],
      ),
    );
  }

  Widget joinUs(Data data) {
    return Padding(
      padding: const EdgeInsets.only(left: vDefaultSize, right: vDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 76.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: const Color(0xffF9F9F9)),
              child: SizedBox(
                height: 76.h,
                child: ListView.builder(
                    itemCount: data.menus?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              data.menus?[index].iconUrl ?? "",
                              fit: BoxFit.fitHeight,
                              height: 45.h,
                              width: 45.w,
                            ),
                          ],
                        ),
                      );
                    }),
              )),
        ],
      ),
    );
  }
}

Widget dottedDivider() {
  return DottedLine(
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
  );
}

class AnimatedListItem extends StatefulWidget {
  final int index;

  const AnimatedListItem(this.index, {Key? key}) : super(key: key);

  @override
  State<AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> {
  bool _animate = false;

  static bool _isStart = true;

  @override
  void initState() {
    super.initState();
    if (_isStart) {
      Future.delayed(Duration(milliseconds: widget.index * 100), () {
        setState(() {
          _animate = true;
          _isStart = false;
        });
      });
    } else {
      _animate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 2),
      opacity: _animate ? 1 : 0,
      curve: Curves.slowMiddle,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 1000),
        padding: _animate
            ? const EdgeInsets.all(4.0)
            : const EdgeInsets.only(top: 10),
        child: Container(
          constraints: const BoxConstraints.expand(height: 50),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.index.toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
