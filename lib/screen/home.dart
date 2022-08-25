import 'package:flutter/material.dart';

import '../common/constants.dart';
import '../common/text_scale_factor_clamper.dart';
import '../widgets/league_container.dart';
import '../widgets/team_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Constants.kGreyColor,
            Constants.kWhiteColor,
          ],
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(1, 1),
          stops: [0.0, 1.0],
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              Column(children: [
                Text(
                  '⚽ Football ⚽',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Constants.kWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Divider(
                  color: Constants.kWhiteColor,
                  indent: 10,
                  endIndent: 10,
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  GestureDetector(
                      child:
                          const LeagueContainer(image: 'assets/images/pl.png'),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TextScaleFactorClamper(
                              child:
                                  TeamPage(code: 'PL', name: 'Premier League'),
                            ),
                          ))),
                  GestureDetector(
                      child: const LeagueContainer(
                          image: 'assets/images/laliga.png'),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TextScaleFactorClamper(
                              child: TeamPage(code: 'PD', name: 'La Liga'),
                            ),
                          ))),
                  GestureDetector(
                      child: const LeagueContainer(
                          image: 'assets/images/bundesliga.png'),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TextScaleFactorClamper(
                              child: TeamPage(code: 'BL1', name: 'Bundesliga'),
                            ),
                          ))),
                  GestureDetector(
                      child: const LeagueContainer(
                          image: 'assets/images/seria.png'),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TextScaleFactorClamper(
                              child: TeamPage(code: 'SA', name: 'Serial A'),
                            ),
                          ))),
                  GestureDetector(
                      child: const LeagueContainer(
                          image: 'assets/images/ligue1.png'),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TextScaleFactorClamper(
                              child: TeamPage(code: 'FL1', name: 'Ligue 1'),
                            ),
                          ))),
                  GestureDetector(
                      child:
                          const LeagueContainer(image: 'assets/images/nos.png'),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TextScaleFactorClamper(
                              child:
                                  TeamPage(code: 'PPL', name: 'Primerira Liga'),
                            ),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
