import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:finjoy_app/api/marketing/model/get_marketing_data_model.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/notification/lead_related_screen.dart';
import 'package:finjoy_app/screens/home/shareDetail/share_detail_screen.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_image_view.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../../api/appLabel/app_label_service.dart';

class PosterTab extends StatefulWidget {
  const PosterTab({super.key, required this.posterData});

  final GetMarketingDataModel? posterData;
  @override
  State<PosterTab> createState() => _PosterTabState();
}

class _PosterTabState extends State<PosterTab> {
  List<Items> categoryList = [];
  int selectedFilterIndex = -1;
  bool sellAllVisible = false;
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchTextfiled(),
        sizeBoxHeight(20.h),
        roundedRectBorderWidget(widget.posterData?.data),
        sizeBoxHeight(15.h),
        Expanded(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Container(
              padding: const EdgeInsets.only(top: vDefaultPadding),
              color: AppColor.tabgraycolor,
              child: SingleChildScrollView(
                  child: categoryList.isEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: widget
                              .posterData?.data?.posters?.categorydata?.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                grettingText(
                                    widget.posterData?.data?.posters
                                        ?.categorydata,
                                    index),
                                sizeBoxHeight(22.h),
                                greetingList(widget.posterData?.data?.posters
                                    ?.categorydata?[index].items),
                                sizeBoxHeight(30.h),
                              ],
                            );
                          })
                      : allGridview(categoryList)),
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

  Widget roundedRectBorderWidget(Data? posterData) {
    return Padding(
      padding: EdgeInsets.only(left: vDefaultPadding.w),
      child: SizedBox(
        height: 38.h,
        child: ListView.builder(
            itemCount: posterData?.posters?.filters?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  selectedFilterIndex = index;
                  categoryList.clear();
                  for (var v = 0;
                      v <
                          posterData
                              .posters!.categorydata![index].items!.length;
                      v++) {
                    categoryList.add(
                        posterData.posters!.categorydata![index].items![v]);
                  }
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    stackFit: StackFit.loose,
                    color: selectedFilterIndex == index
                        ? AppColor.whitecolor
                        : AppColor.graybordercolor,
                    radius: Radius.circular(17.r),
                    dashPattern: const [4],
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(17.r)),
                      child: Container(
                        height: 32.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.r),
                          color: selectedFilterIndex == index
                              ? AppColor.bluecolor
                              : AppColor.grayboxcolor,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: AppText(
                              text: posterData!.posters!.filters![index],
                              fontWeight: FontWeight.w500,
                              color: selectedFilterIndex == index
                                  ? AppColor.whitecolor
                                  : AppColor.blacktextcolor,
                              fontsize: 14.sp,
                            ),
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

  Widget grettingText(List<Categorydata>? categorydata, int index) {
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
          GestureDetector(
            onTap: () {
              for (var v = 0; v < categorydata[index].items!.length; v++) {
                categoryList.add(categorydata[index].items![v]);
              }
              setState(() {});
            },
            child: AppText(
              text: getLabel(see_all),
              fontWeight: FontWeight.w400,
              color: AppColor.blackcolor,
              fontsize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget greetingList(List<Items>? items) {
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
                    showModalBottomSheet(
                      elevation: 0,
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return Wrap(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: vDefaultPadding * 2),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: CustomImageView(
                                          imagePath: displayedItems[index]
                                              .fileurl
                                              .toString(),
                                          height: 400.h,
                                          width: 400.w,
                                          fit: BoxFit.fill)),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.whitecolor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(47.r),
                                            topRight: Radius.circular(47.r))),
                                    child: bottomSheetDetails(
                                        displayedItems, index),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: vDefaultPadding.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: CustomImageView(
                          imagePath: displayedItems![index].fileurl.toString(),
                          height: 100.h,
                          width: 130.w,
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }

  Widget allGridview(List<Items> categorydata) {
    return Padding(
      padding: const EdgeInsets.only(
          left: vDefaultPadding,
          right: vDefaultPadding,
          bottom: vDefaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: categorydata[0].categoryname.toString(),
            fontWeight: FontWeight.w500,
            color: AppColor.blackcolor,
            fontsize: 16.sp,
          ),
          sizeBoxHeight(22.h),
          GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.8,
              children: List.generate(categorydata.length, (index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CustomImageView(
                      imagePath: categorydata[index].fileurl.toString(),
                      fit: BoxFit.cover),
                );
              })),
        ],
      ),
    );
  }

  Widget bottomSheetDetails(List<Items> displayedItems, int index) {
    return Column(
      children: [
        sizeBoxHeight(3.h),
        Container(
          height: 5.h,
          width: 50.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: AppColor.graybordercolor),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 25.h, right: 28.w, left: 28.w, bottom: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: displayedItems[index].title ?? '',
                fontWeight: FontWeight.w500,
                color: AppColor.blackcolor,
                fontsize: 16.sp,
              ),
              displayedItems[index].logourl!.isEmpty ||
                      displayedItems[index].logourl == null
                  ? const SizedBox.shrink()
                  : Column(
                      children: [
                        sizeBoxHeight(20.h),
                        CustomImageView(
                          imagePath: displayedItems[index].logourl,
                          height: 30.h,
                        ),
                        sizeBoxHeight(10.h),
                      ],
                    ),
              sizeBoxHeight(10.h),
              dottedLine(),
              sizeBoxHeight(10.h),
              AppText(
                text: PrefObj.preferences!.get(PrefKeys.FullName).toString(),
                fontWeight: FontWeight.w500,
                color: AppColor.blackcolor,
                fontsize: 16.sp,
              ),
              AppText(
                text: getLabel(certified_financial_expert),
                fontWeight: FontWeight.w400,
                color: AppColor.blackcolor,
                fontsize: 12.sp,
              ),
              Image.asset('${AppImages.selectlanguageimages}logo.png',
                  height: 13.h),
              sizeBoxHeight(30.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return ShareDetailsScreen(
                          imageUrl: displayedItems[index].fileurl.toString(),
                          shareContent:
                              displayedItems[index].sharecontent.toString(),
                          shareUrl: displayedItems[index].shareurl.toString());
                    },
                  ));
                },
                child: Container(
                  height: 37.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      border: Border.all(color: const Color(0xff0CCD27))),
                  child: Center(
                    child: AppText(
                      text: getLabel(share_on_whatsapp),
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff0CCD27),
                      fontsize: 13.sp,
                    ),
                  ),
                ),
              ),
              sizeBoxHeight(9.h),
              Container(
                height: 37.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: const Color(0xff1775D3)),
                child: Center(
                  child: AppText(
                    text: getLabel(share_with_customer),
                    fontWeight: FontWeight.w600,
                    color: AppColor.whitecolor,
                    fontsize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
