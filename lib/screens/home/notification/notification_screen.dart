import 'dart:convert';

import 'package:finjoy_app/api/notification/model/notifications_list.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/drawer/drawer_screen.dart';
import 'package:finjoy_app/screens/home/notification/help&support_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../api/const/config.dart';
import '../../../api/notification/bloc/get_notifications_list_bloc.dart';
import '../../../api/repository/repository.dart';
import '../../../utils/shared_pref.dart';
import '../../../widgets/custom_button.dart';
import 'package:http/http.dart' as http;

import 'local_notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool notificationVisiblity = true;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  
  final _repository = Repository();
  // NotificationsList getData = NotificationsList();
  
  @override
  void initState() {
    getNotificationsListBloc.getNotificationsListSink();
    super.initState();
    Noti.initialize(flutterLocalNotificationsPlugin);
    // setState(() {
    //   getMyCustomerList();
    // });
  }

  // Future<void> getMyCustomerList() async {
  //   getData = await _repository.onGetNotificationsListApi();
  //   print('notifications count ====>  ${getData.notifications!.length}');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.tabgraycolor,
      body: Column(
        children: [
          bgImage(),
        StreamBuilder<NotificationsList>(
    stream: getNotificationsListBloc.getNotificationsListStream,
    builder: (context,
    AsyncSnapshot<NotificationsList> getDataSnapshot) {
      if (!getDataSnapshot.hasData) {
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
          child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Visibility(
                          visible: !notificationVisiblity,
                          child: blankNotification()),
                      Visibility(
                          visible: notificationVisiblity,
                          child: notifacationList(getDataSnapshot)),
                      Visibility(
                        visible: !notificationVisiblity,
                        child: Column(
                          children: [
                            sizeBoxHeight(vDefaultPadding.h * 2),
                            appLogo(context),
                            sizeBoxHeight(vDefaultPadding * 2.h),
                          ],
                        ),
                      ),
                    ],
                  ))));
    })

        ],
      ),
      bottomNavigationBar: Visibility(
        visible: notificationVisiblity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            appLogo(context),
            sizeBoxHeight(vDefaultPadding * 2.h),
          ],
        ),
      ),
    );
  }

  Widget bgImage() {
    return Stack(
      children: [
        Image.asset(
          '${AppImages.notificationimages}bg.png',
          height: 103.h,
        ),
        backArrow(),
      ],
    );
  }

  Widget backArrow() {
    return Padding(
      padding: EdgeInsets.only(left: 17.w, top: 52.h, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                text: getLabel(notification),
                fontsize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.blacktextcolor,
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return const HelpAndSupportScreen();
                    },
                  ));
                },
                child: Image.asset('${AppImages.notificationimages}query.png',
                    height: 20.h),
              ),
              sizeBoxWidth(16.w),
              GestureDetector(
                onTap: () {
                  setState(() {
                    notificationVisiblity = !notificationVisiblity;
                  });
                },
                child: Image.asset('${AppImages.notificationimages}music.png',
                    height: 20.h),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget notifacationList(AsyncSnapshot<NotificationsList> getDataSnapshot) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: getDataSnapshot.data!.notifications!.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: vDefaultPadding.w,
                right: vDefaultPadding.w,
                bottom: vDefaultPadding.h),
            child: GestureDetector(
              onTap: () {
                Noti.showBigTextNotification(id: 0,title: "New message title", body: "Your long body", fln: flutterLocalNotificationsPlugin);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.whitecolor,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 3.r,
                        blurRadius: 3.r,
                        color: Colors.grey.shade100),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 18.h, bottom: 18.h),
                  child: Row(
                    children: [
                      Image.asset(
                        '${AppImages.notificationimages}noti.png',
                        height: 40.h,
                        width: 40.w,
                      ),
                      sizeBoxWidth(15.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: getDataSnapshot.data!.notifications![index].headings!.en!,
                              fontsize: 14.5.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.darktextcolor,
                            ),
                            AppText(
                              text: getDataSnapshot.data!.notifications![index].contents!.en!,
                              fontsize: 10.62.sp,
                              fontWeight: FontWeight.w400,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              color: AppColor.graytext1color,
                            ),
                          ],
                        ),
                      ),
                      sizeBoxWidth(15.w),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColor.darkarrowcolor,
                        size: 15.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget blankNotification() {
    return Image.asset('${AppImages.notificationimages}blank.png');
  }
}
