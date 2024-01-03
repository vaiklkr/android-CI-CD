import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ECommerceTab extends StatefulWidget {
  const ECommerceTab({super.key});

  @override
  State<ECommerceTab> createState() => _ECommerceTabState();
}

class _ECommerceTabState extends State<ECommerceTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whitecolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [commingsoons(), const SizedBox.shrink()],
      ),
    );
  }

  Widget commingsoons() {
    return Lottie.asset(
      '${AppImages.homeimages}commingsoons.json',
    );
  }
}
