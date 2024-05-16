import 'package:flutter/material.dart';
import 'package:predict_dashboard/domain/models/portfolio_model.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_helper.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
import 'package:predict_dashboard/views/widgets/action_label.dart';
import 'package:predict_dashboard/views/widgets/mobile_asset_widget.dart';

class MobileHeaderSection extends StatelessWidget {
  final bool isFetchingData;
  final PortfolioModel? portfolio;
  const MobileHeaderSection({
    required this.isFetchingData,
    this.portfolio,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     String? ballance;
    String? profit;
    String? assets;

    if (portfolio?.profit != null) {
      double calculatedProfit =
          AppHelper.roundTo(value: portfolio!.profit, intCountAfterDecimal: 2);
      profit = calculatedProfit.toString();
    }

    if (portfolio?.balance != null) {
      double calculatedBallance =
          AppHelper.roundTo(value: portfolio!.balance, intCountAfterDecimal: 2);
      ballance = calculatedBallance.toString();
    }

    if (portfolio?.assets != null) {
      assets = portfolio?.assets.toString();
    }

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
                 MobileAssetWidget(
                  title: "Balance",
                  value: ballance,
                  isCurrency: true,
                  isFetchingData: isFetchingData,
                ),
                MobileAssetWidget(
                  title: "Profits",
                  value: profit,
                  isFetchingData: isFetchingData,
                  isCurrency: true,
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
                MobileAssetWidget(
                  title: "Assets",
                  value: assets,
                  isFetchingData: isFetchingData,
                  hasBorder: false,
                  isCurrency: false,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
