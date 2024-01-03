import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../api/repository/repository.dart';
import '../../../api/training/model/training_live_list_model.dart';
import '../../../api/training/bloc/get_training_live_data_bloc.dart';

class LiveTab extends StatefulWidget {
  const LiveTab({super.key});

  @override
  State<LiveTab> createState() => _LiveTabState();
}

class _LiveTabState extends State<LiveTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<Data> _searchResult = [];
  List<Data> displayData = [];

  bool isLoading = true;

  final _repository = Repository();
  TrainingLiveListModel getData = TrainingLiveListModel();

  @override
  void initState() {
    // getTrainingLiveDataBloc.getTrainingLiveDataSink();
    getTrainingLiveData();
    super.initState();
  }

  Future<void> getTrainingLiveData() async {
    isLoading = true;
    getData = await _repository.onGetTrainingLiveData();
    if (getData.success!) {
      setState(() {
        displayData = getData.data!;
      });
    } else {
      setState(() {
        displayData.clear();
      });
    }
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(child: CircularProgressIndicator()),
    ) : displayData.isEmpty ? SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(child: AppText(
        text: getLabel(no_data_found),
        color: AppColor.blackcolor,
        fontsize: 16,
      )),
    ) : Column(
      children: [
        searchTextfiled(),
        sizeBoxHeight(15.h),
        Expanded(
            child: Container(
              color: AppColor.tabgraycolor,
              padding: const EdgeInsets.only(top: 10),
              child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                      child: Column(
                        children: [
                          coursesDetails(),
                          sizeBoxHeight(30.h),
                        ],
                      ))),
            )),
      ],
    );
  }

  Widget searchTextfiled() {
    return Padding(
      padding: EdgeInsets.only(
          top: 15.h, right: vDefaultPadding.w, left: vDefaultPadding.w),
      child: AppSearchTextFormField(
        textInputAction: TextInputAction.done,
        onChanged: onSearchTextChanged,
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

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var trainingData in displayData) {
      if (trainingData.coursename!.toLowerCase().contains(text.toLowerCase()) ||
          trainingData.description!
              .toLowerCase()
              .contains(text.toLowerCase())) {
        setState(() {
          _searchResult.add(trainingData);
        });
      }
    }

    setState(() {});
  }

  Widget coursesDetails() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: displayData.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(bottom: 18.h),
              child: Padding(
                padding: EdgeInsets.only(
                    right: vDefaultPadding.w, left: vDefaultPadding.w),
                child: Container(
                  height: 231.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.r),
                      color: AppColor.whitecolor,
                      border: Border.all(color: Colors.grey.shade200)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 14.h, bottom: 14.h, right: 13.w, left: 13.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.network(
                              displayData[index].thumbnail?.toString() ?? ''),
                        ),
                        // Image.asset('${AppImages.trainingimages}finjoy.png'),
                        sizeBoxWidth(8.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: displayData[index].coursename.toString(),
                                fontWeight: FontWeight.bold,
                                color: AppColor.blacktextcolor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                fontsize: 10,
                              ),
                              sizeBoxHeight(5.h),
                              AppText(
                                text: displayData[index].description.toString(),
                                fontWeight: FontWeight.w400,
                                color: AppColor.graytext1color,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                fontsize: 9,
                              ),
                              sizeBoxHeight(5),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              '${AppImages.trainingimages}live.png',
                                              height: 13,
                                            ),
                                            sizeBoxWidth(8.w),
                                            AppText(
                                              text: getLabel(live),
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffDD1B1B),
                                              fontsize: 9,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: vDefaultSize.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      '${AppImages.creditcardimages}coin.png',
                                                      height: 13),
                                                  sizeBoxWidth(8.w),
                                                  AppText(
                                                    text:
                                                        '${displayData[index].fincoinrewards.toString()} coins',
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColor.orangecolor,
                                                    fontsize: 9,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    sizeBoxHeight(7),
                                    Row(
                                      children: [
                                        Image.asset(
                                          '${AppImages.trainingimages}halfcircle.png',
                                          height: 13,
                                        ),
                                        sizeBoxWidth(5),
                                        AppText(
                                          text: '${displayData[index].noofusers.toString()}+ ',
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.blacktextcolor,
                                          fontsize: 9,
                                        ),
                                        Expanded(
                                          child: AppText(
                                            text: getLabel(currently_joined),
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.blackcolor,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            fontsize: 9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              sizeBoxHeight(5),
                              Container(
                                height: 27,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.bluecolor),
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                                child: Center(
                                  child: AppText(
                                    text: getLabel(register),
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.bluecolor,
                                    fontsize: 10,
                                  ),
                                ),
                              ),
                              sizeBoxHeight(5.h),
                              Container(
                                height: 27,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xff1775D3),
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                                child: Center(
                                  child: AppText(
                                    text: getLabel(share_with_customer),
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.whitecolor,
                                    fontsize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

}
