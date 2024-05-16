import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';

class Footer extends StatelessWidget {
  final int startIndex;
  final int stopIndex;
  final int? itemLength;
  final bool isForwadActive;
  final Function onNextPageClicked;
  final Function onPrevPageClicked;

  const Footer({
    required this.startIndex,
    required this.stopIndex,
    this.itemLength,
    required this.onNextPageClicked,
    required this.onPrevPageClicked,
    required this.isForwadActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${itemLength == null ? 0 : startIndex} - ${itemLength == null ? 0 : stopIndex} of ${itemLength ?? 0}",
          style: AppTextStyle.caption(
              color: AppColors.appWhiteLight.withOpacity(.8)),
        ),
        if (itemLength != null)
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  onPrevPageClicked();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: startIndex > 1
                      ? AppColors.appWhiteLight.withOpacity(.8)
                      : AppColors.appWhiteLight.withOpacity(.5),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  onNextPageClicked();
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: stopIndex < itemLength!
                      ? AppColors.appWhiteLight.withOpacity(.8)
                      : AppColors.appWhiteLight.withOpacity(.5),
                ),
              ),
            ],
          )
      ],
    );
  }
}
