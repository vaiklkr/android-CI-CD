// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/utils/share_utils.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../api/creditcard/model/get_financial_offerlist_model.dart';

class ShareContentTab extends StatefulWidget {
  const ShareContentTab({super.key});

  @override
  State<ShareContentTab> createState() => _ShareContentTabState();
}

class _ShareContentTabState extends State<ShareContentTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late YoutubePlayerController videoController;
  String? videoId;

  List<String> photosList = [
    "https://finjoyapp.com/appdata/offerimages/ob1.png",
    "https://finjoyapp.com/appdata/offerimages/ob2.png",
    "https://finjoyapp.com/appdata/offerimages/ob3.png"
  ];

  List<String> videosList = [
    "https://youtu.be/oCNvOyYacXQ?si=nbhQ0lS-en6v19rv",
    "https://youtu.be/6EHQzayBqwo?si=NbXMHhlBI0QIFp7P",
    "https://youtu.be/Q0VGRlEJewA?si=KWJbvUrysRRFz4DJ"
  ];

  List<String> broucherList = [
    "https://youtu.be/oCNvOyYacXQ?si=nbhQ0lS-en6v19rv",
    "https://youtu.be/6EHQzayBqwo?si=NbXMHhlBI0QIFp7P",
    "https://youtu.be/Q0VGRlEJewA?si=KWJbvUrysRRFz4DJ"
  ];

  Creatives getData = Creatives();

  @override
  void initState() {
    super.initState();
    setState(() {
      // photos.add();
      // photos.add();
      // photos.add();
      // getFinancialOfferDetail();
    });
  }

  Future<void> getFinancialOfferDetail() async {
    try {
      String jsonString =
          PrefObj.preferences?.get(PrefKeys.OfferFullJson) ?? "";
      Map<String, dynamic> jsonData = jsonDecode(jsonString);
      if (jsonData.isNotEmpty) {
        Map<String, dynamic> firstOfferData = jsonData;
        setState(() {
          getData = Creatives.fromJson(firstOfferData);
        });
      }
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        color: AppColor.tabgraycolor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // if (getData.photos != null)
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: AppText(
                          text: getLabel(photos),
                          fontsize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackcolor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 190,
                      child: ListView.builder(
                        itemCount: photosList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              width: 130,
                              decoration: BoxDecoration(
                                color: AppColor.whitecolor,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 3.r,
                                    blurRadius: 3.r,
                                    color: Colors.grey.shade100,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.r),
                                        topRight: Radius.circular(10.r)),
                                    child: Image.network(
                                      photosList[index],
                                      height: 130,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  shareButtons(false, photosList[index].toString()),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    sizeBoxHeight(10)
                  ],
                ),

                // if (getData.videos != null)
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: AppText(
                          text: getLabel(videos),
                          fontsize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackcolor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 210,
                      child: ListView.builder(
                        itemCount: videosList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          videoId = YoutubePlayer.convertUrlToId(
                              videosList[index].toString());
                          videoController = YoutubePlayerController(
                            initialVideoId: videoId.toString(),
                            flags: const YoutubePlayerFlags(
                              mute: false,
                              autoPlay: false,
                              disableDragSeek: true,
                              loop: false,
                              isLive: false,
                              forceHD: false,
                              enableCaption: true,
                              showLiveFullscreenButton: false,
                            ),
                          );
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              width: 250,
                              decoration: BoxDecoration(
                                color: AppColor.whitecolor,
                                borderRadius: BorderRadius.circular(15.r),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 10.r,
                                    blurRadius: 10.r,
                                    color: Colors.grey.shade100,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.r),
                                          topRight: Radius.circular(15.r)),
                                      child: YoutubePlayer(

                                        width: double.infinity,
                                        controller: videoController,
                                        bottomActions: [
                                          CurrentPosition(),
                                          ProgressBar(isExpanded: true),
                                          RemainingDuration(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  shareButtons(true, videosList[index].toString()),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    sizeBoxHeight(10)
                  ],
                ),

                // if (getData.brochures != null)
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: AppText(
                          text: getLabel(brochures),
                          fontsize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackcolor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        itemCount: photosList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              width: 110,
                              decoration: BoxDecoration(
                                color: AppColor.whitecolor,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 3.r,
                                    blurRadius: 3.r,
                                    color: Colors.grey.shade100,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 70,
                                    width: double.infinity,
                                    child: Center(
                                      child: Image.asset(
                                        '${AppImages.creditcardimages}pdf_logo.png',
                                        height: 40,
                                        width: 40,
                                        color: Colors.red.shade400,
                                      ),
                                    ),
                                  ),
                                  shareButtons(true, videosList[index].toString()),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    sizeBoxHeight(10)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget shareButtons(bool isVideo, String url) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  ShareUtils.shareOnWhatsApp(url, url);
                  // ShareUtils.shareFileWithText(
                  //     context: context,
                  //     imageUrl: isVideo ? '' : url,
                  //     shareContent: !isVideo ? '' : url);
                },
                child: Image.asset(
                  '${AppImages.referAndEarnImages}whatsapp_icon.png',
                  height: 23,
                  width: 23,
                )),
            Image.asset(
              '${AppImages.creditcardimages}devider_line.png',
              height: 30,
              width: 4,
            ),
            GestureDetector(
              onTap: () {
                ShareUtils.shareFileWithText(
                    context: context,
                    imageUrl: isVideo ? '' : url,
                    shareContent: !isVideo ? '' : url);
              },
              child: Image.asset(
                '${AppImages.websiteImages}share.png',
                height: 23,
                width: 23,
              ),
            )
          ],
        ),
      ),
    );
  }
}
