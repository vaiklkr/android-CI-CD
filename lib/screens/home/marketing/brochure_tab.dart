// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:finjoy_app/api/marketing/model/get_marketing_data_model.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/widgets/custom_image_view.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../../api/appLabel/app_label_service.dart';

List helthNameList = [
  'Health',
  'Life/Term',
  'Personal Loan',
  'Financing',
];

List helthImageList = [
  '${AppImages.marketingimages}hdfc.png',
  '${AppImages.marketingimages}icici.png',
  '${AppImages.marketingimages}axis.png',
  '${AppImages.marketingimages}hdfc.png',
  '${AppImages.marketingimages}icici.png',
  '${AppImages.marketingimages}axis.png',
];

List loanImageList = [
  '${AppImages.marketingimages}icici.png',
  '${AppImages.marketingimages}hdfc.png',
  '${AppImages.marketingimages}axis.png',
  '${AppImages.marketingimages}hdfc.png',
  '${AppImages.marketingimages}icici.png',
  '${AppImages.marketingimages}axis.png',
];

class BrochureTab extends StatefulWidget {
  const BrochureTab({super.key, this.brochureData});

  final GetMarketingDataModel? brochureData;
  @override
  State<BrochureTab> createState() => _BrochureTabState();
}

class _BrochureTabState extends State<BrochureTab> {
  int? currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchTextfiled(),
        sizeBoxHeight(20.h),
        roundedRectBorderWidget(widget.brochureData?.data),
        sizeBoxHeight(15.h),
        Expanded(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Container(
              padding: const EdgeInsets.only(top: vDefaultPadding),
              color: AppColor.tabgraycolor,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: widget
                      .brochureData?.data?.brochures?.categorydata?.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        helthText(
                            widget.brochureData?.data?.brochures?.categorydata,
                            index),
                        sizeBoxHeight(22.h),
                        helthList(widget.brochureData?.data?.brochures
                            ?.categorydata?[index].items),
                        sizeBoxHeight(30.h),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }

  Widget searchTextfiled() {
    return Padding(
      padding: EdgeInsets.only(
          top: 15.h, right: vDefaultPadding.w, left: vDefaultPadding.w),
      child: AppSearchTextFormField(
        textInputAction: TextInputAction.done,
        suffixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              '${AppImages.creditcardimages}search.png',
              height: 35.h,
            )),
        label: '${getLabel(search_by_name)}, ${getLabel(type)}',
        hint: '',
      ),
    );
  }

  Widget roundedRectBorderWidget(Data? brochureData) {
    return Padding(
      padding: EdgeInsets.only(left: vDefaultPadding.w),
      child: SizedBox(
        height: 38.h,
        child: ListView.builder(
            itemCount: brochureData?.brochures?.filters?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
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
                            text: brochureData!.brochures!.filters![index],
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
      ),
    );
  }

  Widget helthText(List<Categorydata>? categorydata, int index) {
    return Padding(
      padding:
          EdgeInsets.only(left: vDefaultPadding.w, right: vDefaultPadding.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: categorydata![index].categoryname.toString(),
            fontWeight: FontWeight.w500,
            color: AppColor.blackcolor,
            fontsize: 16.sp,
          ),
          AppText(
            text: getLabel(see_all),
            fontWeight: FontWeight.w400,
            color: AppColor.blackcolor,
            fontsize: 13.sp,
          ),
        ],
      ),
    );
  }

  Widget helthList(List<Items>? items) {
    List<Items>? displayedItems = items?.take(4).toList();
    return Padding(
      padding: EdgeInsets.only(left: vDefaultPadding.w),
      child: SizedBox(
        height: 130.h,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView.builder(
            itemCount: displayedItems?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  openPdf(displayedItems[index].fileurl ?? '');
                },
                child: Padding(
                  padding: EdgeInsets.only(right: vDefaultPadding.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CustomImageView(
                        imagePath: displayedItems![index].logourl.toString(),
                        height: 100.h,
                        width: 130.w,
                        fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void openPdf(String fileUrl) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String fileName = fileUrl.split("/").last;
    String localFilePath = '$appDocPath/$fileName';
    bool fileExists = await File(localFilePath).exists();
    if (!fileExists) {
      final response = await http.get(Uri.parse(fileUrl));
      if (response.statusCode == 200) {
        await File(localFilePath)
            .writeAsBytes(Uint8List.fromList(response.bodyBytes));
      } else {
        return;
      }
    }

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(47.r),
          topLeft: Radius.circular(47.r),
        ),
      ),
      builder: (context) {
        return PDFView(
          filePath: localFilePath,
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: false,
          pageFling: true,
          pageSnap: false,
          fitPolicy: FitPolicy.BOTH,
        );
      },
    );
  }
}
