import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_helper.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final Function(String e) onChange;
  const CustomTextField({required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (e) => onChange(e),
      validator: (value) {
        return AppHelper.numberInputValidator(value);
      },
      style:
          AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.8)),
      decoration: InputDecoration(
        hintText: 'Price',
        hintStyle:
            AppTextStyle.medium(color: AppColors.appWhiteLight.withOpacity(.6)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: AppColors.appWhiteLight.withOpacity(.15)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: AppColors.appWhiteLight.withOpacity(.15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: AppColors.appWhiteLight.withOpacity(.15)),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),
    );
    ;
  }
}
