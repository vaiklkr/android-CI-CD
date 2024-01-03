//
// import 'package:dotted_line/dotted_line.dart';
// import 'package:finjoy_app/const/behaviour.dart';
// import 'package:finjoy_app/core/app_color.dart';
// import 'package:finjoy_app/core/app_image.dart';
// import 'package:finjoy_app/core/app_sized_box.dart';
// import 'package:finjoy_app/core/app_text.dart';
// import 'package:finjoy_app/screens/auth/login_screen.dart';
// import 'package:finjoy_app/screens/profile/my_profile_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class DrawerScreen extends StatefulWidget {
//   const DrawerScreen({super.key});
//
//   @override
//   State<DrawerScreen> createState() => _DrawerScreenState();
// }
//
// class _DrawerScreenState extends State<DrawerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           profileBG(),
//           sizeBoxHeight(15.h),
//           Expanded(
//             child: ScrollConfiguration(
//               behavior: MyBehavior(),
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       left: vDefaultSize.w, right: vDefaultSize.w),
//                   child: Column(
//                     children: [
//                       profileSetting(),
//                       sizeBoxHeight(vDefaultPadding.h),
//                       myBusiness(),
//                       sizeBoxHeight(vDefaultPadding.h),
//                       settings(),
//                       sizeBoxHeight(vDefaultPadding.h),
//                       more(),
//                       sizeBoxHeight(vDefaultPadding.h),
//                       logOut(),
//                       sizeBoxHeight(vDefaultPadding.h),
//                       follow(),
//                       sizeBoxHeight(vDefaultPadding * 2.h),
//                       appLogo(context),
//                       sizeBoxHeight(vDefaultPadding * 2.h),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget profileBG() {
//     return Stack(
//       children: [
//         Image.asset('${AppImages.drawerimages}bg.png'),
//         Column(
//           children: [
//             backArrow(),
//             sizeBoxHeight(35.h),
//             profileDetail(),
//           ],
//         )
//       ],
//     );
//   }
//
//   Widget backArrow() {
//     return Padding(
//       padding: EdgeInsets.only(left: 17.w, top: 52.h),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Row(
//           children: [
//             Container(
//               height: 30.h,
//               width: 30.w,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(9.5.r),
//                   color: AppColor.bluecolor),
//               child: Center(
//                   child: Image.asset('${AppImages.sellearnimages}back.png',
//                       height: 14.h)),
//             ),
//             sizeBoxWidth(12.w),
//             AppText(
//               text: 'Home',
//               fontsize: 20.sp,
//               fontWeight: FontWeight.w600,
//               color: AppColor.blacktextcolor,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget profileDetail() {
//     return Padding(
//       padding: EdgeInsets.only(left: 23.w),
//       child: Row(
//         children: [
//           Image.asset(
//             '${AppImages.drawerimages}man.png',
//             height: 55.h,
//           ),
//           sizeBoxWidth(15.w),
//           Column(
//             children: [
//               AppText(
//                 text: 'Pratap Ranjan',
//                 fontsize: 21.sp,
//                 fontWeight: FontWeight.bold,
//                 color: AppColor.bluecolor,
//               ),
//               AppText(
//                 text: 'FinID202020203201',
//                 fontsize: 16.sp,
//                 fontWeight: FontWeight.w500,
//                 color: const Color(0xffED6028),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget profileSetting() {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(
//           builder: (context) {
//             return MyProfileScreen(
//                 fullName: '',
//                 editphoneController: TextEditingController(text: ''));
//           },
//         ));
//       },
//       child: Container(
//         height: 73.h,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: AppColor.whitecolor,
//           borderRadius: BorderRadius.circular(15.r),
//           boxShadow: [
//             BoxShadow(
//                 spreadRadius: 3.r,
//                 blurRadius: 3.r,
//                 color: Colors.grey.shade100),
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(left: 20.w, right: 20.w),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   Image.asset(
//                     '${AppImages.drawerimages}profileic.png',
//                     height: 38.h,
//                   ),
//                   sizeBoxWidth(15.w),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppText(
//                         text: 'Profile Setting',
//                         fontsize: 14.5.sp,
//                         fontWeight: FontWeight.w600,
//                         color: AppColor.darktextcolor,
//                       ),
//                       AppText(
//                         text: 'Manage your profile from here',
//                         fontsize: 10.62.sp,
//                         fontWeight: FontWeight.w400,
//                         color: AppColor.graytext1color,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Icon(
//                 Icons.arrow_forward_ios_rounded,
//                 color: AppColor.darkarrowcolor,
//                 size: 15.sp,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget myBusiness() {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: AppColor.whitecolor,
//             borderRadius: BorderRadius.circular(15.r),
//             boxShadow: [
//               BoxShadow(
//                   spreadRadius: 3.r,
//                   blurRadius: 3.r,
//                   color: Colors.grey.shade100),
//             ],
//           ),
//           child: Padding(
//             padding: EdgeInsets.only(bottom: 19.h),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 13.h),
//                       child: Container(
//                         height: 20.h,
//                         width: 6.w,
//                         decoration: BoxDecoration(
//                           color: AppColor.bluecolor,
//                           borderRadius: BorderRadius.circular(20.r),
//                         ),
//                       ),
//                     ),
//                     sizeBoxWidth(20.w),
//                     Padding(
//                       padding: EdgeInsets.only(top: 15.h),
//                       child: AppText(
//                         text: 'My Business',
//                         fontsize: 14.7.sp,
//                         fontWeight: FontWeight.bold,
//                         color: AppColor.blackcolor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 sizeBoxHeight(27.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'Visiting Card',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Manage Visiting Card from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                       sizeBoxHeight(14.h),
//                       dottedDividerr(),
//                     ],
//                   ),
//                 ),
//                 sizeBoxHeight(9.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'My Store',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Manage your Store from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                       sizeBoxHeight(14.h),
//                       dottedDividerr(),
//                     ],
//                   ),
//                 ),
//                 sizeBoxHeight(9.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'My Briefcase',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Manage your  Briefcase from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                       sizeBoxHeight(14.h),
//                       dottedDividerr(),
//                     ],
//                   ),
//                 ),
//                 sizeBoxHeight(9.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'Analytics',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Manage your Analytics from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                       sizeBoxHeight(14.h),
//                       dottedDividerr(),
//                     ],
//                   ),
//                 ),
//                 sizeBoxHeight(9.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'Refer and Earn',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Manage your Analytics from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                       sizeBoxHeight(14.h),
//                       dottedDividerr(),
//                     ],
//                   ),
//                 ),
//                 sizeBoxHeight(9.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'Free Credit Score',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Check your Credit Score from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget settings() {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: AppColor.whitecolor,
//             borderRadius: BorderRadius.circular(15.r),
//             boxShadow: [
//               BoxShadow(
//                   spreadRadius: 3.r,
//                   blurRadius: 3.r,
//                   color: Colors.grey.shade100),
//             ],
//           ),
//           child: Padding(
//             padding: EdgeInsets.only(bottom: 19.h),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 13.h),
//                       child: Container(
//                         height: 20.h,
//                         width: 6.w,
//                         decoration: BoxDecoration(
//                           color: AppColor.bluecolor,
//                           borderRadius: BorderRadius.circular(20.r),
//                         ),
//                       ),
//                     ),
//                     sizeBoxWidth(20.w),
//                     Padding(
//                       padding: EdgeInsets.only(top: 15.h),
//                       child: AppText(
//                         text: 'Settings',
//                         fontsize: 14.7.sp,
//                         fontWeight: FontWeight.bold,
//                         color: AppColor.blackcolor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 sizeBoxHeight(27.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'Change MPIN',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Manage Visiting Card from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                       sizeBoxHeight(14.h),
//                       dottedDividerr(),
//                     ],
//                   ),
//                 ),
//                 sizeBoxHeight(9.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'Change Language',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Manage your Store from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget more() {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: AppColor.whitecolor,
//             borderRadius: BorderRadius.circular(15.r),
//             boxShadow: [
//               BoxShadow(
//                   spreadRadius: 3.r,
//                   blurRadius: 3.r,
//                   color: Colors.grey.shade100),
//             ],
//           ),
//           child: Padding(
//             padding: EdgeInsets.only(bottom: 19.h),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 13.h),
//                       child: Container(
//                         height: 20.h,
//                         width: 6.w,
//                         decoration: BoxDecoration(
//                           color: AppColor.bluecolor,
//                           borderRadius: BorderRadius.circular(20.r),
//                         ),
//                       ),
//                     ),
//                     sizeBoxWidth(20.w),
//                     Padding(
//                       padding: EdgeInsets.only(top: 15.h),
//                       child: AppText(
//                         text: 'More',
//                         fontsize: 14.7.sp,
//                         fontWeight: FontWeight.bold,
//                         color: AppColor.blackcolor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 sizeBoxHeight(27.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'Terms & Conditions',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Manage Visiting Card from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                       sizeBoxHeight(14.h),
//                       dottedDividerr(),
//                     ],
//                   ),
//                 ),
//                 sizeBoxHeight(9.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'Privacy Policy',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Manage your Store from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                       sizeBoxHeight(14.h),
//                       dottedDividerr(),
//                     ],
//                   ),
//                 ),
//                 sizeBoxHeight(9.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'Support and FAQs',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Manage your  Briefcase from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                       sizeBoxHeight(14.h),
//                       dottedDividerr(),
//                     ],
//                   ),
//                 ),
//                 sizeBoxHeight(9.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 '${AppImages.drawerimages}profileic.png',
//                                 height: 38.h,
//                               ),
//                               sizeBoxWidth(15.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppText(
//                                     text: 'Rate us',
//                                     fontsize: 14.5.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.darktextcolor,
//                                   ),
//                                   AppText(
//                                     text: 'Check your Credit Score from here',
//                                     fontsize: 10.62.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.graytext1color,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios_rounded,
//                             color: AppColor.darkarrowcolor,
//                             size: 15.sp,
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget logOut() {
//     return GestureDetector(
//       onTap: () {
//         showLogoutDailog();
//       },
//       // onTap: () {
//       //   Navigator.push(context, CupertinoPageRoute(
//       //     builder: (context) {
//       //       return const LoginScreen();
//       //     },
//       //   ));
//       // },
//       child: Container(
//         height: 73.h,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: AppColor.whitecolor,
//           borderRadius: BorderRadius.circular(15.r),
//           boxShadow: [
//             BoxShadow(
//                 spreadRadius: 3.r,
//                 blurRadius: 3.r,
//                 color: Colors.grey.shade100),
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(left: 20.w, right: 20.w),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   Image.asset(
//                     '${AppImages.drawerimages}profileic.png',
//                     height: 38.h,
//                   ),
//                   sizeBoxWidth(15.w),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppText(
//                         text: 'Log Out',
//                         fontsize: 14.5.sp,
//                         fontWeight: FontWeight.w600,
//                         color: AppColor.darktextcolor,
//                       ),
//                       AppText(
//                         text: 'Manage your profile from here',
//                         fontsize: 10.62.sp,
//                         fontWeight: FontWeight.w400,
//                         color: AppColor.graytext1color,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Icon(
//                 Icons.arrow_forward_ios_rounded,
//                 color: AppColor.darkarrowcolor,
//                 size: 15.sp,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget follow() {
//     return Container(
//       height: 73.h,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: AppColor.whitecolor,
//         borderRadius: BorderRadius.circular(15.r),
//         boxShadow: [
//           BoxShadow(
//               spreadRadius: 3.r, blurRadius: 3.r, color: Colors.grey.shade100),
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(left: 20.w, right: 20.w),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 Image.asset(
//                   '${AppImages.drawerimages}profileic.png',
//                   height: 38.h,
//                 ),
//                 sizeBoxWidth(15.w),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AppText(
//                       text: 'Follow on socials',
//                       fontsize: 14.5.sp,
//                       fontWeight: FontWeight.w600,
//                       color: AppColor.darktextcolor,
//                     ),
//                     AppText(
//                       text: 'Manage your profile from here',
//                       fontsize: 10.62.sp,
//                       fontWeight: FontWeight.w400,
//                       color: AppColor.graytext1color,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Icon(
//               Icons.arrow_forward_ios_rounded,
//               color: AppColor.darkarrowcolor,
//               size: 15.sp,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void showLogoutDailog() {
//     // _scaffoldKey.currentState!.closeDrawer();
//
//     showCupertinoDialog(
//         context: context,
//         builder: (BuildContext ctx) {
//           return Theme(
//               data: ThemeData.light(),
//               child: CupertinoAlertDialog(
//                 title: AppText(
//                   text: 'Are you sure you want to Logout ?',
//                   fontWeight: FontWeight.w600,
//                   fontsize: 16.sp,
//                   color: AppColor.blackcolor,
//                 ),
//                 actions: [
//                   CupertinoDialogAction(
//                     onPressed: () {
//                       // PrefObj.preferences!.clear();
//
//                       Navigator.of(context).pushAndRemoveUntil(
//                           MaterialPageRoute(
//                               builder: (context) => const LoginScreen()),
//                               (Route<dynamic> route) => false);
//
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         backgroundColor: AppColor.bluecolor,
//                         content: AppText(
//                           text: 'Logout Successfully',
//                           fontWeight: FontWeight.w600,
//                           fontsize: 16.sp,
//                           color: AppColor.whitecolor,
//                         ),
//                       ));
//                     },
//                     isDefaultAction: true,
//                     isDestructiveAction: true,
//                     child: AppText(
//                       text: 'Yes',
//                       fontWeight: FontWeight.w600,
//                       fontsize: 18.sp,
//                       color: Colors.red,
//                     ),
//                   ),
//                   CupertinoDialogAction(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     isDefaultAction: false,
//                     isDestructiveAction: false,
//                     child: AppText(
//                       text: 'No',
//                       fontWeight: FontWeight.w600,
//                       fontsize: 18.sp,
//                       color: Colors.blueAccent,
//                     ),
//                   )
//                 ],
//               ));
//         });
//   }
// }
//
// Widget appLogo(context) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Image.asset('${AppImages.selectlanguageimages}logo.png', height: 52.h),
//       sizeBoxHeight(vDefaultPadding.h),
//       SizedBox(
//         width: MediaQuery.of(context).size.width / 1.3.w,
//         child: AppText(
//           text:
//           'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever ',
//           fontsize: 7.62.sp,
//           textCenter: true,
//           fontWeight: FontWeight.w400,
//           color: AppColor.graytext1color,
//         ),
//       ),
//     ],
//   );
// }
//
// Widget dottedDividerr() {
//   return Padding(
//     padding: EdgeInsets.only(left: 52.w),
//     child: DottedLine(
//       direction: Axis.horizontal,
//       alignment: WrapAlignment.center,
//       lineLength: double.infinity,
//       lineThickness: 1.0,
//       dashLength: 4.0,
//       dashColor: Colors.grey.shade300,
//       dashRadius: 0.0,
//       dashGapLength: 4.0,
//       dashGapColor: Colors.transparent,
//       dashGapRadius: 0.0,
//     ),
//   );
// }