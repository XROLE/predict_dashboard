import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
import 'package:predict_dashboard/views/widgets/action_label.dart';
import 'package:predict_dashboard/views/widgets/asset_widget.dart';

class DesktopHeaderSection extends StatelessWidget {
  const DesktopHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.appWhiteLight.withOpacity(.2)),
      ),
      child: Column(
        children: [
          Container(
            color: AppColors.appBgLight,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01 , vertical: 25),
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
          ),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: size.width * 0.025, vertical: 12),
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
                      color: AppColors.appWhiteLight.withOpacity(.7)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
