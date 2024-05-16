import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_helper.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';

class DatePickerButton extends StatefulWidget {
  final String title;
  final Function(DateTime? date) onDateSelected;
  const DatePickerButton(
      {required this.onDateSelected, required this.title, super.key});

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        widget.onDateSelected(pickedDate);
        setState(() {
          selectedDate = pickedDate;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.appWhiteLight.withOpacity(.15)),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null 
              ? AppHelper.converDateTimeToString(selectedDate!)
             : widget.title,
              style: AppTextStyle.medium(
                  color: AppColors.appWhiteLight.withOpacity(.6)),
            ),
            Icon(
              Icons.calendar_today_rounded,
              size: 18,
              color: AppColors.appWhiteLight.withOpacity(.6),
            )
          ],
        ),
      ),
    );
  }
}
