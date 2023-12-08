import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s8_consumo_api/presentation/home_screen.dart';
import 'package:s8_consumo_api/providers/respuesta_provider.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RespuestaGif())],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
