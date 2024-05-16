import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
import 'package:predict_dashboard/views/widgets/action_label.dart';

class MobileRow extends StatelessWidget {
  final String symbol;
  final String price;
  final String side;
  final String date;
  final bool hasBorderTop;
  const MobileRow({
    required this.symbol,
    required this.price,
    required this.side,
    required this.date,
    this.hasBorderTop = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border(
        top:  BorderSide(
          color: AppColors.appWhiteLight.withOpacity( hasBorderTop ? .1 : 0),
        ),
        bottom: BorderSide(
          color: AppColors.appWhiteLight.withOpacity(.1),
        ),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    symbol,
                    style: AppTextStyle.medium(
                        color: AppColors.appWhiteLight.withOpacity(.9)),
                  ),
                  const SizedBox(height: 8),
                  ActionLabel(title: side),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: AppTextStyle.medium(
                        color: AppColors.appWhiteLight.withOpacity(.9)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    date,
                    style: AppTextStyle.medium(
                        color: AppColors.appWhiteLight.withOpacity(.7)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
