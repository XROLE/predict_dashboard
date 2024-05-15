import 'package:dio/dio.dart';
import 'package:predict_dashboard/app/core/client/app_interceptor.dart';
import 'package:predict_dashboard/app/core/endpoint/endpoint.dart';
import 'package:predict_dashboard/app/core/failure/failure.dart';
import 'package:predict_dashboard/utils/app_logger.dart';

class HttpClient {
  static String baseUrl = Endpoints.baseUrl;
  static BaseOptions opts = BaseOptions(
    baseUrl: baseUrl,
    responseType: ResponseType.json,
    connectTimeout: const Duration(seconds: 120),
    receiveTimeout: const Duration(seconds: 120),
    contentType: 'application/json',
  );

  static Dio createDio() => Dio(opts);
  static final dio = createDio();

  Future<Response?> get(String url, {Map<String, String>? headers}) async {
    dio.interceptors.add(AppInterceptor());

    try {
      Response response = await dio.get(url, options: Options(headers: headers));
      
      AppLogger.log("======================> Response $response");
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Failure("Looks like your internet is unstable, connection timed out");
      }
      if (e.response != null && e.response?.data != null && e.response?.data['message'] != null) {
        throw Failure(e.response?.data['message']);
      } else {
        throw Failure("Something went wrong please try again later");
      }
    } catch (e) {
      throw Failure("Something went wrong please try again later");
    }
  }
}