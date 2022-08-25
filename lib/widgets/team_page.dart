import 'package:best_team/providers/team_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';
import '../providers/competition_provider.dart';
import 'sport_tile.dart';

class TeamPage extends StatelessWidget {
  final String code;
  final String name;
  const TeamPage({required this.code, required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final competition = Provider.of<CompetitionProvider>(context);
    final bestTeam = Provider.of<TeamProvider>(context);

    return Scaffold(
        backgroundColor: Constants.kGreyColor,
        appBar: AppBar(
          backgroundColor: Constants.kGreyColor,
          title: Text('Best Team in $name 👏 👏 '),
          centerTitle: true,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: competition.getMatches(code),
            builder: (context, snapshot) {
              if (competition.allCompetition.isEmpty) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                    physics: const ScrollPhysics(),
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    shrinkWrap: true,
                    itemCount: competition.allCompetition.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SportTile(team: bestTeam.team);
                    });
              }
            }));
  }
}
