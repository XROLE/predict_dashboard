import 'package:predict_dashboard/domain/models/order_model.dart';
import 'package:predict_dashboard/domain/models/portfolio_model.dart';

abstract class TransactionService {
  Future<PortfolioModel?> fetchPortfolio(Function(String e) onError);
  Future<List<OrderModel>?> fetchOrders(Function(String e) onError);
}
