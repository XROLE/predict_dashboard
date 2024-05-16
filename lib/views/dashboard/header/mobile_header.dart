import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
import 'package:predict_dashboard/views/widgets/action_label.dart';
import 'package:predict_dashboard/views/widgets/mobile_asset_widget.dart';

class MobileHeaderSection extends StatelessWidget {
  const MobileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.appBg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.appWhiteLight.withOpacity(.1))),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: AppColors.appBgLight,
            child: Column(
              children: [
                const MobileAssetWidget(
                  title: "Balance",
                  value: "\$616.81",
                ),
                MobileAssetWidget(
                  title: "Profits",
                  value: "\$86.03",
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
                const MobileAssetWidget(
                  title: "Assets",
                  value: "12",
                  hasBorder: false,
                ),
              ],
            ),
          ),
        Container(
            padding:  const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: AppColors.appWhiteLight.withOpacity(.2)))),
            child: Row(
              children: [
                Icon(Icons.warning, color: AppColors.appYellow.withOpacity(.7)),
                const SizedBox(width: 5),
                Text(
                  "This subscription expires in a month",
                  style: AppTextStyle.medium(
                      color: AppColors.appWhiteLight.withOpacity(.9)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
