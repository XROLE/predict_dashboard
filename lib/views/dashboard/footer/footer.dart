import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';

class Footer extends StatelessWidget {
  final bool isForwadActive;

  const Footer({required this.isForwadActive, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "1 - 5 of 30",
          style: AppTextStyle.caption(color: AppColors.appWhiteLight.withOpacity(.8)),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: isForwadActive ? AppColors.appWhiteLight.withOpacity(.5): AppColors.appWhiteLight.withOpacity(.8),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: isForwadActive ? AppColors.appWhiteLight.withOpacity(.8): AppColors.appWhiteLight.withOpacity(.5),
              ),
            ),
          ],
        )
      ],
    );
  }
}
