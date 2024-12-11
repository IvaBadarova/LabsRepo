import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/details.dart';
import './screens/joke_of_the_day.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/details': (context) => const Details(),
        '/jokeOfTheDay': (context) => const JokeOfTheDay(),
      },
    );
  }
}
