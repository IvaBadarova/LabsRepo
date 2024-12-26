import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../screens/favorites.dart';

class JokeTypeGrid extends StatefulWidget {
  final List<String> types;
  const JokeTypeGrid({super.key, required this.types});

  @override
  State<JokeTypeGrid> createState() => _JokeTypeGridState();
}

class _JokeTypeGridState extends State<JokeTypeGrid> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoritesProvider>(context);

    return ListView.builder(
      itemCount: widget.types.length,
      itemBuilder: (BuildContext context, int index) {
        final type = widget.types[index];

        return Card(
          child: ListTile(
            title: Text(type),
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: type);
            },
            trailing: IconButton(
              icon: const Icon(Icons.favorite_outline),
              tooltip: 'View Favorites',
              onPressed: () {
                final favoriteJokes =
                    favoriteProvider.favoriteJokesByType[type] ?? [];

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesScreen(
                      type: type,
                      jokes: favoriteJokes,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}