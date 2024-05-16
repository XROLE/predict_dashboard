import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final Function onFilter;
  const ActionButton({required this.onFilter, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onFilter();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
            color: AppColors.appGreenLight,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            title,
            style: AppTextStyle.subTitle(),
          ),
        ),
      ),
    );
  }
}
