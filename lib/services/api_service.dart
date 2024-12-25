import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/characters_model.dart';

class ApiService {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<CharactersModel> getCharacters(
      {String? url, Map<String, dynamic>? args}) async {
    try {
      final response =
      await _dio.get(url ?? '/character', queryParameters: args);
      return CharactersModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}