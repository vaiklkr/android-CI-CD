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
import '../../../api/training/bloc/get_training_course_data_bloc.dart';
import '../../../api/training/model/training_course_list_model.dart';

class CoursesTab extends StatefulWidget {
  const CoursesTab({super.key});
  @override
  State<CoursesTab> createState() => _CoursesTabState();
}

class _CoursesTabState extends State<CoursesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final List<Data> _searchResult = [];
  List<Data> displayData = [];

  bool isLoading = true;

  final _repository = Repository();
  TrainingCourseListModel getData = TrainingCourseListModel();

  @override
  void initState() {
    // getTrainingCourseDataBloc.getTrainingCourseDataSink();
    getTrainingCourseData();
    super.initState();
  }

  Future<void> getTrainingCourseData() async {
    isLoading = true;
    getData = await _repository.onGetTrainingCourseData();
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
    // return StreamBuilder<TrainingCourseListModel>(
    //     stream: getTrainingCourseDataBloc.getTrainingCourseListStream,
    //     builder: (context,
    //         AsyncSnapshot<TrainingCourseListModel> getTrainingDataSnapshot) {
    //       if (!getTrainingDataSnapshot.hasData) {
    //         return Container(
    //           color: AppColor.whitecolor,
    //           child: const Center(
    //             child: CircularProgressIndicator(
    //               color: AppColor.bluecolor,
    //             ),
    //           ),
    //         );
    //       }
    //       displayData = _searchResult.isNotEmpty
    //           ? _searchResult
    //           : getTrainingDataSnapshot.data!.data!;
    //       return ;
    //     });
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
      if (trainingData.courseName!.toLowerCase().contains(text.toLowerCase()) ||
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
                                text: displayData[index].courseName.toString(),
                                fontWeight: FontWeight.bold,
                                color: AppColor.blacktextcolor,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                fontsize: 11,
                              ),
                              sizeBoxHeight(5.h),
                              AppText(
                                text: displayData[index].description.toString(),
                                fontWeight: FontWeight.w400,
                                color: AppColor.graytext1color,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                fontsize: 10,
                              ),
                              sizeBoxHeight(5),
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset(
                                        '${AppImages.creditcardimages}coin.png',
                                        height: 15),
                                    sizeBoxWidth(8.w),
                                    AppText(
                                      text:
                                          '${displayData[index].fincoinRewards.toString()} coins',
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.orangecolor,
                                      fontsize: 12,
                                    ),
                                  ],
                                ),
                              ),
                              sizeBoxHeight(12.h),
                              Container(
                                height: 30,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.bluecolor),
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                                child: Center(
                                  child: AppText(
                                    text: getLabel(view_course),
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.bluecolor,
                                    fontsize: 10,
                                  ),
                                ),
                              ),
                              sizeBoxHeight(5.h),
                              Container(
                                height: 30,
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
