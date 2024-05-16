import 'package:flutter/material.dart';
import 'package:predict_dashboard/app/core/di/service_locator.dart';
import 'package:predict_dashboard/data/remote/transactions/transaction_service.dart';
import 'package:predict_dashboard/domain/models/order_model.dart';
import 'package:predict_dashboard/utils/app_colors.dart';
import 'package:predict_dashboard/utils/app_flushbar.dart';
import 'package:predict_dashboard/utils/app_text_style.dart';
import 'package:predict_dashboard/utils/constants.dart';
import 'package:predict_dashboard/views/base/base_view.dart';
import 'package:predict_dashboard/views/dashboard/body/body_section.dart';
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
            model.init(
              onOrdersFetchingError: (errorMessage) => AppFlushBar.showError(
                  context: context, message: errorMessage),
              onPortfolioFetchingError: (errorMessage) {
                // This is empty to avoid double toast showing on user screen
              },
            );
          },
          builder: (context, model, _) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.appBg,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04, vertical: 25),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi Robin,",
                          style: AppTextStyle.title(
                              fontSize: size.width < 800 ? 18 : 22)),
                      Text("Here is an overview of your account activities.",
                          style: AppTextStyle.subTitle(
                              color: AppColors.appWhiteLight.withOpacity(.9))),
                      SizedBox(height: size.width < 600 ? 30 : 40),
                      ResponsiveLayoutBuilder(
                        mobileView: MobileHeaderSection(
                          isFetchingData: model.isLoading,
                          portfolio: model.portfolio,
                        ),
                        desktopView: DesktopHeaderSection(
                          portfolio: model.portfolio,
                          isFetchingData: model.isLoading,
                        ),
                      ),
                      SizedBox(height: size.width < 600 ? 20 : 40),
                      BodySection(
                        startIndex: model.startIndex,
                        stopIndex: model.stopIndex,
                        itemLength: model.orders?.length,
                        orders: model.ordersToDisplay,
                        allOrders: model.orders,
                        isLoading: model.isLoading,
                        onStartDateSelected: (e) {
                          model.filterStartDate = e;
                        },
                        onEndDateSelected: (e) {
                          model.filterEndDate = e;
                        },
                        onPriceChange: (e) {
                          double? price = double.tryParse(e);
                          if (price != null) {
                            model.filterPrice = price;
                          }
                        },
                        onSelect: (e) {
                          model.filterSymbol = e.symbol;
                        },
                        onNextPageClicked: () {
                          if (model.pageCount > model.pageToDisplay) {
                            model.pageToDisplay++;
                            model.paginate(
                                val: model.orders!,
                                pageNumber: model.pageToDisplay);
                          }
                        },
                        onPrevPageClicked: () {
                          if (model.pageToDisplay > 0) {
                            model.pageToDisplay--;
                            model.paginate(
                                val: model.orders!,
                                pageNumber: model.pageToDisplay);
                          }
                        },
                        onFilter: () {
                          String? filterSymbol = model.filterSymbol;
                          double? filterPrice = model.filterPrice;
                          DateTime? filterStartDate = model.filterStartDate;
                          DateTime? filterEndDate = model.filterEndDate;

                          if (filterSymbol == null &&
                              filterPrice == null &&
                              filterStartDate == null &&
                              filterEndDate == null) {
                            AppFlushBar.showError(
                                message: Constants.emptySearchQueryError,
                                context: context);
                            return;
                          }

                          if (filterStartDate != null &&
                              filterEndDate != null) {
                            if (filterStartDate.isAfter(filterEndDate)) {
                              AppFlushBar.showError(
                                  message: Constants.startDateGreaterError,
                                  context: context);
                              return;
                            }
                          }

                          List<OrderModel>? filteredOrder = model.filterOrders(
                            symbol: filterSymbol,
                            price: filterPrice,
                            startDate: filterStartDate,
                            endDate: filterEndDate,
                            allOrder: model.orders,
                          );

                          if (filteredOrder != null) {
                            model.ordersToDisplay = filteredOrder;
                          }
                          model.clearFilterQuery();
                          Navigator.pop(context);
                        },
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
