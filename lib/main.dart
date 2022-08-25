import 'package:best_team/providers/competition_provider.dart';
import 'package:best_team/providers/team_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'providers/match_provider.dart';
import 'screen/splash.dart';
import 'services/repository.dart';

void main() async {
  await dotenv.load();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft
  ]).then((_) {
    runApp(const BestTeamApp());
    const SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  });
}

class BestTeamApp extends StatelessWidget {
  const BestTeamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => TeamProvider(
                  repository: Repository.get(),
                )),
        ChangeNotifierProvider(
            create: (context) => MatchProvider(
                  repository: Repository.get(),
                  teamProvider:
                      Provider.of<TeamProvider>(context, listen: false),
                )),
        ChangeNotifierProvider(
            create: (context) => CompetitionProvider(
                  repository: Repository.get(),
                  matchProvider:
                      Provider.of<MatchProvider>(context, listen: false),
                )),
      ],
      child: MaterialApp(
        title: 'Best Football Team',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
