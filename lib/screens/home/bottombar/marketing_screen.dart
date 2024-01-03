import 'package:finjoy_app/api/marketing/bloc/get_marketing_data_bloc.dart';
import 'package:finjoy_app/api/marketing/model/get_marketing_data_model.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/marketing/brochure_tab.dart';
import 'package:finjoy_app/screens/home/marketing/poster_tab.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/appLabel/app_label_service.dart';

class MarketingScreen extends StatefulWidget {
  const MarketingScreen({super.key});

  @override
  State<MarketingScreen> createState() => _MarketingScreenState();
}

class _MarketingScreenState extends State<MarketingScreen> {
  @override
  void initState() {
    getMarketingDataBloc.getMarketingDataSink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [const HomeCustomAppbar(), marketingDetails()]));
  }

  Widget marketingDetails() {
    return DefaultTabController(
      length: 2,
      child: Container(
        margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
        decoration: BoxDecoration(
            color: AppColor.whitecolor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            marketingHeader(),
            sizeBoxHeight(12.h),
            tabBar(),
          ],
        ),
      ),
    );
  }

  Widget marketingHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 15.w, left: 15.w),
      child: Row(
        children: [
          AppText(
            text: '${getLabel(marketing)} ',
            fontsize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.blacktextcolor,
          ),
        ],
      ),
    );
  }

  Widget tabBar() {
    return StreamBuilder<GetMarketingDataModel>(
        stream: getMarketingDataBloc.getMarketingDataStream,
        builder: (context,
            AsyncSnapshot<GetMarketingDataModel> getMarketingDatasnapshot) {
          if (!getMarketingDatasnapshot.hasData) {
            return Container(
              height: MediaQuery.of(context).size.height / 2.h,
              color: AppColor.whitecolor,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColor.bluecolor,
                ),
              ),
            );
          }
          return Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w),
                  child: Container(
                    height: 58.h,
                    decoration: BoxDecoration(
                        color: AppColor.tabgraycolor,
                        borderRadius: BorderRadius.circular(100.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: TabBar(
                        indicator: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 3.r,
                                blurRadius: 3.r,
                                color: Colors.grey.shade200)
                          ],
                          borderRadius: BorderRadius.circular(42.r),
                          color: AppColor.whitecolor,
                        ),
                        labelPadding: EdgeInsets.zero,
                        labelColor: AppColor.bluecolor,
                        labelStyle: GoogleFonts.poppins(
                            color: AppColor.bluecolor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                        unselectedLabelColor: AppColor.graycolor,
                        tabs: [
                          Tab(text: getLabel(poster)),
                          Tab(text: getLabel(brochures)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      PosterTab(posterData: getMarketingDatasnapshot.data),
                      BrochureTab(brochureData: getMarketingDatasnapshot.data),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
