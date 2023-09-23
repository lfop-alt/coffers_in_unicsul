import 'package:coffers_in/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../../util/colors/colors_custom.dart';

class NavegacaoMotorista extends StatefulWidget {
  const NavegacaoMotorista({super.key});

  @override
  State<NavegacaoMotorista> createState() => _NavegacaoMotoristaState();
}

class _NavegacaoMotoristaState extends State<NavegacaoMotorista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: COLOR_COFFEE,
        titleTextStyle: const TextStyle(color: Colors.white),
        title: const Text("Rotas"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 600,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/images/mapa.jpg"))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text("Pedido recebido")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
