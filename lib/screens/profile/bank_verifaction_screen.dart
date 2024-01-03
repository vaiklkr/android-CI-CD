import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/screens/profile/account_tab_screen.dart';
import 'package:finjoy_app/screens/profile/vpa_tab_screen.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/appLabel/app_label_service.dart';

class BankVerifactionScreen extends StatefulWidget {
  final void Function(bool) onClose;
  const BankVerifactionScreen({super.key, required this.onClose});

  @override
  State<BankVerifactionScreen> createState() => _BankVerifactionScreenState();
}

class _BankVerifactionScreenState extends State<BankVerifactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.whitecolor,
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                  title: getLabel(bank_verification),
                  subtitle: getLabel(verify_your_bank_details)),
              sizeBoxHeight(vDefaultPadding * 2),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: vDefaultPadding, right: vDefaultPadding),
                  child: tabBar(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBar() {
    return Column(
      children: [
        Container(
          height: 55.h,
          decoration: BoxDecoration(
              color: AppColor.tabgraycolor,
              borderRadius: BorderRadius.circular(100.0)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: TabBar(
              controller: _tabController,
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
              labelColor: AppColor.blackcolor,
              labelStyle: GoogleFonts.poppins(
                  color: AppColor.blacktextcolor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
              unselectedLabelColor: AppColor.graycolor,
              tabs: [
                Tab(text: getLabel(vpa)),
                Tab(text: getLabel(account)),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              VPATab(
                tabController: _tabController,
                onClose: (value) {
                  widget.onClose(value);
                  setState(() {});
                },
              ),
              AccountTab(
                onClose: (value) {
                  widget.onClose(value);
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
