import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';

class ActionLabel extends StatelessWidget {
  final String title;
  final Icon? icon;
  final bool isProfit;
  const ActionLabel({required this.title, this.icon, this.isProfit = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: isProfit ? AppColors.appGreen.withOpacity(.7) : AppColors.appRed)),
      child: Row(
        children: [
          icon ?? const SizedBox(),
          if(icon != null) const SizedBox(width: 5),
          Text(title, style: AppTextStyle.medium(color: isProfit ? AppColors.appGreen.withOpacity(.7) : AppColors.appRed)),
        ],
      ),
    );
  }
}
