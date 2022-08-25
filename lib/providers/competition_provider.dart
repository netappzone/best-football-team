import 'package:best_team/models/competition.dart';
import 'package:flutter/material.dart';

import '../models/api_response.dart';
import '../services/repository.dart';
import '../utils/competition_utils.dart';
import 'match_provider.dart';

class CompetitionProvider extends ChangeNotifier {
  final Repository repository;
  final MatchProvider matchProvider;

  CompetitionProvider({required this.repository, required this.matchProvider});

  List<Competition> _allCompetition = [];

  List<Competition> get allCompetition => _allCompetition;

  Future<List<Competition>> getMatches(String code) async {
    final ApiResponse apiResponse = await repository.fetchCompetition(code);
    final List<Competition> loadedCompetition = [];

    if (apiResponse.success) {
      final result = Competition.fromJson(apiResponse.data);
      // print('Response: $result');

      // Use the `seasons` array in `competition` to get date range of matches
      final DateTime? dateTo = CompetitionUtils.getMatchesDateTo(result);

      loadedCompetition.add(result);
      _allCompetition = loadedCompetition;
      if (dateTo != null) {
        final DateTime dateFrom = CompetitionUtils.getMatchesDateFrom(dateTo);

        await matchProvider.getMatches(code, dateFrom, dateTo);
        // print('Code: $code');
        // print(matchProvider);
      } else {
        // Failed to determine the end date for match count
        throw Exception(
            'Oops! Unable to determine the best team last 30 days. Please try again later.');
      }

      notifyListeners();
      return allCompetition;
    } else {
      // Failed API call
      throw Exception(
          'Oops! Unable to determine the best team last 30 days. Please try again later.');
    }
  }
}
