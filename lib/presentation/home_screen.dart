import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s8_consumo_api/domain/entities/respuesta.dart';
import 'package:s8_consumo_api/providers/respuesta_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController questionController = TextEditingController();

  void showResponse(RespuestaChuck respuestaGif) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (respuestaGif.value != null && respuestaGif.value!.isNotEmpty)
                Text(
                  respuestaGif.value!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text('Cerrar'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final respuestaProvider = context.watch<RespuestaGif>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trending Chuck Norris',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 81, 123, 158),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://e0.pxfuel.com/wallpapers/870/769/desktop-wallpaper-chuck-norris-ymrh6fa.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add any additional widgets here if needed
                ElevatedButton(
                  onPressed: () async {
                    await respuestaProvider.loadRespuesta();
                    showResponse(respuestaProvider.mensaje);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Hablame de Chuck Norris',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
