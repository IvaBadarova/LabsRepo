import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/home.dart';
import './screens/details.dart';
import './screens/joke_of_the_day.dart';
import './providers/favorites_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: MaterialApp(
        title: 'Jokes',
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/details': (context) => const Details(),
          '/jokeOfTheDay': (context) => const JokeOfTheDay(),
        },
      ),
    );
  }
}