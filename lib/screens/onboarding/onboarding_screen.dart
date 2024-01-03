import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/auth/login_screen.dart';
import 'package:finjoy_app/screens/onboarding/onboarding_contents.dart';
import 'package:finjoy_app/screens/onboarding/size_config.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/appLabel/app_label_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  AnimatedContainer _buildDots({
    int? index,
  }) {
    Color dotColor = const Color(0xffFF800B);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: _currentPage == index ? dotColor : const Color(0xffD0D0D0),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 10 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: vDefaultPadding * 2,
                              right: vDefaultPadding * 2),
                          child: Image.asset(
                            contents[i].image,
                            height: SizeConfig.blockV! * 35,
                          ),
                        ),
                        SizedBox(height: (height >= 840) ? 60 : 30),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            fontSize: (width <= 550) ? 30 : 35,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: vDefaultSize, right: vDefaultSize),
                          child: AppText(
                            text: contents[i].desc,
                            fontsize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.blackcolor,
                            textCenter: true,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  // _currentPage + 1 == contents.length
                  //     ? GestureDetector(
                  //         onTap: () {
                  //           Navigator.push(context, CupertinoPageRoute(
                  //             builder: (context) {
                  //               return const LoginScreen();
                  //             },
                  //           ));
                  //         },
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(30),
                  //           child: Container(
                  //             height: 58.h,
                  //             width: MediaQuery.of(context).size.width / 2,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(41.r),
                  //               color: AppColor.bluecolor,
                  //             ),
                  //             child: Center(
                  //                 child: AppText(
                  //               text: 'Login',
                  //               color: AppColor.whitecolor,
                  //               fontsize: 20.sp,
                  //               fontWeight: FontWeight.w400,
                  //             )),
                  //           ),
                  //         ),
                  //       )
                  //     :
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _currentPage != 3
                                ? _controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  )
                                : Navigator.push(context, CupertinoPageRoute(
                                    builder: (context) {
                                      return const LoginScreen();
                                    },
                                  ));
                          },
                          child: Container(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width / 3.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(41.r),
                              color: AppColor.bluecolor,
                            ),
                            child: Center(
                                child: AppText(
                              text: getLabel(next),
                              color: AppColor.whitecolor,
                              fontsize: 17.sp,
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context, CupertinoPageRoute(
                                builder: (context) {
                                  return const LoginScreen();
                                },
                              ));
                            },
                            child: AppText(
                              text: getLabel(skip),
                              color: AppColor.graycolor,
                              fontsize: 16.sp,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
