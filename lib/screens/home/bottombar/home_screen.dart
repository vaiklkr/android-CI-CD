// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:finjoy_app/const/behaviour.dart';
// import 'package:finjoy_app/core/app_color.dart';
// import 'package:finjoy_app/core/app_image.dart';
// import 'package:finjoy_app/core/app_sized_box.dart';
// import 'package:finjoy_app/core/app_text.dart';
// import 'package:finjoy_app/core/locale/language.dart';
// import 'package:finjoy_app/screens/home/financial_tab.dart';
// import 'package:finjoy_app/screens/profile/my_profile_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
// final CarouselController _controller = CarouselController();
// late int current = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.bluecolor,
//       body: bgImage(),
//     );
//   }

//   Widget bgImage() {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Image.asset(
//               '${AppImages.homeimages}homebg.png',
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: vDefaultPadding * 3.h),
//               child: Column(
//                 children: [
//                   appBar(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         homeDetails()
//       ],
//     );
//   }

//   Widget appBar() {
//     return Padding(
//       padding:
//           const EdgeInsets.only(left: vDefaultPadding, right: vDefaultPadding),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(context, CupertinoPageRoute(
//                 builder: (context) {
//                   return const MyProfileScreen();
//                 },
//               ));
//             },
//             child: Image.asset(
//               '${AppImages.homeimages}profile.png',
//               height: 35.h,
//             ),
//           ),
//           sizeBoxWidth(vDefaultPadding),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppText(
//                 text: 'Hi,',
//                 fontWeight: FontWeight.w400,
//                 color: AppColor.whitecolor,
//                 fontsize: 12.sp,
//               ),
//               AppText(
//                 text: 'Pratap Ranjan',
//                 fontWeight: FontWeight.bold,
//                 color: AppColor.whitecolor,
//                 fontsize: 22.sp,
//               ),
//             ],
//           ),
//           const Spacer(),
//           Row(
//             children: [
//               Image.asset(
//                 '${AppImages.homeimages}finjoy.png',
//                 height: 36.h,
//               ),
//               sizeBoxWidth(vDefaultPadding),
//               Image.asset(
//                 '${AppImages.homeimages}noti.png',
//                 height: 36.h,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget homeDetails() {
//     return DefaultTabController(
//       length: 3,
//       child: Container(
//         margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
//         padding: EdgeInsets.only(top: 20.h, right: 5.w, left: 5.w),
//         decoration: BoxDecoration(
//             color: AppColor.whitecolor,
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(30.r),
//                 topLeft: Radius.circular(30.r))),
//         child: ScrollConfiguration(behavior: MyBehavior(), child: tabBar()),
//       ),
//     );
//   }

//   Widget slider() {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         CarouselSlider(
//           items: [
//             Image.asset('${AppImages.homeimages}card.png'),
//             Image.asset('${AppImages.homeimages}card1.png'),
//             Image.asset('${AppImages.homeimages}card.png'),
//           ],
//           options: CarouselOptions(
//             onPageChanged: (index, reason) {
//               setState(() {
//                 current = index;
//               });
//             },
//             enlargeCenterPage: true,
//             autoPlay: true,
//             aspectRatio: 25 / 12,
//             autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
//             enableInfiniteScroll: true,
//             autoPlayAnimationDuration: const Duration(milliseconds: 800),
//             viewportFraction: 1.5,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: vDefaultPadding.h),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [1, 2, 3].asMap().entries.map((entry) {
//               return GestureDetector(
//                 onTap: () => _controller.animateToPage(entry.key),
//                 child: Container(
//                     width: 6.0,
//                     height: 6.0,
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 6.0, horizontal: 3.0),
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: current == entry.key
//                             ? AppColor.curcolor
//                             : AppColor.graytextcolor)),
//               );
//             }).toList(),
//           ),
//         )
//       ],
//     );
//   }

//   // Widget homeDetails() {
//   //   return DefaultTabController(
//   //     length: 3,
//   //     child: Container(
//   //       height: MediaQuery.of(context).size.height * 2.39.h,
//   //       decoration: const BoxDecoration(
//   //           color: AppColor.whitecolor,
//   //           borderRadius: BorderRadius.only(
//   //             topRight: Radius.circular(40),
//   //             topLeft: Radius.circular(40),
//   //           )),
//   //       child: Padding(
//   //         padding: EdgeInsets.only(top: 17.h, right: 20.w, left: 20.w),
//   //         child: tabBar(),
//   //       ),
//   //     ),
//   //   );
//   // }

//   Widget tabBar() {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           slider(),
//           sizeBoxHeight(15.h),
//           Padding(
//             padding:
//                 const EdgeInsets.only(left: vDefaultSize, right: vDefaultSize),
//             child: Container(
//               height: 55.h,
//               decoration: BoxDecoration(
//                   color: AppColor.tabgraycolor,
//                   borderRadius: BorderRadius.circular(100.0)),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TabBar(
//                   indicator: BoxDecoration(
//                     color: AppColor.whitecolor,
//                     borderRadius: BorderRadius.circular(23.h),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.shade200,
//                         spreadRadius: 2.h,
//                         blurRadius: 2.h,
//                         offset: const Offset(
//                           0,
//                           4,
//                         ),
//                       ),
//                     ],
//                   ),
//                   labelColor: AppColor.bluecolor,
//                   labelStyle: GoogleFonts.poppins(
//                       color: AppColor.bluecolor,
//                       fontSize: 12.5.sp,
//                       fontWeight: FontWeight.w600),
//                   unselectedLabelColor: AppColor.graycolor,
//                   tabs: [
//                     Tab(
//                       text: Languages.of(context)!.financial,
//                     ),
//                     Tab(
//                       text: Languages.of(context)!.ecommerce,
//                     ),
//                     Tab(
//                       text: Languages.of(context)!.wallet,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 1740.h,
//             child: const TabBarView(
//               physics: NeverScrollableScrollPhysics(),
//               children: [
//                 FinancialTab(),
//                 FinancialTab(),
//                 FinancialTab(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:finjoy_app/const/behaviour.dart';
// import 'package:finjoy_app/core/app_color.dart';
// import 'package:finjoy_app/core/app_image.dart';
// import 'package:finjoy_app/core/app_sized_box.dart';
// import 'package:finjoy_app/core/locale/language.dart';
// import 'package:finjoy_app/screens/home/financial_tab.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final CarouselController _controller = CarouselController();
//   late int current = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.bluecolor,
//       body: ScrollConfiguration(
//         behavior: MyBehavior(),
//         child: CustomScrollView(
//           slivers: <Widget>[
//             SliverAppBar(
//               title: appBar(),
//               leadingWidth: 0.0,
//               actions: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: vDefaultPadding),
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         '${AppImages.homeimages}finjoy.png',
//                         height: 36.h,
//                       ),
//                       sizeBoxWidth(vDefaultPadding),
//                       Image.asset(
//                         '${AppImages.homeimages}noti.png',
//                         height: 36.h,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//               backgroundColor: AppColor.bluecolor,
//               leading: const SizedBox.shrink(),
//               expandedHeight: MediaQuery.of(context).size.height / 3.65.h,
//               // expandedHeight: MediaQuery.of(context).size.height / 3.9.h,
//               elevation: 0.0,
//               floating: true,
//               pinned: true,
//               flexibleSpace: FlexibleSpaceBar(background: bgImage()),
//             ),
//             SliverList(
//               delegate: SliverChildListDelegate(
//                 [
//                   ScrollConfiguration(
//                       behavior: MyBehavior(),
//                       child: SingleChildScrollView(child: homeDetails())),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget bgImage() {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Image.asset(
//               '${AppImages.homeimages}homebg.png',
//               width: double.maxFinite,
//               fit: BoxFit.fill,
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: vDefaultPadding * 3.2.h),
//               child: Column(
//                 children: [
//                   sizeBoxHeight(70.h),
//                   slider(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget appBar() {
//     return Row(
//       children: [
//         Image.asset(
//           '${AppImages.homeimages}profile.png',
//           height: 32.h,
//         ),
//         sizeBoxWidth(vDefaultPadding),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               Languages.of(context)!.hi,
//               style: GoogleFonts.roboto(
//                   color: AppColor.whitecolor,
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w400),
//             ),
//             Text(
//               Languages.of(context)!.pratap,
//               style: GoogleFonts.roboto(
//                   color: AppColor.whitecolor,
//                   fontSize: 19.sp,
//                   fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget slider() {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         CarouselSlider(
//           items: [
//             Image.asset(
//               '${AppImages.homeimages}card.png',
//               width: MediaQuery.of(context).size.width / 1.1.w,
//               fit: BoxFit.fill,
//             ),
//             Image.asset(
//               '${AppImages.homeimages}card1.png',
//               width: MediaQuery.of(context).size.width / 1.1.w,
//               fit: BoxFit.fill,
//             ),
//             Image.asset(
//               '${AppImages.homeimages}card.png',
//               width: MediaQuery.of(context).size.width / 1.1.w,
//               fit: BoxFit.fill,
//             ),
//           ],
//           options: CarouselOptions(
//             onPageChanged: (index, reason) {
//               setState(() {
//                 current = index;
//               });
//             },
//             enlargeCenterPage: true,
//             autoPlay: true,
//             height: 180.h,
//             autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
//             enableInfiniteScroll: true,
//             autoPlayAnimationDuration: const Duration(milliseconds: 800),
//             viewportFraction: 0.8.w,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: vDefaultPadding.h / 1.5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [1, 2, 3].asMap().entries.map((entry) {
//               return GestureDetector(
//                 onTap: () => _controller.animateToPage(entry.key),
//                 child: Container(
//                     width: 6.0,
//                     height: 6.0,
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 6.0, horizontal: 3.0),
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: current == entry.key
//                             ? AppColor.curcolor
//                             : AppColor.graytextcolor)),
//               );
//             }).toList(),
//           ),
//         )
//       ],
//     );
//   }

//   Widget homeDetails() {
//     return DefaultTabController(
//       length: 3,
//       child: Container(
//         padding: EdgeInsets.only(right: 5.w, left: 5.w),
//         decoration: BoxDecoration(
//             color: AppColor.whitecolor,
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(30.r),
//                 topLeft: Radius.circular(30.r))),
//         child: tabBar(),
//       ),
//     );
//   }

//   // Widget homeDetails() {
//   //   return DefaultTabController(
//   //     length: 3,
//   //     child: Container(
//   //       height: MediaQuery.of(context).size.height - 180.h,
//   //       padding: EdgeInsets.only(right: 5.w, left: 5.w),
//   //       decoration: BoxDecoration(
//   //           color: AppColor.whitecolor,
//   //           borderRadius: BorderRadius.only(
//   //               topRight: Radius.circular(30.r),
//   //               topLeft: Radius.circular(30.r))),
//   //       child: tabBar(),
//   //     ),
//   //   );
//   // }

//   Widget tabBar() {
//     return Column(
//       children: [
//         sizeBoxHeight(5.h),
//         Container(
//           height: 5.h,
//           width: 40.w,
//           decoration: BoxDecoration(
//             color: AppColor.graybordercolor,
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//         ),
//         sizeBoxHeight(20.h),
//         Padding(
//           padding:
//               const EdgeInsets.only(left: vDefaultSize, right: vDefaultSize),
//           child: Container(
//             height: 58.h,
//             decoration: BoxDecoration(
//                 color: AppColor.tabgraycolor,
//                 borderRadius: BorderRadius.circular(100.0)),
//             child: Padding(
//               padding: const EdgeInsets.all(7.0),
//               child: TabBar(
//                 indicator: BoxDecoration(
//                   color: AppColor.whitecolor,
//                   borderRadius: BorderRadius.circular(23.h),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.shade200,
//                       spreadRadius: 2.h,
//                       blurRadius: 2.h,
//                       offset: const Offset(
//                         0,
//                         4,
//                       ),
//                     ),
//                   ],
//                 ),
//                 labelColor: AppColor.bluecolor,
//                 labelStyle: GoogleFonts.poppins(
//                     color: AppColor.bluecolor,
//                     fontSize: 13.5.sp,
//                     fontWeight: FontWeight.w600),
//                 unselectedLabelColor: AppColor.graycolor,
//                 tabs: [
//                   Tab(
//                     text: Languages.of(context)!.financial,
//                   ),
//                   Tab(
//                     text: Languages.of(context)!.ecommerce,
//                   ),
//                   Tab(
//                     text: Languages.of(context)!.wallet,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 1740.h,
//           child: const TabBarView(
//             physics: NeverScrollableScrollPhysics(),
//             children: [
//               FinancialTab(),
//               FinancialTab(),
//               FinancialTab(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:finjoy_app/const/behaviour.dart';
// import 'package:finjoy_app/core/app_color.dart';
// import 'package:finjoy_app/core/app_image.dart';
// import 'package:finjoy_app/core/app_sized_box.dart';
// import 'package:finjoy_app/core/app_text.dart';
// import 'package:finjoy_app/screens/home/drawer/drawer_screen.dart';
// import 'package:finjoy_app/screens/home/financial_tab.dart';
// import 'package:finjoy_app/screens/home/notification/notification_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final CarouselController _controller = CarouselController();
//   late int current = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColor.bluecolor,
//       child: SafeArea(
//         maintainBottomViewPadding: true,
//         child: Scaffold(
//           backgroundColor: AppColor.whitecolor,
//           body: ScrollConfiguration(
//             behavior: MyBehavior(),
//             child: NestedScrollView(
//               physics: const BouncingScrollPhysics(),
//               floatHeaderSlivers: true,
//               headerSliverBuilder: (context, innerScrolled) => <Widget>[
//                 SliverOverlapAbsorber(
//                   handle:
//                       NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//                   sliver: SliverAppBar(
//                     pinned: true,
//                     foregroundColor: AppColor.bluecolor,
//                     backgroundColor: AppColor.bluecolor,
//                     shadowColor: Colors.transparent,
//                     automaticallyImplyLeading: false,
//                     scrolledUnderElevation: 0.0.h,
//                     elevation: 0.0.h,
//                     title: appBar(),
//                     actions: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: vDefaultPadding),
//                         child: Row(
//                           children: [
//                             Image.asset('${AppImages.homeimages}finjoy.png',
//                                 height: 36.h),
//                             sizeBoxWidth(vDefaultPadding),
//                             GestureDetector(
// onTap: () {
//   Navigator.push(context, CupertinoPageRoute(
//     builder: (context) {
//       return const NotificationScreen();
//     },
//   ));
// },
//                               child: Image.asset(
//                                   '${AppImages.homeimages}noti.png',
//                                   height: 36.h),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                     flexibleSpace: FlexibleSpaceBar(
//                         titlePadding: EdgeInsets.zero, background: bgImage()),
//                     expandedHeight: 310.h,
//                     forceElevated: true,
//                     bottom: PreferredSize(
//                       preferredSize: Size.fromHeight(32.h),
//                       child: Container(
//                         height: 30.h,
//                         margin: EdgeInsets.zero,
//                         padding: EdgeInsets.zero,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: AppColor.whitecolor,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(30.0.r),
//                               topRight: Radius.circular(30.0.r)),
//                           boxShadow: const <BoxShadow>[
//                             BoxShadow(
//                                 color: Colors.white,
//                                 blurRadius: 1.0,
//                                 offset: Offset(0.0, 5))
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(top: 4.h),
//                               height: 5.h,
//                               width: 50.w,
//                               decoration: BoxDecoration(
//                                   color: AppColor.graytextcolor,
//                                   borderRadius: BorderRadius.circular(40.r)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//               body: const SingleChildScrollView(
//                 child: FinancialTab(),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget bgImage() {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Image.asset(
//               '${AppImages.homeimages}homebg.png',
//               width: double.infinity.w,
//               fit: BoxFit.fill,
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 75.h),
//               child: slider(),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

// Widget appBar() {
//   return Row(
//     children: [
//       GestureDetector(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) {
//               return const DrawerScreen();
//             },
//           ));
//         },
//         child: Image.asset(
//           '${AppImages.homeimages}profile.png',
//           height: 40.h,
//         ),
//       ),
//       sizeBoxWidth(vDefaultPadding),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AppText(
//             text: 'Hi,',
//             fontWeight: FontWeight.w400,
//             color: AppColor.whitecolor,
//             fontsize: 12.sp,
//           ),
//           AppText(
//             text: 'Pratap Ranjan',
//             fontWeight: FontWeight.bold,
//             color: AppColor.whitecolor,
//             fontsize: 20.sp,
//           ),
//         ],
//       ),
//     ],
//   );
// }

//   Widget slider() {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         CarouselSlider(
//           items: [
//             Image.asset(
//               '${AppImages.homeimages}card.png',
//               width: 320.w,
//               fit: BoxFit.fill,
//             ),
//             Image.asset(
//               '${AppImages.homeimages}card1.png',
//               width: 320.w,
//               fit: BoxFit.fill,
//             ),
//             Image.asset(
//               '${AppImages.homeimages}card.png',
//               width: 320.w,
//               fit: BoxFit.fill,
//             ),
//           ],
//           options: CarouselOptions(
//             onPageChanged: (index, reason) {
//               setState(() {
//                 current = index;
//               });
//             },
//             enlargeCenterPage: true,
//             autoPlay: true,
//             height: 180.h,
//             autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
//             enableInfiniteScroll: true,
//             autoPlayAnimationDuration: const Duration(milliseconds: 800),
//             viewportFraction: 0.8.w,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: vDefaultPadding.h / 1.5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [1, 2, 3].asMap().entries.map((entry) {
//               return GestureDetector(
//                 onTap: () => _controller.animateToPage(entry.key),
//                 child: Container(
//                     width: 6.0,
//                     height: 6.0,
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 6.0, horizontal: 3.0),
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: current == entry.key
//                             ? AppColor.curcolor
//                             : AppColor.graytextcolor)),
//               );
//             }).toList(),
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:finjoy_app/api/dashboard/bloc/get_dashboard_banner_bloc.dart';
import 'package:finjoy_app/api/dashboard/model/get_dashboard_banner_model.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/drawer/drawer_screen.dart';
import 'package:finjoy_app/screens/home/financial_tab.dart';
import 'package:finjoy_app/screens/home/notification/notification_screen.dart';
import 'package:finjoy_app/screens/home/story%20screen/finjoy_story_screen.dart';
import 'package:finjoy_app/screens/home/wallet_tab.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../widgets/custom_appbar.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getDashboardBannerBloc.getDashboarBannerSink();
    checkLocationPermission();
    getCurrentLocation();
    super.initState();
  }

  final CarouselController _controller = CarouselController();
  late int current = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.bluecolor,
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerScrolled) => <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  pinned: true,
                  stretch: true,
                  backgroundColor: AppColor.bluecolor,
                  leading: const SizedBox.shrink(),
                  leadingWidth: 0,
                  title: appBar(),
                  actions: [
                    Padding(
                        padding: const EdgeInsets.only(right: vDefaultPadding),
                        child: Row(children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const FinjoyStoryScreen();
                                }));
                              },
                              child: Image.asset(
                                  '${AppImages.homeimages}finjoy.png',
                                  height: appBarOtherImageSize)),
                          sizeBoxWidth(vDefaultPadding),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return const NotificationScreen();
                                }));
                              },
                              child: Image.asset(
                                  '${AppImages.homeimages}noti.png',
                                  height: appBarOtherImageSize)),
                        ]))
                  ],
                  flexibleSpace: FlexibleSpaceBar(background: bgImage()),
                  expandedHeight: 345.h,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(80.h),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: vDefaultSize.w,
                          right: vDefaultSize.w,
                          top: vDefaultPadding.h - vTextPadding * 2,
                          bottom: vDefaultPadding.h - vTextPadding * 1.5),
                      height: 75.h,
                      decoration: BoxDecoration(
                          color: AppColor.whitecolor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0.r),
                              topRight: Radius.circular(30.0.r)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white,
                                spreadRadius: 2.h,
                                blurRadius: 2.h,
                                offset: const Offset(0, 4))
                          ]),
                      child: Container(
                        padding: const EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                            color: AppColor.tabgraycolor,
                            borderRadius: BorderRadius.circular(100)),
                        child: TabBar(
                          indicator: BoxDecoration(
                              color: AppColor.whitecolor,
                              borderRadius: BorderRadius.circular(23.h),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    spreadRadius: 2.h,
                                    blurRadius: 2.h,
                                    offset: const Offset(0, 4))
                              ]),
                          labelColor: AppColor.bluecolor,
                          labelStyle: GoogleFonts.poppins(
                              color: AppColor.bluecolor,
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w600),
                          unselectedLabelColor: AppColor.graycolor,
                          tabs: [
                            Tab(text: getLabel(financial_services)),
                            Tab(text: getLabel(my_wallet))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
            body: TabBarView(
              children: [
                // Center(
                //   child: Builder(
                //     builder: (context) => CustomScrollView(
                //       slivers: <Widget>[
                //         SliverOverlapInjector(
                //             handle:
                //                 NestedScrollView.sliverOverlapAbsorberHandleFor(
                //                     context)),
                //         SliverFixedExtentList(
                //             delegate: SliverChildBuilderDelegate(
                //                 (_, index) => const FinancialTab(),
                //                 childCount: 1),
                //             itemExtent: 1495)
                //       ],
                //     ),
                //   ),
                // ),
                FinancialTab(),
                Center(
                  child: Builder(
                    builder: (context) => CustomScrollView(
                      slivers: <Widget>[
                        SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context)),
                        SliverFixedExtentList(
                            delegate: SliverChildBuilderDelegate(
                                (_, index) => const WalletTab(),
                                childCount: 1),
                            itemExtent: 700.h)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bgImage() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset('${AppImages.homeimages}homebg.png',
                width: double.maxFinite, fit: BoxFit.fill),
            Padding(
              padding: EdgeInsets.only(top: 110.h),
              child: Column(
                children: [slider()],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget appBar() {
    return Row(children: [
      profileImage(context, appBarProfileImageSize, AppColor.whitecolor, true),
      sizeBoxWidth(vDefaultPadding),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        statusWidget(),
        AppText(
            text: PrefObj.preferences!.get(PrefKeys.FullName).toString(),
            fontWeight: FontWeight.bold,
            color: AppColor.whitecolor,
            fontsize: 18.sp),
      ])
    ]);
  }

  Widget slider() {
    return StreamBuilder<GetDashboardBannerModel>(
        stream: getDashboardBannerBloc.getDashboardBannerStream,
        builder: (context,
            AsyncSnapshot<GetDashboardBannerModel> getDashboardBannersnapshot) {
          if (!getDashboardBannersnapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.whitecolor,
              ),
            );
          }
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                items: [
                  Image.network(
                      getDashboardBannersnapshot.data?.data?[0].bannerUrl ?? '',
                      width: MediaQuery.of(context).size.width / 1.1.w,
                      fit: BoxFit.fill),
                  Image.network(
                      getDashboardBannersnapshot.data?.data?[1].bannerUrl ?? '',
                      width: MediaQuery.of(context).size.width / 1.1.w,
                      fit: BoxFit.fill),
                  Image.network(
                      getDashboardBannersnapshot.data?.data?[2].bannerUrl ?? '',
                      width: MediaQuery.of(context).size.width / 1.1.w,
                      fit: BoxFit.fill)
                ],
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  },
                  enlargeCenterPage: true,
                  autoPlay: true,
                  height: 180.h,
                  autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: vDefaultPadding.h / 1.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [1, 2, 3].asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                          width: 6.0,
                          height: 6.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 3.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: current == entry.key
                                  ? AppColor.curcolor
                                  : AppColor.graytextcolor)),
                    );
                  }).toList(),
                ),
              )
            ],
          );
        });
  }


  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle denied permission
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle permanently denied permission
    }

    // Permission granted or already granted
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  }

}
