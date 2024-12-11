import 'package:flutter/material.dart';

class JokeTypeGrid extends StatefulWidget {
  final List<String> types;
  const JokeTypeGrid({super.key, required this.types});

  @override
  State<JokeTypeGrid> createState() => _JokeTypeGridState();
}

class _JokeTypeGridState extends State<JokeTypeGrid> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.types.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(widget.types[index]),
              onTap: () {
                Navigator.pushNamed(context, '/details',
                    arguments: widget.types[index]);
              },
            ),
          );
        });
  }
}
