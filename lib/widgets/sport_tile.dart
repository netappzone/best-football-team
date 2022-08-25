import 'package:flutter/material.dart';

import '../common/image_widget.dart';
import '../models/team.dart';

class SportTile extends StatelessWidget {
  final Team team;
  const SportTile({
    required this.team,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      team.name ?? team.shortName ?? 'Not Available',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    orientation == Orientation.portrait
                        ? ImageWidget(
                            url: team.crestUrl,
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        'Address: (${team.address ?? 'Address unknown'})',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        'Venue: (${team.venue ?? ''})',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        "Founded: (${team.founded ?? ''})",
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              orientation == Orientation.landscape
                  ? const SizedBox(
                      width: 32,
                    )
                  : const SizedBox(),
              orientation == Orientation.landscape
                  ? ImageWidget(
                      url: team.crestUrl,
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
