import 'package:flutter/material.dart';
import 'package:predict_dashboard/domain/models/order_model.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
import 'package:predict_dashboard/utils/order_constant.dart';
import 'package:predict_dashboard/views/widgets/action_button.dart';
import 'package:predict_dashboard/views/widgets/custom_text_field.dart';
import 'package:predict_dashboard/views/widgets/date_picker_button.dart';

class FilterWidget extends StatefulWidget {
  final List<OrderModel?> allOrders;
  final Function(OrderModel e) onSelect;
  final Function(DateTime? startDate) onStartDateSelected;
  final Function(DateTime? endDate) onEndDateSelected;
  final Function onFilter;
  final Function(String e) onPriceChange;
  const FilterWidget({
    required this.allOrders,
    required this.onSelect,
    required this.onFilter,
    required this.onStartDateSelected,
    required this.onEndDateSelected,
    required this.onPriceChange,
    super.key,
  });

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final _formKey = GlobalKey<FormState>();

  OrderModel selectedItem = baseOrder;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: 500,
          height: 285,
          decoration: BoxDecoration(
              color: AppColors.appBgLight,
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.appWhiteLight.withOpacity(.15)),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: DropdownButton<OrderModel>(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.appWhiteLight.withOpacity(.6),
                            size: 20,
                          ),
                          isExpanded: true,
                          dropdownColor: AppColors.appBg,
                          underline: const SizedBox(),
                          value: selectedItem,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          items: [...widget.allOrders, baseOrder]
                              .map((e) => DropdownMenuItem<OrderModel>(
                                  value: e,
                                  child: Text(
                                    e!.symbol,
                                    style: AppTextStyle.medium(
                                        color: AppColors.appWhiteLight
                                            .withOpacity(.8)),
                                  )))
                              .toList(),
                          onChanged: (e) {
                            if (e != null) {
                              setState(() {
                                selectedItem = e;
                              });
                            }
                            if (e != null) {
                              widget.onSelect(e);
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(
                        onChange: (e) {
                          _formKey.currentState!.validate();
                          widget.onPriceChange(e);
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Date range",
                  style: AppTextStyle.subTitle(),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: DatePickerButton(
                      onDateSelected: (e) => widget.onStartDateSelected(e),
                      title: "Start date",
                    )),
                    const SizedBox(width: 12),
                    Expanded(
                        child: DatePickerButton(
                      title: "End date",
                      onDateSelected: (e) => widget.onEndDateSelected(e),
                    )),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    ActionButton(
                        onFilter: widget.onFilter,
                        title: "Filter table")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
