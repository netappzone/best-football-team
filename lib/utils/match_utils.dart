import 'package:best_team/models/match.dart';
import 'package:best_team/models/team.dart';

class MatchUtils {
  /// Get a map of teams with their total games won.
  ///
  /// NOTE: Only teams with at least one game won will be in map.
  static Map<Team, int> getTeamWinMap(List<Match> matches) {
    final Map<Team, int> teamWinMap = {};

    for (final Match match in matches) {
      // Guard against null home/away team, skip to next `Match` iteration
      if (match.homeTeam == null || match.awayTeam == null) continue;

      switch (match.matchWinner) {
        case MatchWinner.homeTeam:
          teamWinMap.update(
            match.homeTeam!,
            (value) => value + 1,
            ifAbsent: () {
              return 1;
            },
          );
          break;
        case MatchWinner.awayTeam:
          teamWinMap.update(
            match.awayTeam!,
            (value) => value + 1,
            ifAbsent: () {
              return 1;
            },
          );
          break;
        case MatchWinner.draw:
        default:
          break;
      }
    }

    return teamWinMap;
  }

  /// Get the team that won most matches in last 30 days.
  ///
  /// If map param input is empty map, returns null.
  static Team? getBestTeam(Map<Team, int> teamWinMap) {
    // Guard against empty map
    if (teamWinMap.isEmpty) return null;

    int bestWinCount = 0;
    Team? bestTeam;

    teamWinMap.forEach((team, winCount) {
      if (winCount > bestWinCount) {
        bestWinCount = winCount;
        bestTeam = team;
      }
    });
    return bestTeam;
  }

  /// Parse JSON string from server response to get [MatchWinner] enum.
  static MatchWinner parseMatchWinner(String string) {
    switch (string) {
      case 'HOME_TEAM':
        return MatchWinner.homeTeam;
      case 'AWAY_TEAM':
        return MatchWinner.awayTeam;
      case 'DRAW':
      default:
        return MatchWinner.draw;
    }
  }
}
