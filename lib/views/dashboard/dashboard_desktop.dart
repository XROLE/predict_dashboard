import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
import 'package:predict_dashboard/views/dashboard/body/desktop_body.dart';
import 'package:predict_dashboard/views/dashboard/header/desktop_header.dart';
import 'package:predict_dashboard/views/widgets/action_label.dart';
import 'package:predict_dashboard/views/widgets/asset_widget.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.appBg,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi Robin,", style: AppTextStyle.title()),
              Text("Here is an overview of your account activities.",
                  style: AppTextStyle.subTitle(color: AppColors.appWhiteLight.withOpacity(.9))),
              const SizedBox(height: 40),
              const DesktopHeaderSection(),
              const SizedBox(height: 40),
              const DesktopBody(),
            ],
          ),
        ),
      ),
    );
  }
}
