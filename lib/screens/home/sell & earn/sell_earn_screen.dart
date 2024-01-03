import 'package:finjoy_app/api/dashboard/bloc/get_sell_and_earn_data_bloc.dart';
import 'package:finjoy_app/api/dashboard/model/get_sell_and_earn_data_model.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/credit%20card/credit_card_screen.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../api/appLabel/app_label_service.dart';

class SellEarnScreen extends StatefulWidget {
  const SellEarnScreen({super.key});

  @override
  State<SellEarnScreen> createState() => _SellEarnScreenState();
}

class _SellEarnScreenState extends State<SellEarnScreen> {
  @override
  void initState() {
    getSellAndEarnDataBloc.getSellAndEarnDataSink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [const HomeCustomAppbar(), sellDetails()]));
  }

  Widget sellDetails() {
    return Container(
      margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
      padding: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w),
      decoration: BoxDecoration(
          color: AppColor.whitecolor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
          )),
      child: StreamBuilder<GetSellAndEarnDataModel>(
          stream: getSellAndEarnDataBloc.getSellAndEarnDataStream,
          builder: (context,
              AsyncSnapshot<GetSellAndEarnDataModel>
                  getSellAndEarnDatasnapshot) {
            if (!getSellAndEarnDatasnapshot.hasData) {
              return Container(
                color: AppColor.whitecolor,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.bluecolor,
                  ),
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sellearn(),
                sizeBoxHeight(19.h),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sellearnDetails(getSellAndEarnDatasnapshot),
                          sizeBoxHeight(25.h),
                          sizeBoxHeight(25.h),
                          recommandedText(),
                          sizeBoxHeight(19.h),
                          recommanded(),
                          sizeBoxHeight(5.h),
                          recommanded(),
                          sizeBoxHeight(10.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget sellearn() {
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
          text: getLabel(sell_and_earn),
          fontsize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.blacktextcolor,
        ),
      ],
    );
  }

  Widget sellearnDetails(
      AsyncSnapshot<GetSellAndEarnDataModel> getSellAndEarnDatasnapshot) {
    return Wrap(
        spacing: 20.w,
        runSpacing: 30.h,
        children:
            getSellAndEarnDatasnapshot.data!.data!.asMap().entries.map((entry) {
          final sell = entry.value;
          return GestureDetector(
            onTap: () {
              PrefObj.preferences!.put(PrefKeys.CategoryId, sell.categoryid);
              PrefObj.preferences!
                  .put(PrefKeys.SellEarnHeaderImage, sell.bgimage);
              PrefObj.preferences!
                  .put(PrefKeys.SellEarnLayoutType, sell.layoutType);
              // if (sell.categoryid == 1) {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return CreditCardScreen(
                    headerName: sell.categoryType.toString(),
                    catId: sell.categoryid.toString(),
                  );
                },
              ));

              // } else if (sell.categoryid == 2) {
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
              //       return CreditCardDetailsScreen(
              //         fullName: widget.fullName.toString(),
              //       );
              //     },
              //   ));
              // }
            },
            child: SizedBox(
              width: 82.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sell.iconUrl!.endsWith('.json')
                      ? Lottie.network(sell.iconUrl!, height: 32.h)
                      : Image.network(sell.iconUrl!, height: 32.h),
                  sizeBoxHeight(vDefaultSize.h),
                  AppText(
                    text: sell.categoryType ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontsize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blacktextcolor,
                  ),
                  sizeBoxHeight(vDefaultSize.h),
                  sell.description != null && sell.description!.isNotEmpty
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
                                  text: '${sell.description}',
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
                                '${sell.description}',
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
        }).toList());
  }

  Widget recommandedText() {
    return AppText(
      text: getLabel(recommended_offers),
      fontsize: 20.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.blacktextcolor,
    );
  }

  Widget recommanded() {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      '${AppImages.homeimages}instantcash.png',
                      height: 85.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: vDefaultPadding * 2.w),
                      child: AppText(
                        text: 'Instant\nCash\nWithdrawal',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.fontblackcolor,
                      ),
                    ),
                  ],
                ),
                sizeBoxWidth(11.w),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.asset(
                      '${AppImages.homeimages}kotak.png',
                      height: 85.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: AppText(
                        text: 'Saving Account',
                        fontsize: 11.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.fontblackcolor,
                      ),
                    ),
                  ],
                ),
                sizeBoxWidth(11.w),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      '${AppImages.homeimages}instantcash.png',
                      height: 85.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: vDefaultPadding * 2.w),
                      child: AppText(
                        text: 'Instant\nCash\nWithdrawal',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.fontblackcolor,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
