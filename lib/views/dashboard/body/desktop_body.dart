import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
import 'package:predict_dashboard/views/dashboard/body/widget/desktop_row.dart';
import 'package:predict_dashboard/views/dashboard/body/widget/mobile_row.dart';
import 'package:predict_dashboard/views/dashboard/footer/footer.dart';
import 'package:predict_dashboard/views/widgets/responsive_layout_builder.dart';

class DesktopBody extends StatelessWidget {
  final Function() onFilter;
  const DesktopBody({required this.onFilter, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: GestureDetector(
                  onTap: () {
                    onFilter();
                  },
                  child: Text(
                    "Filter",
                    style: AppTextStyle.subTitle(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ResponsiveLayoutBuilder(
            mobileView: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const MobileRow(
                    symbol: "MINAUSDT",
                    price: "1.5636",
                    action: "Sell",
                    date: "19 Dec, 2023",
                    hasBorderTop: true,
                  );
                }),
            desktopView: Table(
              children: [
                DesktopTableRow.defaultRow(),
                ...List.generate(5, (index) {
                  return DesktopTableRow.row(
                      symbol: "MINAUSDT",
                      price: "1.5636",
                      type: "LMT",
                      action: "Sell",
                      quantity: "0",
                      date: "19 Dec, 2023");
                }),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Footer(
            isForwadActive: true,
          ),
        ],
      ),
    );
  }
}
