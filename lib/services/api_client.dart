import 'package:best_team/models/api_response.dart';
import 'package:best_team/utils/helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  Dio apiClient = Dio();

  ApiClient() {
    // Set Dio configs
    final BaseOptions options = BaseOptions(
      baseUrl: dotenv.get('BASE_URL', fallback: 'URL not found'),
      connectTimeout: 3000,
      receiveTimeout: 3000,
    );

    apiClient = Dio(options);

    apiClient.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add token to http header before request is sent
        return handler.next(requestInterceptor(options)); // Continue
      },
    ));
  }

  RequestOptions requestInterceptor(RequestOptions options) {
    options.headers.addAll({
      'X-Auth-Token': dotenv.get('APP_API_KEY', fallback: 'API Key not found')
    });

    return options;
  }

  Future<ApiResponse> fetchCompetition(String code) async {
    final String url = '/v4/competitions/$code';

    try {
      final Response response = await apiClient.get(url);

      return ApiResponse(
        success: true,
        data: response.data,
      );
    } on DioError catch (error) {
      return ApiResponse(
        success: false,
        error: error,
        stackTrace: StackTrace.current,
      );
    }
  }

  Future<ApiResponse> fetchPastMonthFinishedMatches(
      DateTime dateFrom, DateTime dateTo, String code) async {
    final String url = '/v4/competitions/$code/matches';

    try {
      final Response response = await apiClient.get(
        url,
        queryParameters: {
          'status': 'FINISHED',
          'dateFrom': Helper.formatYYYYMMDD(dateFrom),
          'dateTo': Helper.formatYYYYMMDD(dateTo),
        },
      );

      return ApiResponse(
        success: true,
        data: response.data['matches'],
      );
    } on DioError catch (error) {
      return ApiResponse(
        success: false,
        error: error,
        stackTrace: StackTrace.current,
      );
    }
  }

  Future<ApiResponse> fetchTeam(int id) async {
    final String url = '/v4/teams/$id';

    try {
      final Response response = await apiClient.get(url);

      return ApiResponse(
        success: true,
        data: response.data,
      );
    } on DioError catch (error) {
      return ApiResponse(
        success: false,
        error: error,
        stackTrace: StackTrace.current,
      );
    }
  }
}
