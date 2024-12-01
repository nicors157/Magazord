import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:teste_vaga/models/erros/error_model.dart';
import 'package:teste_vaga/services/internet_service.dart';
import 'package:teste_vaga/utils/response_validate.dart';

class HttpService {
static Future<dynamic> get({
    ///Utilize a propriedade [urlCompleta] quando desejar usar um link completo, sem interferências da base url selecionada na tela de login
    String? urlCompleta,
    Map? params,
    Map? headers,
  }) async {
    //Se não houver conexão com a internet, não é realizado a tentativa da requisição
    if (await hasInternet()) {
      try {
        String urlRequest = 'https://api.openweathermap.org/data/2.5/weather';

        final dio = Dio();

        (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
            (client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) {
            return true;
          };

          client.idleTimeout = const Duration(seconds: 60);

          client.connectionTimeout = const Duration(minutes: 2);

          return null;
        };

        if (headers != null) {
          headers.addAll({
            HttpHeaders.acceptHeader: 'application/json',
          });
        }

        Response response = await dio.get(
          urlRequest,
          queryParameters: params?.cast(),
          options: Options(
            headers: headers?.cast(),
            followRedirects: false,
            contentType: 'application/json',
            maxRedirects: 0,
            method: 'GET',
            validateStatus: (status) {
              return (status ?? 404) <= 400;
            },
          ),
        );

        ResponseValidate.validate(resp: response);

        return response.data;
      } on DioException catch (err) {
        ResponseValidate.validateDioError(error: err);
      } catch (_) {
        rethrow;
      }
    } else {
      throw ErrorModel.internet();
    }
  }
}