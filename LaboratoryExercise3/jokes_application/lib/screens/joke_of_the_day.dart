import 'package:flutter/material.dart';

import '../models/joke.dart';
import '../services/api_service.dart';
import '../widgets/joke_of_the_day.dart';

class JokeOfTheDay extends StatefulWidget {
  const JokeOfTheDay({Key? key}) : super(key: key);

  @override
  State<JokeOfTheDay> createState() => _JokeOfTheDayState();
}

class _JokeOfTheDayState extends State<JokeOfTheDay> {
  Joke joke = Joke(id: 1, punchline: "", setup: "", type: "");

  @override
  void initState() {
    super.initState();
    getRndomJoke();
  }

  Future<void> getRndomJoke() async {
    final response = await ApiService.getRndomJokeAPI();
    setState(() {
      joke = Joke.fromJson(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            "Joke of the day",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: JokeOfTheDayWidget(
          joke: joke,
        ));
  }
}
