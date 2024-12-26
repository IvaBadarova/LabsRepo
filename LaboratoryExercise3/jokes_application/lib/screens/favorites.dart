import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../models/joke.dart';

class FavoritesScreen extends StatelessWidget {
  final String type;
  final List<Joke> jokes;

  const FavoritesScreen({Key? key, required this.type, required this.jokes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Favorite $type jokes',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: jokes.isEmpty
          ? const Center(
        child: Text(
          'No favorite jokes for this type.',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];

          return ListTile(
            title: Text(joke.setup),
            subtitle: Text(joke.punchline),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                favoriteProvider.toggleFavorite(type, joke);

                // Show feedback
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Removed joke from favorites.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}