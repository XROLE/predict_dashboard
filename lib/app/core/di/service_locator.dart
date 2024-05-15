import 'package:get_it/get_it.dart';
import 'package:predict_dashboard/app/core/client/http_client.dart';
import 'package:predict_dashboard/data/remote/transactions/transaction_service.dart';
import 'package:predict_dashboard/data/remote/transactions/transaction_service_impl.dart';

GetIt sl = GetIt.instance;

Future setupServiceLocator() async {
  sl.registerSingleton<HttpClient>(HttpClient());
  sl.registerLazySingleton<TransactionService>(
      () => TransactionServiceImpl(sl.get()));
}
