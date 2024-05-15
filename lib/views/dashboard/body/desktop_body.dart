import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.appBgLight,
        border: Border.all(color: AppColors.appWhiteLight.withOpacity(.2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Open trades",
                style: AppTextStyle.subTitle(),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.appBgLight,
                  border: Border.all(
                      color: AppColors.appWhiteLight.withOpacity(.2)),
                ),
                child: Text(
                  "Filter",
                  style: AppTextStyle.subTitle(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Table(
            children:  [
              TableRow(
                children:  [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('Symbol', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),))),
                  TableCell(child: Center(child: Text('Price', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),))),
                  TableCell(child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align( alignment: Alignment.centerLeft,
                    child: Text('Type', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),)))),
                  TableCell(child: Align(
                    alignment: Alignment.centerLeft,
                    child:  Text('Action', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),))),
                  TableCell(child: Align( alignment: Alignment.centerLeft, child: Text('Quantity', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),))),
                  TableCell(child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Date', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),))),                
                ],
              ),
              TableRow(
                children:  [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('Symbol', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),))),
                  TableCell(child: Center(child: Text('Price', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),))),
                  TableCell(child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align( alignment: Alignment.centerLeft,
                    child: Text('Type', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),)))),
                  TableCell(child: Align(
                    alignment: Alignment.centerLeft,
                    child:  Text('Action', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),))),
                  TableCell(child: Align( alignment: Alignment.centerLeft, child: Text('Quantity', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),))),
                  TableCell(child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Date', style: AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.9)),))),                
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
