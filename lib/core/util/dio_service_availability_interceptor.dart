import 'package:dio/dio.dart';
import 'package:easyfood_app/core/util/acesso.dart';
import 'package:easyfood_app/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class DioServiceAvailabilityInterceptor extends Interceptor {
  final GlobalKey<NavigatorState>? navigator;

  DioServiceAvailabilityInterceptor(this.navigator);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      navigator?.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
        (route) => false,
      );
    } else {
      super.onError(err, handler);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final codigoAcesso = loggedUser?.codigoAcesso;
    if (codigoAcesso != null && options.path != '/login') {
      options.headers.addAll({
        'acesso': codigoAcesso.toString(),
      });
    }
    super.onRequest(options, handler);
  }
}
