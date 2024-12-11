import 'package:flutter/material.dart';

import '../models/joke.dart';

class JokeOfTheDayWidget extends StatelessWidget {
  final Joke joke;
  const JokeOfTheDayWidget({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.all(20.0),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(joke.setup,
                    style: const TextStyle(fontSize: 25),
                    textAlign: TextAlign.center)),
          ),
          Card(
            margin: const EdgeInsets.all(20.0),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(joke.punchline,
                    style: const TextStyle(fontSize: 25),
                    textAlign: TextAlign.center)),
          ),
        ]);
  }
}
