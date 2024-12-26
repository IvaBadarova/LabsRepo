import 'package:flutter/material.dart';
import '../models/joke.dart';

class FavoritesProvider extends ChangeNotifier {
  final Map<String, List<Joke>> _favoriteJokesByType = {};

  Map<String, List<Joke>> get favoriteJokesByType => _favoriteJokesByType;

  void toggleFavorite(String type, Joke joke) {
    if (_favoriteJokesByType.containsKey(type)) {
      if (_favoriteJokesByType[type]!.any((j) => j.id == joke.id)) {
        _favoriteJokesByType[type]!.removeWhere((j) => j.id == joke.id);
        if (_favoriteJokesByType[type]!.isEmpty) {
          _favoriteJokesByType.remove(type);
        }
      } else {
        _favoriteJokesByType[type]!.add(joke);
      }
    } else {
      _favoriteJokesByType[type] = [joke];
    }
    notifyListeners();
  }

  bool isFavorite(String type, Joke joke) {
    return _favoriteJokesByType[type]?.any((j) => j.id == joke.id) ?? false;
  }
}