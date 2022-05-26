import 'package:dio/dio.dart';

import 'session_provider.dart';

class ApiProviderErrorStr {
  static String error = "";
  final String _errorStr;
  ApiProviderErrorStr(this._errorStr) {
    ApiProviderErrorStr.error = _errorStr;
  }
}

class ApiProvider {
  ApiProvider();

  final String baseUrlApi = "https://elki.rent";

  Future<Dio> _dio() async {
    final SessionProvider sessionProvider = SessionProvider(key: "token");

    String key = await sessionProvider.apiKey();
    var options = BaseOptions(
      baseUrl: baseUrlApi,
      connectTimeout: 30000,
      receiveTimeout: 10000,
      validateStatus: (status) {
        return status! < 500;
      },
      //headers: {"Authorization": "Bearer " + key},
    );
    if (key != "") {
      final Iterable<MapEntry<String, String>> header = {
        MapEntry("Authorization", "Bearer $key")
      };
      options.headers.addEntries(header);
    }

    return Dio(options);
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final dio = await _dio();
      Response response = await dio.get(url, queryParameters: queryParameters);
      return _returnResponse(response);
    } catch (e) {
      throw ApiProviderErrorStr("Ошибка на сервере");
    }
  }

  Future<Response> post({
    required String url,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final dio = await _dio();
    Response response =
        await dio.post(url, data: data, queryParameters: queryParameters);
    return _returnResponse(response);
  }

  _returnResponse(Response response) {
    if (response.statusCode != null) {
      if (response.statusCode! > 299) {
        String error = response.data["message"] ??
            response.statusMessage ??
            "Ошибка на сервере";
        throw ApiProviderErrorStr(error);
      }
    } else {
      throw ApiProviderErrorStr("Ошибка на сервере!");
    }

    return response;
  }
}
