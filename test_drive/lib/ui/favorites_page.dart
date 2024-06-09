import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/big_card.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: BigCard(text: "You don't have any favorites yet."),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: BigCard(text: 'Your favorites:'),
        ),
        Column(
          children: appState.favorites.map((pair) {
            return BigCard(text: '${pair.first} ${pair.second}');
          }).toList(),
        ),
      ],
    );
  }
}
