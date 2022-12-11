import 'package:dio/dio.dart';
import 'package:home_auto/utility/config/.env.dart';

class HostBaseUrl {
  static BaseOptions _options() => BaseOptions(
        baseUrl: "$hostUrl/",
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000, // 60 seconds
        // headers: {
        //   'Authorization': 'Bearer $token',
        // },
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
      );

  Future<Dio> hostDio() async {
    try {
      return Dio(_options());
    } catch (e) {
      rethrow;
    }
  }
}
