import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';

class MobileAssetWidget extends StatelessWidget {
  final String title;
  final String? value;
  final bool hasBorder;
  final Widget? profitWidget;
  final bool isFetchingData;
  final bool isCurrency;

  const MobileAssetWidget(
      {required this.title,
      required this.value,
      required this.isCurrency,
      required this.isFetchingData,
      this.hasBorder = true,
      this.profitWidget,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          border: hasBorder
              ? Border(
                  bottom: BorderSide(
                      color: AppColors.appWhiteLight.withOpacity(.1)))
              : null),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: AppTextStyle.subTitle(
                fontSize: 14,
                color: AppColors.appWhiteLight.withOpacity(.7),
              )),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isFetchingData
                  ? SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(
                        color: AppColors.appWhiteLight,
                        strokeWidth: 1,
                      ))
                  : value == null
                      ? Text(
                          "no record found",
                          style: AppTextStyle.caption(color: AppColors.appRed),
                        )
                      : Text(
                          isCurrency ? "\$${value!}" : value!,
                          style: AppTextStyle.title(
                              color: AppColors.appWhite, fontSize: 16),
                        ),
              if (profitWidget != null) const SizedBox(width: 10),
              if (profitWidget != null && value != null) profitWidget!,
            ],
          ),
        ],
      ),
    );
  }
}
