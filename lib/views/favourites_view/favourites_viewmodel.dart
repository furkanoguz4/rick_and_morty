import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/App/locator.dart';
import 'package:rick_and_morty/models/characters_model.dart';
import 'package:rick_and_morty/services/api_service.dart';
import 'package:rick_and_morty/services/prefences_service.dart';

class FavouritesViewmodel extends ChangeNotifier {
  final _preferencesService = locator<PreferencesService>();
  final _apiService = locator<ApiService>();

  List<int> _favourites = [];
  List<CharacterModel> _characters = [];
  List<CharacterModel> get characters => _characters;

  void getFavourites() {
    _favourites = _preferencesService.getSavedCharacters();
    _getCharacter();
  }

  void _getCharacter() async {
    _characters = await _apiService.getMultipleCharacters(_favourites);
    notifyListeners();
  }
}
