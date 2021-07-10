import 'package:flutter/material.dart';
import 'package:free_games_giveaways/giveaways/data/models/giveaway.dart';

class GiveawayCard extends StatelessWidget {
  const GiveawayCard({Key? key, required this.giveaway}) : super(key: key);

  final Giveaway giveaway;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 212,
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              giveaway.image,
              height: 120,
              width: MediaQuery.of(context).size.width - 32 - 8,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    giveaway.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    giveaway.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}