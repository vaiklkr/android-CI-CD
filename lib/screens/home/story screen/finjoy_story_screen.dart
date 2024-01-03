import 'package:finjoy_app/api/finjoy%20story/bloc/get_fj_stories_bloc.dart';
import 'package:finjoy_app/api/finjoy%20story/model/get_fj_stories_model.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_image.dart';
import '../../../core/app_text.dart';
import '../../../utils/share_utils.dart';
import '../../../widgets/storyView/flutter_story_view.dart';
import '../../../widgets/storyView/models/story_item.dart';
// import '../../../widgets/storyView/widgets/story_view.dart';

class FinjoyStoryScreen extends StatefulWidget {
  const FinjoyStoryScreen({super.key});

  @override
  State<FinjoyStoryScreen> createState() => _FinjoyStoryScreenState();
}

class _FinjoyStoryScreenState extends State<FinjoyStoryScreen> {

  int index = 0;

  @override
  void initState() {
    getFJStoriesBloc.getFJStoriesSink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<GetFJStoriesModel>(
          stream: getFJStoriesBloc.getFJStoriesStream,
          builder: (context,
              AsyncSnapshot<GetFJStoriesModel> getFinancialDashboardsnapshot) {
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
            List<StoryItem> storyItems =
                getFinancialDashboardsnapshot.data?.data?.map((story) {
                      return StoryItem(
                        url: story.storyUrl ?? '',
                        btnText: story.buttontext.toString(),
                        shareContent: '${story.sharecontent}\n${story.shareurl}',
                        type: StoryItemType.image,
                      );
                    }).toList() ??
                    [];

            return Stack(
              alignment: Alignment.bottomLeft,
              children: [
                FlutterStoryView(
                    storyItems: storyItems,
                    onComplete: () {
                      print("Completed");
                      Navigator.pop(context);
                    },
                    onPageChanged: (index) {
                      print("currentPageIndex = ${getFinancialDashboardsnapshot.data!.data![index].buttontext.toString()}");
                      // setState(() {
                        this.index = index;
                      // });
                    },
                    caption: "This is very beautiful STORY",
                    createdAt: DateTime.now(),
                    enableOnHoldHide: false,
                    indicatorColor: Colors.grey[500],
                    indicatorHeight: 2,
                    indicatorValueColor: Colors.white,
                    ),
              ],
            );
          }),
    );
  }

}
