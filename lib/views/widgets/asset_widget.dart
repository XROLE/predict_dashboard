import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';

class AssetWidget extends StatelessWidget {
  final String title;
  final String value;
  final Widget? profitWidget;
  final bool hasBorderSide;
  const AssetWidget(
      {required this.title,
      required this.value,
      this.profitWidget,
      this.hasBorderSide = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * .05),
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
                Text(
                  value,
                  style: AppTextStyle.title(color: AppColors.appWhite, fontSize: size.width < 800 ? 16 : 22),
                ),
                const SizedBox(width: 12),
                profitWidget ?? const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
