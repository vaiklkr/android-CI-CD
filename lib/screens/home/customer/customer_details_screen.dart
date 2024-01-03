import 'package:dotted_line/dotted_line.dart';
import 'package:finjoy_app/api/my%20customers/bloc/customer_detail_bloc.dart';
import 'package:finjoy_app/api/my%20customers/model/customer_detail_model.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../const/behaviour.dart';

class CustomerDetailScreen extends StatefulWidget {
  String customerId;
  String customerName;
  String offerName;

  CustomerDetailScreen(
      {super.key,
      required this.customerId,
      required this.customerName,
      required this.offerName});

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  @override
  void initState() {
    getCustomerDetailBloc.getCustomerDetailSink("1");
    super.initState();
  }

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
            padding: EdgeInsets.only(top: 5.h, right: 20.w, left: 20.w),
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
                      detail(),
                    ],
                  ),
                ))),
          )),
        ],
      ),
    );
  }

  Widget detail() {
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
                  StreamBuilder<CustomerDetailModel>(
                      stream: getCustomerDetailBloc.getCustomerDetailStream,
                      builder: (context,
                          AsyncSnapshot<CustomerDetailModel> getDataSnapshot) {
                        if (!getDataSnapshot.hasData) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColor.bluecolor,
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText(
                                text: widget.customerName,
                                color: Colors.black,
                                fontsize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: widget.offerName,
                                color: AppColor.textgraycolor,
                                fontsize: 13,
                              ),
                              sizeBoxHeight(15),
                              dottedDivider(),
                              sizeBoxHeight(15),
                              AppText(
                                text: getLabel(contact_details),
                                color: AppColor.textfieldtextcolor,
                                fontWeight: FontWeight.w600,
                                fontsize: 15,
                              ),
                              sizeBoxHeight(10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          '${AppImages.customerIcons}email_image.png',
                                          height: 25,
                                          width: 25,
                                        ),
                                        sizeBoxWidth(10),
                                        Expanded(
                                          child: AppText(
                                            text: getDataSnapshot
                                                .data!.data!.emailid
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColor.blacktextcolor,
                                            fontsize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  sizeBoxWidth(10),
                                  Row(
                                    children: [
                                      Image.asset(
                                        '${AppImages.customerIcons}phone_image.png',
                                        height: 25,
                                        width: 25,
                                      ),
                                      sizeBoxWidth(10),
                                      AppText(
                                        text: getDataSnapshot
                                            .data!.data!.mobilenumber
                                            .toString(),
                                        color: AppColor.blacktextcolor,
                                        fontsize: 15,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              sizeBoxHeight(15),
                              dottedDivider(),
                              sizeBoxHeight(15),
                              AppText(
                                text: getLabel(status),
                                color: AppColor.textfieldtextcolor,
                                fontWeight: FontWeight.w600,
                                fontsize: 15,
                              ),
                              sizeBoxHeight(10),
                              statusList(getDataSnapshot),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statusList(AsyncSnapshot<CustomerDetailModel> getDataSnapshot) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: getDataSnapshot.data!.data!.leadStatuse!.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return statusListItems(getDataSnapshot, index);
        });
  }

  Widget statusListItems(
      AsyncSnapshot<CustomerDetailModel> getDataSnapshot, index) {
    return SizedBox(
      height: 70,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizeBoxWidth(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dottedVerticalDivider(),
                Image.asset(
                  getStatusImage(getDataSnapshot
                      .data!.data!.leadStatuse![index].status
                      .toString()),
                  height: 20,
                  width: 20,
                ),
                Dash(
                    direction: Axis.vertical,
                    length: 25,
                    dashLength: 1.5,
                    dashColor:
                        getDataSnapshot.data!.data!.leadStatuse!.length - 1 !=
                                index
                            ? AppColor.graycolor
                            : Colors.transparent),
              ],
            ),
            sizeBoxWidth(15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: getDataSnapshot
                          .data!.data!.leadStatuse![index].details
                          .toString(),
                      color: AppColor.textfieldtextcolor,
                      fontWeight: FontWeight.w600,
                      fontsize: 15,
                    ),
                    sizeBoxHeight(5),
                    AppText(
                      text: getDataSnapshot
                          .data!.data!.leadStatuse![index].updateddate
                          .toString(),
                      color: AppColor.textgraycolor,
                      fontWeight: FontWeight.w300,
                      fontsize: 14,
                    ),
                  ],
                ),
              ),
            ),
            sizeBoxWidth(15),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 15.w, left: 15.w),
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
            text: getLabel(customer_details),
            fontsize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.blacktextcolor,
          ),
        ],
      ),
    );
  }

  String getStatusImage(String status) {
    switch (status) {
      case 'In Progress':
        return '${AppImages.customerIcons}status_in_review.png';
      case 'Delayed':
        return '${AppImages.customerIcons}status_delay.png';
      case 'Pending from Customer':
        return '${AppImages.customerIcons}status_in_review.png';
      case 'Completed':
        return '${AppImages.customerIcons}status_success.png';
      case 'Rejected':
        return '${AppImages.customerIcons}status_rejected.png';
      case 'Expired':
        return '${AppImages.customerIcons}status_expired.png';
      default:
        return '${AppImages.customerIcons}status_in_review.png';
    }
  }

  Widget dottedDivider() {
    return DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 1.5,
      dashLength: 4.0,
      dashColor: Colors.grey.shade300,
      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 0.0,
    );
  }

  Widget dottedVerticalDivider() {
    return const Dash(
        direction: Axis.vertical,
        length: 25,
        dashLength: 1.5,
        dashColor: AppColor.graycolor);
  }
}
