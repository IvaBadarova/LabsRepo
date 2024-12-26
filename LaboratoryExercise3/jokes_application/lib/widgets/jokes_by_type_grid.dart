import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../models/joke.dart';

class JokeByTypeGrid extends StatefulWidget {
  final List<Joke> jokes;

  const JokeByTypeGrid({super.key, required this.jokes});

  @override
  State<JokeByTypeGrid> createState() => _JokeByTypeGridState();
}

class _JokeByTypeGridState extends State<JokeByTypeGrid> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoritesProvider>(context);

    return ListView.builder(
      itemCount: widget.jokes.length,
      itemBuilder: (BuildContext context, int index) {
        final joke = widget.jokes[index];
        final isFavorite = favoriteProvider.isFavorite(joke.type, joke);

        return Card(
          child: ListTile(
            title: Text(joke.setup),
            subtitle: Text(joke.punchline),
            trailing: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              tooltip: isFavorite
                  ? 'Remove joke from favorites'
                  : 'Add joke to favorites',
              onPressed: () {
                favoriteProvider.toggleFavorite(joke.type, joke);
              },
            ),
          ),
        );
      },
    );
  }
}