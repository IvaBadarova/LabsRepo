import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/joke_types_grid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    getJokeTypes();
  }

  void getJokeTypes() async {
    ApiService.getJokeTypesFromAPI().then((response) {
      var data =
      List.from(json.decode(response.body) as List<dynamic>).cast<String>();
      setState(() {
        jokeTypes = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          leading: IconButton(
            tooltip: 'See the joke of the day',
            onPressed: () {
              Navigator.pushNamed(context, '/jokeOfTheDay');
            },
            icon: const Icon(
              Icons.auto_awesome_outlined,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Jokes App",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: JokeTypeGrid(
          types: jokeTypes,
        ));
  }
}
