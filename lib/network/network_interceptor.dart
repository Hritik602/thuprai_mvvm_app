import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ///If request contains any headers then.
    ///
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint("response->" + response.data.toString());
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // if (err.response?.statusCode == 401) {
    //   //TODO: logout ,navigate to login screen
    //   // Empty navigation stack and push login screen into stack.
    // }
    super.onError(err, handler);
  }
}
