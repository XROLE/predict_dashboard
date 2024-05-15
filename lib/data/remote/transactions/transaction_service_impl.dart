import 'package:dio/dio.dart';
import 'package:predict_dashboard/app/core/client/http_client.dart';
import 'package:predict_dashboard/app/core/endpoint/endpoint.dart';
import 'package:predict_dashboard/app/core/failure/failure.dart';
import 'package:predict_dashboard/data/remote/transactions/transaction_service.dart';
import 'package:predict_dashboard/domain/models/order_model.dart';
import 'package:predict_dashboard/domain/models/portfolio_model.dart';
import 'package:predict_dashboard/utils/app_logger.dart';

class TransactionServiceImpl implements TransactionService {
  final HttpClient client;

  TransactionServiceImpl(this.client);
  @override
  Future<PortfolioModel?> fetchPortfolio() async {
    try {
      String url = Endpoints.portfolio;

      final Response? res = await client.get(url);
      AppLogger.log("Portfolios ==================> $res");
      AppLogger.log("res ==================> ${res?.data}");

      return PortfolioModel(
          balance: 300.0, profit: 300.0, profitPercentage: 300, assets: 300);
    } on Failure catch (e) {
      AppLogger.log("Error =======> $e");
      return null;
    } catch (e) {
      AppLogger.log("Error =======> $e");
      return null;
    }
  }

  @override
  Future<List<OrderModel?>?> fetchOrders() async {
    try {
      String url = Endpoints.portfolio;

      final Response? res = await client.get(url);
      AppLogger.log("Portfolios ==================> $res");
      AppLogger.log("res ==================> ${res?.data}");

      return [OrderModel(symbol: "symbol", type: "type", side: "side", quantity: 33.0, creationTime: 600, price: 900)];
    } on Failure catch (e) {
      AppLogger.log("Error =======> $e");
      return null;
    } catch (e) {
      AppLogger.log("Error =======> $e");
      return null;
    }
  }
}
