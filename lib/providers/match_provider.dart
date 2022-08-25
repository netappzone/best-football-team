import 'package:flutter/material.dart';

import '../models/api_response.dart';
import '../models/match.dart';
import '../models/team.dart';
import '../services/repository.dart';
import '../utils/match_utils.dart';
import 'team_provider.dart';

class MatchProvider extends ChangeNotifier {
  final Repository repository;
  final TeamProvider teamProvider;

  MatchProvider({required this.repository, required this.teamProvider});

  Future<List<Match>> getMatches(
      String code, DateTime dateFrom, DateTime dateTo) async {
    final ApiResponse apiResponse =
        await repository.fetchPastMonthFinishedMatches(
      dateFrom: dateFrom,
      dateTo: dateTo,
      code: code,
    );

    if (apiResponse.success) {
      final List matchesJsonArray = apiResponse.data as List? ?? [];

      final List<Match> matches =
          // ignore: unnecessary_lambdas
          matchesJsonArray.map((e) => Match.fromJson(e)).toList();

      // Get best team from the matches
      final Map<Team, int> map = MatchUtils.getTeamWinMap(matches);
      final Team? team = MatchUtils.getBestTeam(map);

      if (team != null && team.id != null) {
        // Acquired the best team last 30 days, get full detail of said team
        await teamProvider.getTeams(team.id!);
      } else {
        throw Exception(
            'Oops! Unable to determine the best team last 30 days. Please try again later.');
      }

      notifyListeners();
      return matches;
    } else {
      throw Exception(
          'Oops! Unable to determine the best team last 30 days. Please try again later.');
    }
  }
}
