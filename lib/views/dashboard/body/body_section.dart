import 'package:flutter/material.dart';
import 'package:predict_dashboard/domain/models/order_model.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_helper.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
import 'package:predict_dashboard/utils/constants.dart';
import 'package:predict_dashboard/views/dashboard/body/widget/desktop_row.dart';
import 'package:predict_dashboard/views/dashboard/body/widget/mobile_row.dart';
import 'package:predict_dashboard/views/dashboard/footer/footer.dart';
import 'package:predict_dashboard/views/widgets/filter_widget.dart';
import 'package:predict_dashboard/views/widgets/responsive_layout_builder.dart';

class BodySection extends StatelessWidget {
  final int startIndex;
  final int stopIndex;
  final int? itemLength;
  final List<OrderModel?>? orders;
  final List<OrderModel?>? allOrders;
  final Function onFilter;
  final bool isLoading;
  final Function onNextPageClicked;
  final Function onPrevPageClicked;
   final Function(DateTime? startDate) onStartDateSelected;
  final Function(DateTime? endDate) onEndDateSelected;
  final Function(OrderModel e) onSelect;
  final Function(String e) onPriceChange;
  const BodySection({
    required this.startIndex,
    required this.stopIndex,
    required this.itemLength,
    required this.orders,
    required this.allOrders,
    required this.onNextPageClicked,
    required this.onPrevPageClicked,
    required this.onStartDateSelected,
    required this.onEndDateSelected,
    required this.onPriceChange,
    required this.onSelect,
    required this.isLoading,
    required this.onFilter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isMobile = size.width < 601 ? true : false;

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
                    if(allOrders != null){
                    showDialog(
                        context: context,
                        builder: (context) {
                          return  AlertDialog(
                             backgroundColor: Colors.transparent,
                            content:  FilterWidget(
                              onStartDateSelected: (e) => onStartDateSelected(e),
                              onEndDateSelected: (e) => onEndDateSelected(e),
                              onFilter: onFilter,
                              onPriceChange: (e) => onPriceChange(e),
                              allOrders: allOrders!,
                              onSelect: (e) => onSelect(e),
                            ));
                        });
                    }
                  },
                  child: Row(
                    children: [
                      if (!isMobile)
                        Text(
                          "Filter",
                          style: AppTextStyle.subTitle(),
                        ),
                      if (!isMobile) const SizedBox(width: 8),
                      Icon(
                        Icons.filter_list,
                        color: AppColors.appWhite,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          isLoading
              ? SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                      color: AppColors.appWhiteLight, strokeWidth: 1),
                )
              : ResponsiveLayoutBuilder(
                  mobileView: orders == null
                      ? Center(
                          child: Text(
                            Constants.noOrderFound,
                            style: AppTextStyle.medium(color: AppColors.appRed),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: orders!.length,
                          itemBuilder: (context, i) {
                            return MobileRow(
                              symbol: orders![i]!.symbol,
                              price: orders![i]!.price.toString(),
                              side: orders![i]!.side,
                              date: AppHelper.converInToDate(
                                  orders![i]!.creationTime),
                              hasBorderTop: true,
                            );
                          }),
                  desktopView: orders == null
                      ? Center(
                          child: Text(
                            Constants.noOrderFound,
                            style: AppTextStyle.medium(color: AppColors.appRed),
                          ),
                        )
                      : Table(
                          children: [
                            DesktopTableRow.defaultRow(),
                            ...List.generate(orders!.length, (i) {
                              return DesktopTableRow.row(
                                  symbol: orders![i]!.symbol,
                                  price: "${orders![i]!.price}",
                                  type: orders![i]!.type,
                                  action: orders![i]!.side,
                                  quantity: "${orders![i]!.quantity}",
                                  date: AppHelper.converInToDate(
                                      orders![i]!.creationTime));
                            }),
                          ],
                        ),
                ),
          const SizedBox(height: 20),
          Footer(
            startIndex: startIndex,
            stopIndex: stopIndex,
            itemLength: itemLength,
            isForwadActive: true,
            onPrevPageClicked: () {
              onPrevPageClicked();
            },
            onNextPageClicked: () => onNextPageClicked(),
          ),
        ],
      ),
    );
  }
}
