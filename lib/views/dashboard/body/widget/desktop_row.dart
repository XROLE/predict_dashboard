import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
import 'package:predict_dashboard/views/widgets/action_label.dart';

class DesktopTableRow {
  static TableRow defaultRow() {
    return TableRow(
      children: [
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Center(
                  child: Text(
                'Symbol',
                style: AppTextStyle.medium(
                    color: AppColors.appWhiteLight.withOpacity(.9)),
              )),
            )),
        TableCell(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Center(
                child: Text(
              'Price',
              style: AppTextStyle.medium(
                  color: AppColors.appWhiteLight.withOpacity(.7)),
            )),
          ),
        )),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Center(
                  child: Text(
                'Type',
                style: AppTextStyle.medium(
                    color: AppColors.appWhiteLight.withOpacity(.7)),
              )),
            )),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Center(
                  child: Text(
                'Action',
                style: AppTextStyle.medium(
                    color: AppColors.appWhiteLight.withOpacity(.7)),
              )),
            )),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Center(
                  child: Text(
                'Quantity',
                style: AppTextStyle.medium(
                    color: AppColors.appWhiteLight.withOpacity(.7)),
              )),
            )),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Center(
                  child: Text(
                'Date',
                style: AppTextStyle.medium(
                    color: AppColors.appWhiteLight.withOpacity(.7)),
              )),
            )),
      ],
    );
  }

  static TableRow row({
    required String symbol,
    required String price,
    required String type,
    required String action,
    required String quantity,
    required String date,
  }) {
    return TableRow(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.appWhiteLight.withOpacity(.1)),
          borderRadius: BorderRadius.circular(7)),
      children: [
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Center(
                  child: Text(
                symbol,
                style: AppTextStyle.medium(
                    color: AppColors.appWhiteLight.withOpacity(.9)),
              )),
            )),
        TableCell(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Center(
                child: Text(
              price,
              style: AppTextStyle.medium(
                  color: AppColors.appWhiteLight.withOpacity(.7)),
            )),
          ),
        )),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Center(
                  child: Text(
                type,
                style: AppTextStyle.medium(
                    color: AppColors.appWhiteLight.withOpacity(.7)),
              )),
            )),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Center(
                  child: SizedBox
                  (
                    width: 43,
                    child: ActionLabel(title: action,))),
            )),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Center(
                  child: Text(
                quantity,
                style: AppTextStyle.medium(
                    color: AppColors.appWhiteLight.withOpacity(.7)),
              )),
            )),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Center(
                  child: Text(
                date,
                style: AppTextStyle.medium(
                    color: AppColors.appWhiteLight.withOpacity(.7)),
              )),
            )),
      ],
    );
  }
}
