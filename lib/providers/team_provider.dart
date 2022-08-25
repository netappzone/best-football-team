import 'dart:async';
import 'package:flutter/material.dart';
import '../models/api_response.dart';
import '../models/team.dart';
import '../services/repository.dart';

class TeamProvider extends ChangeNotifier {
  final Repository repository;

  TeamProvider({required this.repository});

  Team? _team;

  Team get team => _team!;

  Future<Team?> getTeams(int id) async {
    final ApiResponse apiResponse = await repository.fetchTeam(id);
    // print('TeamAPi: $apiResponse');
    final Team bestTeam;

    if (apiResponse.success) {
      bestTeam = Team.fromJson(apiResponse.data);
      _team = bestTeam;
      notifyListeners();
      return team;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
