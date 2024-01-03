import 'package:dotted_border/dotted_border.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../api/my customers/model/my_customer_list_model.dart';
import '../../../api/repository/repository.dart';
import '../../../utils/shared_pref.dart';
import '../customer/customer_details_screen.dart';

List bankList = [
  'Credit Card',
  'Insurance',
  'Personal Loan',
  'Financing',
  'Saving A/C',
  'Demat A/C',
  'Investment',
  'Credit Line',
];

class MyCustomerScreen extends StatefulWidget {
  const MyCustomerScreen({super.key});

  @override
  State<MyCustomerScreen> createState() => _MyCustomerScreenState();
}

class _MyCustomerScreenState extends State<MyCustomerScreen> {
  bool isLoading = true;
  final _repository = Repository();
  MyCustomerListModel getData = MyCustomerListModel();
  List<Filters> filterList = [];
  List<Details> detailList = [];

  @override
  void initState() {
    super.initState();
    getMyCustomerList();
  }

  Future<void> getMyCustomerList() async {
    isLoading = true;
    getData = await _repository.onGetMyCustomerListApi();
    if (getData.success!) {
      setState(() {
        filterList = getData.data!.filters!;
        detailList = getData.data!.details!;
      });
    }
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [const HomeCustomAppbar(), sellDetails()]));
  }

  Widget sellDetails() {
    return Container(
      margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
      padding: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w),
      // height: 760.h,
      // padding: EdgeInsets.only(top: 22.h, right: 20.w, left: 20.w),
      decoration: BoxDecoration(
          color: AppColor.whitecolor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r), topLeft: Radius.circular(30.r))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sellearn(),
          sizeBoxHeight(25.h),
          searchTextfiled(),
          sizeBoxHeight(25.h),
          roundedRectBorderWidget,
          sizeBoxHeight(25.h),
          filterContainer(),
          sizeBoxHeight(25.h),
          Expanded(
              child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      cutomerDetails(),
                      sizeBoxHeight(25.h),
                    ],
                  ))))
        ],
      ),
    );
  }

  Widget sellearn() {
    return Row(
      children: [
        AppText(
          text: getLabel(my_customers),
          fontsize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.blacktextcolor,
        ),
      ],
    );
  }

  Widget searchTextfiled() {
    return AppSearchTextFormField(
      textInputAction: TextInputAction.done,
      suffixIcon: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset(
            '${AppImages.creditcardimages}search.png',
            height: 35.h,
          )),
      label: '${getLabel(search_by_name)}, ${getLabel(type)}',
      hint: '',
    );
  }

  Widget get roundedRectBorderWidget {
    return SizedBox(
      height: 38.h,
      child: ListView.builder(
          itemCount: filterList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: DottedBorder(
                borderType: BorderType.RRect,
                stackFit: StackFit.loose,
                color: AppColor.graybordercolor,
                radius: Radius.circular(17.r),
                dashPattern: const [4],
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(17.r)),
                  child: Container(
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.r),
                      color: AppColor.grayboxcolor,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: AppText(
                          text: filterList[index].categoryname.toString(),
                          fontWeight: FontWeight.w500,
                          color: AppColor.blacktextcolor,
                          fontsize: 14.sp,
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

  Widget filterContainer() {
    return Row(
      children: [
        Container(
          height: 32.h,
          width: 96.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    spreadRadius: 3.r,
                    blurRadius: 3.r,
                    color: Colors.grey.shade100),
              ],
              borderRadius: BorderRadius.circular(35.r),
              color: AppColor.whitecolor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppText(
                text: getLabel(filter),
                fontWeight: FontWeight.w500,
                color: AppColor.bluecolor,
                fontsize: 14.sp,
              ),
              Image.asset(
                '${AppImages.mycustomerimages}filter.png',
                height: 12.h,
              )
            ],
          ),
        ),
        sizeBoxWidth(11.w),
        Image.asset(
          '${AppImages.mycustomerimages}line.png',
          height: 30.h,
        ),
        sizeBoxWidth(11.w),
        Container(
          height: 32.h,
          width: 118.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35.r),
              color: AppColor.bluecolor),
          child: Center(
            child: AppText(
              text: '${getLabel(pending)}(2)',
              fontWeight: FontWeight.w500,
              color: AppColor.whitecolor,
              fontsize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget cutomerDetails() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: detailList.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 18.h),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return CustomerDetailScreen(customerId: "1",customerName: detailList[index].customername.toString(),offerName: detailList[index].offername.toString(),);
                  },
                ));
              },
              child: DottedBorder(
                  borderType: BorderType.RRect,
                  stackFit: StackFit.loose,
                  color: AppColor.graybordercolor,
                  radius: Radius.circular(35.r),
                  dashPattern: const [4],
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(35.r)),
                    child: Container(
                      // height: 380.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 3.r,
                                blurRadius: 3.r,
                                color: Colors.grey.shade100),
                          ],
                          borderRadius: BorderRadius.circular(35.r),
                          color: AppColor.whitecolor),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            customerProfile(detailList[index]),
                            sizeBoxHeight(18.h),
                            // customerStatus(),
                            sizeBoxHeight(18.h),
                            remindCustomerButton()
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          );
        });
  }

  Widget customerProfile(Details detailList) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: detailList.customername.toString(),
                fontWeight: FontWeight.w500,
                color: AppColor.blackcolor,
                fontsize: 14.sp,
              ),
              AppText(
                text: detailList.offername.toString(),
                fontWeight: FontWeight.w400,
                color: AppColor.graytext1color,
                fontsize: 10.5.sp,
              ),
            ],
          ),
        ),
        AppText(
          text: detailList.leadstatus.toString(),
          fontWeight: FontWeight.w500,
          color: AppColor.redColor,
          fontsize: 14.sp,
        ),
      ],
    );
  }

  Widget customerStatus() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 212.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                color: const Color(0xffF3F3F3)),
            child: Padding(
              padding: EdgeInsets.only(top: 17.h, right: 15.w, left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: getLabel(status),
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackcolor,
                    fontsize: 14.sp,
                  ),
                  sizeBoxHeight(5.h),
                  Row(
                    children: [
                      AppText(
                        text: 'Yet To Start',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffEDC233),
                        fontsize: 12.sp,
                      ),
                      sizeBoxWidth(10.w),
                      Image.asset(
                        '${AppImages.mycustomerimages}done.png',
                        height: 15.h,
                      ),
                    ],
                  ),
                  sizeBoxHeight(18.h),
                  DottedBorder(
                      borderType: BorderType.RRect,
                      stackFit: StackFit.loose,
                      color: AppColor.graybordercolor,
                      radius: Radius.circular(7.r),
                      dashPattern: const [2],
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(7.r)),
                          child: SizedBox(
                            height: 81.h,
                            width: 137.w,
                            child: Center(
                              child: AppText(
                                text:
                                    'Take frequent follow\nup to get\napplication\ncompeleted',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffDDAA00),
                                fontsize: 10.sp,
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ),
        ),
        sizeBoxWidth(10.w),
        Expanded(
          child: Container(
            height: 212.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                color: const Color(0xffF3F3F3)),
            child: Padding(
              padding: EdgeInsets.only(top: 17.h, right: 15.w, left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: getLabel(last_updated),
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackcolor,
                    fontsize: 14.sp,
                  ),
                  sizeBoxHeight(5.h),
                  AppText(
                    text: '19 October 2023',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff707070),
                    fontsize: 12.5.sp,
                  ),
                  sizeBoxHeight(15.h),
                  AppText(
                    text: getLabel(next_update),
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackcolor,
                    fontsize: 14.sp,
                  ),
                  sizeBoxHeight(5.h),
                  AppText(
                    text: '29 October 2023',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff707070),
                    fontsize: 12.5.sp,
                  ),
                  sizeBoxHeight(15.h),
                  DottedBorder(
                      borderType: BorderType.RRect,
                      stackFit: StackFit.loose,
                      color: const Color(0xffD43C3C),
                      radius: Radius.circular(7.r),
                      dashPattern: const [2],
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(7.r)),
                          child: SizedBox(
                            height: 52.h,
                            width: 137.w,
                            child: Center(
                              child: AppText(
                                text: 'Delayed By Brand By\n2 Day',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffD43C3C),
                                fontsize: 10.sp,
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget remindCustomerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 39.h,
          width: MediaQuery.sizeOf(context).height / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(53.r),
            color: const Color(0xff1775D3),
          ),
          child: Center(
            child: AppText(
              text: getLabel(remind_customer),
              fontsize: 13.5.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.whitecolor,
            ),
          ),
        )
      ],
    );
  }
}
