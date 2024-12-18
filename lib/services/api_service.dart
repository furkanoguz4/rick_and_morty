import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/characters_model.dart';

class ApiService{
  final _dio = Dio(
    BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api"
    ),
  );
  Future<CharactersModel> getCharacter() async{
    try{
      final response = await _dio.get("/character");
      return CharactersModel.fromJson(response.data);
    }
    catch(e){
        rethrow;
    }
  }
}