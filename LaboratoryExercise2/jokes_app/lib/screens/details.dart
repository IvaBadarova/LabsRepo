import 'package:flutter/material.dart';

import '../models/joke.dart';
import '../services/api_service.dart';
import '../widgets/joke_by_type_grid.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Joke> jokes = [];
  String type = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as String;
    type = arguments;
    if (type.isNotEmpty) {
      getJokesByType(type);
    }
  }

  void getJokesByType(String type) async {
    ApiService.getJokesByTypeAPI(type).then((response) {
      setState(() {
        jokes = (response as List<dynamic>)
            .map((joke) => Joke.fromJson(joke))
            .toList();
      });
    }).catchError((error) {
      print("Error: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    final String type = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            '$type Jokes',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: JokeByTypeGrid(
          jokes: jokes,
        ));
  }
}
