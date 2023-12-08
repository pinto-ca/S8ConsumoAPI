import 'package:flutter/material.dart';
import 'package:s8_consumo_api/domain/entities/respuesta.dart';
import 'package:s8_consumo_api/helper/get_chuck_answer.dart';

class RespuestaGif extends ChangeNotifier {
  final _getResponse = GetChuckAnswer();

  RespuestaChuck mensaje = RespuestaChuck(value: '');

  Future<void> loadRespuesta() async {
    mensaje = await _getResponse.getRespuestaChuck();
    notifyListeners();
  }
}
