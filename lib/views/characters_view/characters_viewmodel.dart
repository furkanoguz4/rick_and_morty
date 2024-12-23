import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/App/locator.dart';
import 'package:rick_and_morty/models/characters_model.dart';
import 'package:rick_and_morty/services/api_service.dart';

class CharactersViewModal extends ChangeNotifier {
  final _apiService = locator<ApiService>();

  CharactersModel? _charactersModel;

  CharactersModel? get charactersModel => _charactersModel;

  void getCharacters() async {
    _charactersModel = await _apiService.getCharacters();
    notifyListeners();
  }

  bool loadMore = false;

  void getCharactersMore() async {
    if (loadMore) return;
    loadMore = true;
    final data = await _apiService.getCharacters(
        url: _charactersModel?.info.next.toString());
    _charactersModel!.info = data.info;
    _charactersModel!.characters.addAll(data.characters);
    loadMore = false;
    notifyListeners();
  }
}
