import 'package:flutter/material.dart';

import '../models/joke.dart';

class JokeByTypeGrid extends StatelessWidget {
  final List<Joke> jokes;
  const JokeByTypeGrid({super.key, required this.jokes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(jokes[index].setup),
              subtitle: Text(jokes[index].punchline),
            ),
          );
        });
  }
}
