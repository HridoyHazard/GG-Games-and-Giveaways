import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

import 'package:free_games_giveaways/app/utils/launch_url.dart';
import 'package:free_games_giveaways/game_entity/data/models/game_entity.dart';

class GameHeader extends StatelessWidget {
  final GameEntity game;

  const GameHeader({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              game.thumbnail,
              height: 225,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Container(
              height: 225,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.8, 1],
                  colors: [
                    Colors.transparent,
                    Theme.of(context).canvasColor,
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                game.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  launchURL(game.gameUrl);
                },
                child: Text(
                  'Get the Game',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        GFAccordion(
          title: game.shortDescription,
          content: game.description,
          collapsedTitleBackgroundColor: Theme.of(context).canvasColor,
          textStyle: TextStyle(color: Colors.white),
          expandedTitleBackgroundColor: Theme.of(context).cardColor,
          contentBackgroundColor: Theme.of(context).cardColor,
          expandedIcon: Text(
            'hide',
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          collapsedIcon: Text(
            'show',
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
      ],
    );
  }
}
