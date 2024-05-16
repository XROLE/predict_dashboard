import 'package:predict_dashboard/data/remote/transactions/transaction_service.dart';
import 'package:predict_dashboard/domain/models/order_model.dart';
import 'package:predict_dashboard/domain/models/portfolio_model.dart';
import 'package:predict_dashboard/views/base/base_view_model.dart';

class DashboardViewModel extends BaseViewModel {
  final TransactionService transactionService;
  DashboardViewModel(this.transactionService);

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

  List<OrderModel?>? _orders;
  List<OrderModel?>? get orders => _orders;
  set orders(List<OrderModel?>? val) {
    _orders = val;
    notifyListeners();
  }

  init() async {
    isLoading = true;
    PortfolioModel? portfolioModel = await transactionService.fetchPortfolio();
    List<OrderModel?>? orderList = await transactionService.fetchOrders();
    isLoading = false;

    if (portfolioModel != null) {
      portfolio = portfolioModel;
    }

    if (orders != null) {
      orders = orderList;
    }
  }
}
