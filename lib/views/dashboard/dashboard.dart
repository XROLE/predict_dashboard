import 'package:flutter/material.dart';
import 'package:predict_dashboard/app/core/di/service_locator.dart';
import 'package:predict_dashboard/data/remote/transactions/transaction_service.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
import 'package:predict_dashboard/views/base/base_view.dart';
import 'package:predict_dashboard/views/dashboard/body/desktop_body.dart';
import 'package:predict_dashboard/views/dashboard/dashboard_view_model.dart';
import 'package:predict_dashboard/views/dashboard/header/desktop_header.dart';
import 'package:predict_dashboard/views/dashboard/header/mobile_header.dart';
import 'package:predict_dashboard/views/widgets/responsive_layout_builder.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardDesktopState();
}

class _DashboardDesktopState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BaseView<DashboardViewModel>(
          model: DashboardViewModel(sl.get<TransactionService>()),
          onModelReady: (model) {
            // model.init();
          },
          builder: (context, model, _) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.appBg,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: 25),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi Robin,", style: AppTextStyle.title()),
                      Text("Here is an overview of your account activities.",
                          style: AppTextStyle.subTitle(
                              color: AppColors.appWhiteLight.withOpacity(.9))),
                      const SizedBox(height: 40),
                      const ResponsiveLayoutBuilder(
                        mobileView: MobileHeaderSection(),
                        desktopView: DesktopHeaderSection(),
                      ),
                      const SizedBox(height: 40),
                      DesktopBody(
                        onFilter: () {},
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
