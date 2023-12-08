import 'package:dio/dio.dart';
import 'package:s8_consumo_api/domain/entities/respuesta.dart';

class GetChuckAnswer {
  final String url = "https://api.chucknorris.io/jokes/random";
  final _dio = Dio();

  Future<RespuestaChuck> getRespuestaChuck() async {
    final response = await _dio.get(url);
    final Respuesta = RespuestaChuck.fromJson(response.data);
    return Respuesta;
  }
}
