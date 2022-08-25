import 'package:best_team/models/api_response.dart';
import 'package:best_team/services/api_client.dart';

class Repository {
  static final Repository _repository = Repository._internal();

  static Repository get() {
    return _repository;
  }

  Repository._internal();

  final ApiClient apiClient = ApiClient();

  Future<ApiResponse> fetchCompetition(String code) =>
      apiClient.fetchCompetition(code);

  Future<ApiResponse> fetchPastMonthFinishedMatches({
    required DateTime dateFrom,
    required DateTime dateTo,
    required String code,
  }) =>
      apiClient.fetchPastMonthFinishedMatches(dateFrom, dateTo, code);

  Future<ApiResponse> fetchTeam(int id) => apiClient.fetchTeam(id);
}
