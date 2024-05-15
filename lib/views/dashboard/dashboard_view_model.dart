import 'package:predict_dashboard/data/remote/transactions/transaction_service.dart';
import 'package:predict_dashboard/domain/models/portfolio_model.dart';
import 'package:predict_dashboard/views/base/base_view_model.dart';

class DashboardViewModel extends BaseViewModel {
  final TransactionService transactionService;
  DashboardViewModel(this.transactionService);

  late PortfolioModel _portfolio;
  PortfolioModel get portfolio => _portfolio;
  set portfolio(PortfolioModel val) {
    _portfolio = val;
    notifyListeners();
  }

  init() async {
    await transactionService.fetchPortfolio();
    await transactionService.fetchOrders();
  }
}
