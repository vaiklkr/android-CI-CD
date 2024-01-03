// ignore_for_file: avoid_print

import 'package:dotted_border/dotted_border.dart';
import 'package:finjoy_app/api/creditcard/model/get_financial_offerlist_model.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/credit%20card/credit_card_details_screen.dart';
import 'package:finjoy_app/screens/home/shareDetail/share_detail_screen.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../api/repository/repository.dart';
import 'add_customer_screen.dart';

class SellAndEarnAllCatData extends StatefulWidget {
  const SellAndEarnAllCatData({super.key});

  @override
  State<SellAndEarnAllCatData> createState() => _SellAndEarnAllCatDataState();
}

class _SellAndEarnAllCatDataState extends State<SellAndEarnAllCatData> {

  bool ascPayout = false,
      descPayout = false,
      ascFeatures1 = false,
      descFeatures1 = false,
      ascFeatures2 = false,
      descFeatures2 = false,
      ascFeatures3 = false,
      descFeatures3 = false,
      ascSalaried = false,
      descSalaried = false,
      ascSelfEmployed = false,
      descSelfEmployed = false;

  bool isLoading = true;

  List<SortingDataModel> sortingList = [];
  final _repository = Repository();
  GetFinancialOfferlistModel getData = GetFinancialOfferlistModel();
  List<Offerdata> dataList = [];
  List<Goals> goalsList = [];

  @override
  void initState() {
    super.initState();
    getFinancialOfferList();
  }

  Future<void> getFinancialOfferList() async {
    isLoading = true;
    getData = await _repository.onGetFinancialOfferList(
        PrefObj.preferences!.get(PrefKeys.CategoryId).toString(), '585328');
    if (getData.success!) {
      setState(() {
        dataList = getData.data!.offerdata!;
        if (getData.data!.issortby!) {
          sortingList.add(SortingDataModel(getLabel(sort_by), true, false));
        }
        if (getData.data!.isemployemnetfilter!) {
          sortingList.add(SortingDataModel(getLabel(employment), true, false));
        }
        if (getData.data!.isfilters!) {
          for (String tag in getData.data!.filtertags!) {
            sortingList.add(SortingDataModel(tag, false, false));
          }
        }
      });
    }
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return creditDetails();
  }

  Widget creditDetails() {
    return Expanded(
      child: isLoading ? const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(child: CircularProgressIndicator()),
      ) : dataList.isEmpty ? SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(child: AppText(
          text: getLabel(no_data_found),
          color: AppColor.blackcolor,
          fontsize: 16,
        )),
      ) : ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, right: 20.w, left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        searchTextfiled(),
                        sizeBoxHeight(17.h),
                        shortingList(),
                        sizeBoxHeight(20.h),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: AppColor.tabgraycolor,
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 15.h, right: 20.w, left: 20.w, bottom: 10),
                        child: creditCardList()),
                  ),
                ],
              ))),
    );
  }

  Widget searchTextfiled() {
    return AppSearchTextFormField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            '${AppImages.creditcardimages}search.png',
            height: 30.h,
          )),
      label: getLabel(enter_pincode_to_check_card_availability),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      hint: '',
    );
  }

  Widget shortingList() {
    return SizedBox(
      height: 38.h,
      child: ListView.builder(
          itemCount: sortingList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (sortingList[index].filterTitle.toString() == getLabel(sort_by)) {
              sortingList[index].isChecked = sortBySelected();
            } else if (sortingList[index].filterTitle.toString() ==
                getLabel(employment)) {
              sortingList[index].isChecked = employementSelected();
            }
            return GestureDetector(
              onTap: () {
                if (sortingList[index].isDropdown) {
                  showSortingDialog(index);
                } else {
                  setState(() {
                    sortingList[index].isChecked =
                        !sortingList[index].isChecked;
                  });
                }
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: DottedBorder(
                  padding: EdgeInsets.zero,
                  borderType: BorderType.RRect,
                  stackFit: StackFit.loose,
                  color: AppColor.graybordercolor,
                  radius: Radius.circular(17.r),
                  dashPattern: const [4],
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      height: 37.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.r),
                        color: sortingList[index].isChecked
                            ? AppColor.checkedColor
                            : AppColor.grayboxcolor,
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Row(
                            children: [
                              AppText(
                                text: sortingList[index].filterTitle,
                                fontWeight: FontWeight.w500,
                                color: sortingList[index].isChecked
                                    ? AppColor.whitecolor
                                    : AppColor.blacktextcolor,
                                fontsize: 16.sp,
                              ),
                              if (sortingList[index].isDropdown)
                                sizeBoxWidth(10),
                              if (sortingList[index].isDropdown)
                                Image.asset(
                                  '${AppImages.creditcardimages}dropdown.png',
                                  height: 13,
                                  width: 13,
                                  color: sortingList[index].isChecked
                                      ? AppColor.whitecolor
                                      : AppColor.blacktextcolor,
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget creditCardList() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: dataList.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          goalsList = getData.data!.offerdata![index].goals!;
          return offerListRow(index);
        });
  }

  Widget offerListRow(index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          PrefObj.preferences!
              .put(PrefKeys.OfferId, dataList[index].offerid.toString());
          PrefObj.preferences!
              .put(PrefKeys.OfferTitle, dataList[index].offername.toString());
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const CreditCardDetailsScreen();
            },
          ));
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.shade300,
                  ),
                  BoxShadow(
                    offset: const Offset(1, 2),
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(30.0),
                dashPattern: const [1.5, 1.5],
                color: AppColor.graytextcolor,
                strokeWidth: 1.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        earnUpToGreenContainer(index),
                        sizeBoxHeight(20.h),
                        offerTitle(index),
                        sizeBoxHeight(10.h),
                        offerDes(index),
                        if (dataList[index].showfeatures!) showFeatures(index),
                        if (dataList[index].showgoals!) showGoals(index),
                        sizeBoxHeight(5.h),
                        actionButtons(index),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Container(
                color: Colors.red,
                height: 62,
                child: Stack(
                  children: [
                    if (PrefObj.preferences!
                        .get(PrefKeys.SellEarnHeaderImage)
                        .toString()
                        .isNotEmpty)
                      Image.network(
                        '${PrefObj.preferences?.get(PrefKeys.SellEarnHeaderImage)}',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.network('${dataList[index].logourl}',
                              height: 22.h)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget earnUpToGreenContainer(index) {
    return Container(
      color: AppColor.lightGreen,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: getLabel(earn_upto),
              fontsize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.blacktextcolor,
            ),
            sizeBoxWidth(6.w),
            AppText(
              text: !dataList[index].ispayoutinpercentage!
                  ? '₹${dataList[index].offerprice.toString()} '
                  : '${dataList[index].offerprice.toString()}% ',
              fontsize: 14.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff0CCD27),
            ),
            if (dataList[index].fincoinspayout != null &&
                dataList[index].fincoinspayout != 0)
              Row(
                children: [
                  sizeBoxWidth(6.w),
                  AppText(
                    text: '+',
                    fontsize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blacktextcolor,
                  ),
                  sizeBoxWidth(6.w),
                  Image.asset('${AppImages.creditcardimages}coin.png',
                      height: 16.5.h),
                  sizeBoxWidth(6.w),
                  AppText(
                    text: '${dataList[index].fincoinspayout} finCoins',
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFFA900),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget offerTitle(index) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 15.w),
        child: AppText(
          text: '${dataList[index].offername.toString()} >',
          fontsize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.blacktextcolor,
        ),
      ),
    );
  }

  Widget offerDes(index) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Html(
        data: dataList[index].offerdetails.toString(),
        style: {
          "body": Style(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: FontSize(14), // Set your desired font size
            color: AppColor.graytext1color, // Set your desired text color
            // You can add other style properties here
          ),
        },
      ),
    );
  }

  Widget showFeatures(index) {
    return Column(
      children: [
        sizeBoxHeight(15.h),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (dataList[index].feature1Name != null)
                Column(
                  children: [
                    AppText(
                      text: dataList[index].feature1Name.toString(),
                      fontsize: 12.50.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blacktextcolor,
                    ),
                    sizeBoxHeight(10.h),
                    Image.asset(
                      '${AppImages.creditcardimages}${dataList[index].feature1Value == '3.0' ? 'good.png' : dataList[index].feature1Valuetext == '1.0' ? 'bad.png' : 'avg.png'}',
                      height: 34.h,
                    )
                  ],
                ),
              if (dataList[index].feature1Name != null)
                Image.asset(
                  '${AppImages.creditcardimages}devider_line.png',
                  height: 45.h,
                ),
              if (dataList[index].feature2Name != null)
                Column(
                  children: [
                    AppText(
                      text: dataList[index].feature2Name.toString(),
                      fontsize: 12.50.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blacktextcolor,
                    ),
                    sizeBoxHeight(11.h),
                    SizedBox(
                      height: 32.h,
                      child: AppText(
                        text: '${dataList[index].feature2Valuetext}',
                        fontsize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.blacktextcolor,
                      ),
                    )
                  ],
                ),
              if (dataList[index].feature2Name != null)
                Image.asset(
                  '${AppImages.creditcardimages}devider_line.png',
                  height: 45.h,
                ),
              if (dataList[index].feature3Name != null)
                Column(
                  children: [
                    AppText(
                      text: dataList[index].feature3Name.toString(),
                      fontsize: 12.50.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blacktextcolor,
                    ),
                    sizeBoxHeight(12.h),
                    Container(
                      height: 32.h,
                      width: 68.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColor.whitecolor),
                      child: Center(
                        child: AppText(
                          text: '${dataList[index].feature3Valuetext}',
                          fontsize: 13.5.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff0CCD27),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget showGoals(index) {
    return Column(
      children: [
        sizeBoxHeight(15.h),
        SizedBox(
          height: 130,
          child: Padding(
            padding: const EdgeInsets.only(left: vDefaultPadding),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: dataList[index].goals?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, goalIndex) {
                  var progressCount = 1 / goalsList.length;
                  progressCount = progressCount * goalsList[goalIndex].goalid!;
                  return Padding(
                    padding: const EdgeInsets.only(right: vDefaultPadding),
                    child: Stack(
                      children: [
                        Image.asset(
                          '${AppImages.creditcardimages}goal_bg.png',
                          width: 260,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 260,
                          height: 130,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text:
                                          '${getLabel(goal)} ${goalsList[goalIndex].goalid}',
                                      fontsize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.blacktextcolor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 1),
                                      child: Container(
                                        height: 22,
                                        decoration: const BoxDecoration(
                                            color: AppColor.lightGreen,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(25),
                                                bottomLeft:
                                                    Radius.circular(25))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AppText(
                                                text: !dataList[index]
                                                        .ispayoutinpercentage!
                                                    ? '₹${goalsList[goalIndex].goalprice.toString()} '
                                                    : '${goalsList[goalIndex].goalprice.toString()}% ',
                                                fontsize: 13.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff0CCD27),
                                              ),
                                              if (goalsList[goalIndex]
                                                          .goalfincoins !=
                                                      null &&
                                                  goalsList[goalIndex]
                                                          .goalfincoins !=
                                                      0)
                                                Row(
                                                  children: [
                                                    sizeBoxWidth(2.w),
                                                    AppText(
                                                      text: '+',
                                                      fontsize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColor
                                                          .blacktextcolor,
                                                    ),
                                                    sizeBoxWidth(2.w),
                                                    AppText(
                                                      text:
                                                          '${goalsList[goalIndex].goalfincoins} finCoins',
                                                      fontsize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xffFFA900),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                sizeBoxHeight(5),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    children: [
                                      AppText(
                                        text:
                                            '${goalsList[goalIndex].goalid}/${goalsList.length}',
                                        fontsize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.blacktextcolor,
                                      ),
                                      AppText(
                                        text:
                                            '  ${goalsList[goalIndex].goalname.toString()}',
                                        fontsize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.graytext1color,
                                      ),
                                    ],
                                  ),
                                ),
                                sizeBoxHeight(8),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: LinearProgressIndicator(
                                    value: progressCount,
                                    backgroundColor: Colors.grey.shade300,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.blue),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: AppText(
                                          text: goalsList[goalIndex]
                                              .goaldescription
                                              .toString(),
                                          fontsize: 13.sp,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          color: AppColor.blackcolor,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: goalIndex ==
                                                    goalsList.length - 1
                                                ? 10
                                                : 20),
                                        child: Image.asset(goalIndex ==
                                                goalsList.length - 1
                                            ? '${AppImages.creditcardimages}last_goal.png'
                                            : '${AppImages.creditcardimages}adventure.png'),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Widget actionButtons(index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          if (dataList[index].showaddcustomerbtn!)
            Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  PrefObj.preferences!
                      .put(PrefKeys.OfferId, dataList[index].offerid.toString());
                  PrefObj.preferences!
                      .put(PrefKeys.OfferTitle, dataList[index].offername.toString());
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return const AddCustomerScreen();
                    },
                  ));
                },
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(53.r),
                      border: Border.all(color: const Color(0xff1775D3))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: AppText(
                        text: dataList[index].addcustomerbtnText.toString(),
                        fontsize: 13.5.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1775D3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (dataList[index].showmoredetailsbtn!)
            Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  PrefObj.preferences!
                      .put(PrefKeys.OfferId, dataList[index].offerid.toString());
                  PrefObj.preferences!
                      .put(PrefKeys.OfferTitle, dataList[index].offername.toString());
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return const AddCustomerScreen();
                    },
                  ));
                },
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(53.r),
                      border: Border.all(color: const Color(0xff1775D3))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: AppText(
                        text: dataList[index].moredetailsbtnText.toString(),
                        fontsize: 13.5.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1775D3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (dataList[index].showsharebtn!)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return ShareDetailsScreen(
                          imageUrl: dataList[index].shareimage.toString(),
                          shareContent: dataList[index].sharecontent.toString(),
                          shareUrl: dataList[index].mainofferurl.toString());
                    },
                  ));
                  // ShareUtils.shareFileWithText(
                  //     context: context,
                  //     imageUrl: dataList[index].shareimage.toString(),
                  //     shareContent: dataList[index].sharecontent.toString());
                },
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(53.r),
                    color: const Color(0xff1775D3),
                  ),
                  child: Center(
                    child: AppText(
                      text: dataList[index].sharebtnText.toString(),
                      fontsize: 13.5.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.whitecolor,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void showSortingDialog(index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      isDismissible: true,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            if (sortingList[index].filterTitle.toString() == getLabel(sort_by))
              shortBy(index),
            if (sortingList[index].filterTitle.toString() == getLabel(employment))
              employmentDropDown(index),
          ],
        );
      },
    );
  }

  void ascDescChecked(ascVal, descVal) {
    setState(() {
      if (ascVal) {
        descVal = !descVal;
      } else if (descVal) {
        ascVal = false;
        descVal = false;
      } else {
        ascVal = !ascVal;
      }
    });
  }

  bool sortBySelected() {
    if (ascPayout ||
        descPayout ||
        ascFeatures1 ||
        descFeatures1 ||
        ascFeatures2 ||
        descFeatures2 ||
        ascFeatures3 ||
        descFeatures3) {
      return true;
    } else {
      return false;
    }
  }

  void sortByReset() {
    setState(() {
      ascPayout = false;
      descPayout = false;
      ascFeatures1 = false;
      descFeatures1 = false;
      ascFeatures2 = false;
      descFeatures2 = false;
      ascFeatures3 = false;
      descFeatures3 = false;
    });
  }

  bool employementSelected() {
    if (ascSalaried || descSalaried || ascSelfEmployed || descSelfEmployed) {
      return true;
    } else {
      return false;
    }
  }

  void employementReset() {
    setState(() {
      ascSalaried = false;
      descSalaried = false;
      ascSelfEmployed = false;
      descSelfEmployed = false;
    });
  }

  Widget horizontalLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 1,
        decoration: BoxDecoration(color: Colors.grey.shade200),
      ),
    );
  }

  void resetAll() {
    ascPayout = false;
    descPayout = false;
    ascFeatures1 = false;
    descFeatures1 = false;
    ascFeatures2 = false;
    descFeatures2 = false;
    ascFeatures3 = false;
    descFeatures3 = false;
    ascSalaried = false;
    descSalaried = false;
    ascSelfEmployed = false;
    descSelfEmployed = false;
  }

  Widget shortBy(index) {
    // if (ascendingOrder) {
    //   dataList.sort((a, b) => a.offername!.compareTo(b.offername!));
    // } else {
    //   dataList.sort((a, b) => b.offername!.compareTo(a.offername!));
    // }
    return Column(
      children: [
        sortingDialogHeader(index, () {
          sortByReset();
        }),
        ascDescContainer(index, getLabel(payout), ascPayout, descPayout, () {
          if (ascPayout) {
            ascPayout = false;
            resetAll();
            descPayout = !descPayout;
          } else if (descPayout) {
            ascPayout = false;
            descPayout = false;
          } else {
            descPayout = false;
            resetAll();
            ascPayout = !ascPayout;
          }
        }),
        horizontalLine(),
        ascDescContainer(index, dataList[index].feature1Name.toString(),
            ascFeatures1, descFeatures1, () {
          if (ascFeatures1) {
            ascFeatures1 = false;
            resetAll();
            descFeatures1 = !descFeatures1;
          } else if (descFeatures1) {
            ascFeatures1 = false;
            descFeatures1 = false;
          } else {
            descFeatures1 = false;
            resetAll();
            ascFeatures1 = !ascFeatures1;
          }
        }),
        horizontalLine(),
        ascDescContainer(index, dataList[index].feature2Name.toString(),
            ascFeatures2, descFeatures2, () {
          if (ascFeatures2) {
            ascFeatures2 = false;
            resetAll();
            descFeatures2 = !descFeatures2;
          } else if (descFeatures2) {
            ascFeatures2 = false;
            descFeatures2 = false;
          } else {
            descFeatures2 = false;
            resetAll();
            ascFeatures2 = !ascFeatures2;
          }
        }),
        horizontalLine(),
        ascDescContainer(index, dataList[index].feature3Name.toString(),
            ascFeatures3, descFeatures3, () {
          if (ascFeatures3) {
            ascFeatures3 = false;
            resetAll();
            descFeatures3 = !descFeatures3;
          } else if (descFeatures3) {
            resetAll();
          } else {
            descFeatures3 = false;
            resetAll();
            ascFeatures3 = !ascFeatures3;
          }
        }),
      ],
    );
  }

  Widget employmentDropDown(index) {
    return Column(
      children: [
        sortingDialogHeader(index, () {
          employementReset();
        }),
        ascDescContainer(index, getLabel(salaried), ascSalaried, descSalaried, () {
          if (ascSalaried) {
            ascSalaried = false;
            resetAll();
            descSalaried = !descSalaried;
          } else if (descSalaried) {
            resetAll();
          } else {
            descSalaried = false;
            resetAll();
            ascSalaried = !ascSalaried;
          }
        }),
        horizontalLine(),
        ascDescContainer(
            index, getLabel(self_employed), ascSelfEmployed, descSelfEmployed, () {
          if (ascSelfEmployed) {
            ascSelfEmployed = false;
            resetAll();
            descSelfEmployed = !descSelfEmployed;
          } else if (descSelfEmployed) {
            resetAll();
          } else {
            descSelfEmployed = false;
            resetAll();
            ascSelfEmployed = !ascSelfEmployed;
          }
        }),
      ],
    );
  }

  Widget sortingDialogHeader(index, resetClick) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: AppText(
                  text: sortingList[index].filterTitle,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blacktextcolor,
                  fontsize: 19.sp,
                ),
              ),
              GestureDetector(
                onTap: () {
                  resetClick();
                },
                child: AppText(
                  text: getLabel(reset),
                  fontWeight: FontWeight.w600,
                  color: AppColor.lightBlue,
                  fontsize: 19.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ascDescContainer(
      index, String title, bool ascVal, bool descVal, ascClick) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          setState(() {
            ascClick();
            if (sortingList[index].filterTitle.toString() ==
                getLabel(sort_by)) {
              sortingList[index].isChecked = sortBySelected();
            } else if (sortingList[index].filterTitle.toString() ==
                getLabel(employment)) {
              sortingList[index].isChecked = employementSelected();
            }
            // ascVal = !ascVal;
          });
        },
        child: SizedBox(
          height: 65,
          width: double.infinity,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: AppText(
                    text: title,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blacktextcolor,
                    fontsize: 18.sp,
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: ascVal
                              ? AppColor.lightBlue
                              : descVal
                                  ? AppColor.orangecolor
                                  : Colors.grey.shade400,
                          width: ascVal
                              ? 2
                              : descVal
                                  ? 2
                                  : 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                        ascVal
                            ? '${AppImages.creditcardimages}asc_arrow.png'
                            : descVal
                                ? '${AppImages.creditcardimages}desc_arrow.png'
                                : '${AppImages.creditcardimages}sorting_icon.png',
                        color: ascVal
                            ? AppColor.lightBlue
                            : descVal
                                ? AppColor.orangecolor
                                : Colors.grey.shade400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SortingDataModel {
  String filterTitle;
  bool isDropdown;
  bool isChecked;

  SortingDataModel(this.filterTitle, this.isDropdown, this.isChecked);
}
