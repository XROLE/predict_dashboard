import 'package:predict_dashboard/data/remote/transactions/transaction_service.dart';
import 'package:predict_dashboard/domain/models/order_model.dart';
import 'package:predict_dashboard/domain/models/portfolio_model.dart';
import 'package:predict_dashboard/views/base/base_view_model.dart';

class DashboardViewModel extends BaseViewModel {
  final TransactionService transactionService;
  DashboardViewModel(this.transactionService);

  String? filterSymbol;
  double? filterPrice;
  DateTime? filterStartDate;
  DateTime? filterEndDate;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  PortfolioModel? _portfolio;
  PortfolioModel? get portfolio => _portfolio;
  set portfolio(PortfolioModel? val) {
    _portfolio = val;
    notifyListeners();
  }

  List<OrderModel>? _orders;
  List<OrderModel>? get orders => _orders;
  set orders(List<OrderModel>? val) {
    _orders = val;
    notifyListeners();
  }

  List<OrderModel>? _ordersToDisplay;
  List<OrderModel>? get ordersToDisplay => _ordersToDisplay;
  set ordersToDisplay(List<OrderModel>? val) {
    _ordersToDisplay = val;
    notifyListeners();
  }

  int _pageToDisplay = 0;
  int get pageToDisplay => _pageToDisplay;
  set pageToDisplay(int val) {
    _pageToDisplay = val;
    notifyListeners();
  }

  int _pageCount = 0;
  int get pageCount => _pageCount;
  set pageCount(int val) {
    _pageCount = val;
    notifyListeners();
  }

  int _startIndex = 0;
  int get startIndex => _startIndex;
  set startIndex(int val) {
    _startIndex = val;
    notifyListeners();
  }

  int _stopIndex = 0;
  int get stopIndex => _stopIndex;
  set stopIndex(int val) {
    _stopIndex = val;
    notifyListeners();
  }

  init({
    required Function(String e) onPortfolioFetchingError,
    required Function(String e) onOrdersFetchingError,
  }) async {
    isLoading = true;
    PortfolioModel? portfolioModel =
        await transactionService.fetchPortfolio(onPortfolioFetchingError);
    List<OrderModel>? orderList =
        await transactionService.fetchOrders(onOrdersFetchingError);
    isLoading = false;

    if (portfolioModel != null) {
      portfolio = portfolioModel;
    }

    if (orderList != null) {
      orders = orderList;
      pageCount = (orders!.length / 5).ceil();
      paginate(val: orders!, pageNumber: 0);
    }
  }

  void paginate({required List<OrderModel> val, required int pageNumber}) {
    int maxPage = (val.length / 5).ceil();
    if (pageNumber > maxPage) return;
    if (pageNumber < 0) return;

    int start = pageNumber * 5;

    if (start < val.length) {
      startIndex = start + 1;
      int countSteps = val.length - start;
      late int stop;

      stop = countSteps > 5 ? start + 5 : start + countSteps;
      stopIndex = stop;

      List<OrderModel> newPageOrder = val.sublist(start, stop);
      ordersToDisplay = newPageOrder;
    }
  }

  void clearFilterQuery() {
    filterSymbol = null;
    filterPrice = null;
    filterStartDate = null;
    filterEndDate = null;

    notifyListeners();
  }

  List<OrderModel>? filterOrders(
      {required String? symbol,
      required double? price,
      required DateTime? startDate,
      required DateTime? endDate,
      required List<OrderModel>? allOrder}) {
    List<OrderModel>? filteredOrder = allOrder;

    if (symbol == null &&
        price == null &&
        startDate == null &&
        endDate == null) {
      return null;
    }

    if (filteredOrder != null && filteredOrder.isNotEmpty) {
      if (symbol != null) {
        filteredOrder =
            filteredOrder.where((el) => el?.symbol == symbol).toList();
      }

      if (price != null) {
        filteredOrder =
            filteredOrder.where((el) => el?.price == price).toList();
      }
    }

    return filteredOrder;
  }
}
