import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi Robin,", style: AppTextStyle.title()),
              Text("Here is an overview of your account activities.",
                  style: AppTextStyle.subTitle(color: AppColors.appWhiteLight)),
              const SizedBox(height: 40),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: AppColors.appWhiteLight.withOpacity(.2)),
                  color: AppColors.appBgLight,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AssetWidget(
                      title: "Balance",
                      value: "\$616.81",
                    ),
                    AssetWidget(
                      title: "Profits",
                      value: "\$86.03",
                      hasBorderSide: true,
                      profitWidget: ActionLabel(
                        title: "31%",
                        isProfit: true,
                        icon: Icon(
                          Icons.arrow_outward,
                          color: AppColors.appGreen.withOpacity(.6),
                          size: 20,
                        ),
                      ),
                    ),
                    const AssetWidget(
                      title: "Assets",
                      value: "12",
                      hasBorderSide: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
