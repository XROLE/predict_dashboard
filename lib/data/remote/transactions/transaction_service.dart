import 'package:predict_dashboard/domain/models/order_model.dart';
import 'package:predict_dashboard/domain/models/portfolio_model.dart';

abstract class TransactionService {
  Future<PortfolioModel?> fetchPortfolio();
  Future<List<OrderModel?>?> fetchOrders();
}
