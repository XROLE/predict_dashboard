import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptor extends Interceptor {
  /// This is the base setup for intercepting requests, we can do stuffs like 
  /// passing headers as well as blocking certain endpoint calls
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

      debugPrint("options: $options");

    super.onRequest(options, handler);
  }

/// This is the base setup for intercepting responses, we can do stuffs like 
/// decoding the error messages and converting it to our own error type etc. 
/// It is also the best place to perform token refresh functinality 
/// should there be one
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    RequestOptions options = RequestOptions(path: "", data: {});

    debugPrint("options: $options");

    super.onResponse(response, handler);
  }
}
