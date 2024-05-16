import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';

class AssetWidget extends StatelessWidget {
  final String title;
  final String? value;
  final Widget? profitWidget;
  final bool hasBorderSide;
  final bool isFetchingData;
  final bool isCurrency;
  const AssetWidget(
      {required this.title,
      required this.value,
      this.profitWidget,
      required this.isFetchingData,
      this.hasBorderSide = false,
      this.isCurrency = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width < 700 ? true : false;

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isTablet ? size.width *.03 : size.width *.05),
        decoration: BoxDecoration(
            border: hasBorderSide
                ? Border(
                    left: BorderSide(
                        color: AppColors.appWhiteLight.withOpacity(.2)))
                : null),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.subTitle(
                  fontSize: size.width < 800 ? 12 : 14,
                  color: AppColors.appWhiteLight.withOpacity(.7)),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                isFetchingData
                    ? SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: AppColors.appWhiteLight,
                          strokeWidth: 1,
                        ))
                    : value != null
                        ? Text(
                            isCurrency ? "\$$value" : value!,
                            style: AppTextStyle.title(
                                color: AppColors.appWhite,
                                fontSize: size.width < 800 ? 16 : 22),
                          )
                        : Text(
                            "no record found",
                            style:
                                AppTextStyle.caption(color: AppColors.appRed),
                          ),
                if (!isFetchingData) const SizedBox(width: 12),
                if (!isFetchingData && value != null)
                  profitWidget ?? const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
