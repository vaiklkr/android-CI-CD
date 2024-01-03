// ignore_for_file: non_constant_identifier_names, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/utils/share_utils.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../api/creditcard/model/get_financial_offerlist_model.dart';
import '../../../api/repository/repository.dart';

import '../../../widgets/custom_dashed_card.dart';
import 'add_customer_screen.dart';
import 'benefits_contents.dart';

List detailsList = [
  'Access to golf courses worldwide & 12 free lessons/\nyear*',
  'Free 1 night stay* & dining benefits at selected places\nglobally*',
  'HFree memberships to loyalty programs, Hotel Lux &\nmany more*',
  '12% discount on worldwide hotel booking on Agoda*',
  '10% Cashback on Swiggy Spends (up to 1500)',
  '5% Cashback on Online spends (up to 1500)',
  'Free 3 month Swiggy One membership worth 1199*',
];

class DetailsTab extends StatefulWidget {
  const DetailsTab({super.key});

  @override
  State<DetailsTab> createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final CarouselController _controller = CarouselController();
  late int current = 0;
  final _repository = Repository();

  late GetFinancialOfferlistModel getData;

  int _currentPage = 0;
  final List<BenefitsContents> benefitsList = [];

  late YoutubePlayerController videoController;

  String? videoId;
  List<String> bannerUrls = [];

  int index = 0;

  @override
  void initState() {
    super.initState();
    getFinancialOfferDetail();
  }

  @override
  void deactivate() {
    videoController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  Future<void> getFinancialOfferDetail() async {
    try {
      getData = GetFinancialOfferlistModel();
      String? OfferId = PrefObj.preferences?.get(PrefKeys.OfferId);
      final result = await _repository.onGetFinancialOfferDetail(OfferId!);
      if (result != null) {
        setState(() {
          getData = result;

          PrefObj.preferences!.put(PrefKeys.OfferTitle,
              getData.data!.offerdata![index].offername.toString());
          bannerUrls = getData.data!.offerdata![index].creatives!.banners!;

          setState(() {
            PrefObj.preferences!.put(
                PrefKeys.OfferFullJson,
                jsonEncode(
                    getData.data!.offerdata![index].creatives?.toJson()));
          });

          if (getData.data!.offerdata?[index].benefitsLabel != null) {
            benefitsList.add(BenefitsContents(
                isVideo: false,
                text: getData.data!.offerdata![index].benefitsLabel.toString(),
                content:
                    getData.data!.offerdata![index].benefitsContent.toString(),
                video: ""));
          }
          if (getData.data!.offerdata![index].whomtesellLabel != null) {
            benefitsList.add(BenefitsContents(
                isVideo: false,
                text:
                    getData.data!.offerdata![index].whomtesellLabel.toString(),
                content: getData.data!.offerdata![index].whomtesellContent
                    .toString(),
                video: ""));
          }
          if (getData.data!.offerdata![index].howitworksLabel != null) {
            benefitsList.add(BenefitsContents(
                isVideo: false,
                text:
                    getData.data!.offerdata![index].howitworksLabel.toString(),
                content: getData.data!.offerdata![index].howitworksContent
                    .toString(),
                video: ""));
          }
          if (getData.data!.offerdata![index].trainingvideoLabel != null) {
            benefitsList.add(BenefitsContents(
                isVideo: true,
                text: getData.data!.offerdata![index].trainingvideoLabel
                    .toString(),
                content: getData.data!.offerdata![index].trainingvideoThmbnail
                    .toString(),
                video: getData.data!.offerdata![index].trainingvideoUrl
                    .toString()));

            videoId = YoutubePlayer.convertUrlToId(
                getData.data!.offerdata![index].trainingvideoUrl.toString());
            videoController = YoutubePlayerController(
              initialVideoId: videoId.toString(),
              flags: const YoutubePlayerFlags(
                mute: false,
                autoPlay: false,
                disableDragSeek: false,
                loop: false,
                isLive: false,
                forceHD: false,
                enableCaption: true,
                showLiveFullscreenButton: false,
              ),
            );
          }
          if (getData.data!.offerdata![index].termsLabel != null) {
            benefitsList.add(BenefitsContents(
                isVideo: false,
                text: getData.data!.offerdata![index].termsLabel.toString(),
                content:
                    getData.data!.offerdata![index].termsContent.toString(),
                video: ""));
          }
          if (getData.data!.offerdata![index].faqsLabel != null) {
            benefitsList.add(BenefitsContents(
                isVideo: false,
                text: getData.data!.offerdata![index].faqsLabel.toString(),
                content: getData.data!.offerdata![index].faqsContent.toString(),
                video: ""));
          }
        });
      }
    } catch (e) {
      // Handle exceptions if any
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        color: AppColor.tabgraycolor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: getData.data != null
              ? Column(
                  children: [
                    sizeBoxHeight(10.h),
                    slider(),
                    sizeBoxHeight(15.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            decoration: const ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 2.0,
                                ),
                              ],
                              shape: SwTicketBorder(
                                radius: 20,
                                fillColor: AppColor.bluecolor,
                                borderWidth: 0,
                                bottomLeft: true,
                                bottomRight: true,
                                topLeft: false,
                                topRight: false,
                              ),
                            ),
                            child: Stack(
                              children: [
                                benifits(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: dottedDivider()),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: const ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 2.0,
                                ),
                              ],
                              shape: SwTicketBorder(
                                radius: 20,
                                fillColor: Colors.white,
                                borderWidth: 0,
                                bottomLeft: false,
                                bottomRight: false,
                                topLeft: true,
                                topRight: true,
                              ),
                            ),
                            child: details(),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.bluecolor,
                  ),
                ),
        ),
      ),
    );
  }

  Widget dottedDivider() {
    return DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 2.0,
      dashLength: 4.0,
      dashColor: Colors.grey.shade300,
      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 0.0,
    );
  }

  Widget slider() {
    return Padding(
      padding: EdgeInsets.only(right: 5.w, left: 5.w),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                items: bannerUrls.map((imageUrl) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: imageUrl,
                      placeholder: (context, url) => SizedBox(
                        child: LinearProgressIndicator(
                          color: Colors.grey.shade200,
                          backgroundColor: Colors.grey.shade100,
                        ),
                      ),
                    ),
                    /*Image.network(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),*/
                  );
                }).toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  },
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 24 / 9,
                  autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.950,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bannerUrls.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: current == entry.key
                          ? AppColor.curcolor
                          : AppColor.graytextcolor,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget benifits() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_currentPage > 0) {
                    _currentPage = _currentPage - 1;
                  }
                });
                // pageController.previousPage(
                //   duration: const Duration(milliseconds: 200),
                //   curve: Curves.easeOut,
                // );
              },
              child: Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.5.r),
                    color: AppColor.whitecolor),
                child: Center(
                    child: Image.asset('${AppImages.sellearnimages}back.png',
                        color: AppColor.bluecolor, height: 14.h)),
              ),
            ),
            Expanded(
              child: Center(
                child: AppText(
                  text:
                      '${_currentPage + 1}.${benefitsList[_currentPage].text}',
                  fontsize: 19.sp,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                  color: AppColor.whitecolor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_currentPage < benefitsList.length - 1) {
                    _currentPage = _currentPage + 1;
                  }
                });
                // pageController.nextPage(
                //   duration: const Duration(milliseconds: 200),
                //   curve: Curves.easeIn,
                // );
              },
              child: Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.5.r),
                    color: AppColor.whitecolor),
                child: Center(
                    child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.bluecolor,
                  size: 16.sp,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget details() {
    return Column(
      children: [
        !benefitsList[_currentPage].isVideo
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 10, right: 5, left: 5),
                  child: SingleChildScrollView(
                    child: Html(
                      data: benefitsList[_currentPage].content,
                      style: {
                        "body": Style(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: FontSize(14), // Set your desired font size
                          color: AppColor
                              .graytext1color, // Set your desired text color
                          // You can add other style properties here
                        ),
                      },
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(15),
                child: YoutubePlayer(
                  width: double.infinity,
                  controller: videoController,
                  // topActions: [
                  // ProgressBar(),
                  // PlayPauseButton(),
                  // ],
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(isExpanded: true),
                    RemainingDuration(),
                    // const PlaybackSpeedButton(),
                    // FullScreenButton(),
                  ],
                ),
              ),
        actionButtons(index),
      ],
    );
  }

  Widget actionButtons(index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          if (getData.data!.offerdata![index].showaddcustomerbtn!)
            Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  PrefObj.preferences!
                      .put(PrefKeys.OfferId, getData.data!.offerdata![index].offerid.toString());
                  PrefObj.preferences!
                      .put(PrefKeys.OfferTitle, getData.data!.offerdata![index].offername.toString());
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return const AddCustomerScreen();
                    },
                  ));
                },
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(53.r),
                      border: Border.all(color: AppColor.greenncolor)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: AppText(
                        text: getData.data!.offerdata![index].addcustomerbtnText
                            .toString(),
                        fontsize: 13.5.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.greenncolor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (getData.data!.offerdata![index].showmoredetailsbtn!)
            Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  PrefObj.preferences!
                      .put(PrefKeys.OfferId, getData.data!.offerdata![index].offerid.toString());
                  PrefObj.preferences!
                      .put(PrefKeys.OfferTitle, getData.data!.offerdata![index].offername.toString());
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return const AddCustomerScreen();
                    },
                  ));
                },
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(53.r),
                      border: Border.all(color: AppColor.greenncolor)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: AppText(
                        text: getData.data!.offerdata![index].moredetailsbtnText
                            .toString(),
                        fontsize: 13.5.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.greenncolor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (getData.data!.offerdata![index].showsharebtn!)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  ShareUtils.shareFileWithText(
                      context: context,
                      imageUrl:
                          getData.data!.offerdata![index].shareimage.toString(),
                      shareContent: getData.data!.offerdata![index].sharecontent
                          .toString());
                },
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(53.r),
                    color: AppColor.greenncolor,
                  ),
                  child: Center(
                    child: AppText(
                      text: getData.data!.offerdata![index].sharebtnText
                          .toString(),
                      fontsize: 13.5.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.whitecolor,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget addCustomer() {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, RouteUtils.addCustomerScreen,
                //     arguments: {
                //       RouteUtils.offerTitle: offerTitle,
                //     });
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const AddCustomerScreen();
                  },
                ));
              },
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(53.r),
                  border: Border.all(color: AppColor.greenncolor),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: AppText(
                      text: getLabel(add_customer),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontsize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.greenncolor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          sizeBoxWidth(12.w),
          Expanded(
            child: GestureDetector(
              onTap: () {
                ShareUtils.shareFileWithText(
                    context: context,
                    imageUrl:
                        getData.data!.offerdata![index].shareimage.toString(),
                    shareContent: getData.data!.offerdata![index].sharecontent
                        .toString());
              },
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(53.r),
                    color: AppColor.greenncolor),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: AppText(
                      text: getLabel(share_with_customer),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontsize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.whitecolor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SharecontentData {
  static List<String> photos = [];
  static List<String> videos = [];
  static List<String> brochures = [];
}
