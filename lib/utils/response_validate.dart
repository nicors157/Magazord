import 'package:dio/dio.dart' show DioException, Response;
import '../models/erros/error_model.dart';

class ResponseValidate {
  static void validate({
    required Response resp,
  }) {
    int statusCode = resp.statusCode ?? 0;

    if (resp.statusCode == 200) {
      return;
    }

    if (statusCode >= 500) {
      throw ErrorModel.http(
        descricao:
            'O servidor está temporariamente fora do ar. Por favor, contate o suporte!',
      );
    }

    if ((statusCode >= 0 && statusCode < 200) || statusCode >= 400) {
      throw ErrorModel.http(
        descricao:
            'Ocorreu um erro desconhecido ao efetuar a sua requisição. Por favor, contate o suporte!',
      );
    }
  }

  static void validateDioError({
    required DioException error,
  }) {
    if (error.message!.contains('401')) {
      throw ErrorModel.expiredSession();
    }

    if (error.message != null && error.message!.contains('404')) {
      throw ErrorModel.http(
        descricao:
            'A operação solicitada não existe. Por favor, contate o suporte!',
      );
    } else if (error.message != null && error.message!.contains('429')) {
      throw ErrorModel.http(
        descricao:
            'Muitas requisições foram efetuadas nos últimos minutos. Por favor, aguarde e tente novamente mais tarde!',
      );
    } else if (error.message != null &&
        (error.message!.contains('502') || error.message!.contains('500'))) {
      throw ErrorModel.http(
        descricao:
            'O servidor está temporariamente fora do ar. Por favor, contate o suporte!',
      );
    } else if (error.message != null &&
        (error.message!.contains('SocketException') ||
            error.message!.contains('HttpException'))) {
      throw ErrorModel.http(
        descricao:
            'A conexão com a internet foi perdida. Verifique o seu WI-FI ou dados móveis para continuar!',
      );
    } else {
      throw ErrorModel.http(
        descricao:
            'Não foi possível prosseguir com a solicitação. Por favor, contate o suporte!',
      );
    }
  }
}
