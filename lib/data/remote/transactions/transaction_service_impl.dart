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

      return PortfolioModel.fromJson(res?.data["data"]["portfolio"]);
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
      String url = Endpoints.orders;

      final Response? res = await client.get(url);
      List orderList = res?.data["data"]["orders"];
      List<OrderModel> orders = orderList.map((el) {
        return OrderModel.fromJson(el);
      }).toList();

      return orders;
    } on Failure catch (e) {
      AppLogger.log("Error =======> $e");
      return null;
    } catch (e) {
      AppLogger.log("Error =======> $e");
      return null;
    }
  }
}
