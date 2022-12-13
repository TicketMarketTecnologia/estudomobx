import 'package:dio/dio.dart';

class ClientesRepository {
  Future<dynamic> getClientes() async {
    try {
      var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/');
      print(response);
      return response.data["results"];
    } catch (e) {
      return [];
    }
  }
}
