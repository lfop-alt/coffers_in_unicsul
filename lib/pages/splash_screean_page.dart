import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffers_in/pages/login/login_page.dart';
import 'package:coffers_in/services/login_service.dart';
import 'package:coffers_in/util/colors/colors_custom.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreeanPage extends StatefulWidget {
  const SplashScreeanPage({super.key});

  @override
  State<SplashScreeanPage> createState() => _SplashScreeanPageState();
}

class _SplashScreeanPageState extends State<SplashScreeanPage> {
  final LoginService _loginService = LoginService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 6), () {
      _loginService.isAuth().then(
            (value) => value
                ? Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  )
                : Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: COLOR_COFFEE,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 80.0),

            const Icon(
              Icons.coffee,
              size: 100,
            ),
            const SizedBox(height: 100.0),
            SizedBox(
              width: 150,
              child: TextLiquidFill(
                text: "IN",
                loadDuration: const Duration(seconds: 6),
                waveColor: Colors.black,
                boxBackgroundColor: COLOR_COFFEE,
                textStyle: const TextStyle(
                    fontSize: 100, fontWeight: FontWeight.w800, inherit: false),
              ),
            )
            // DefaultTextStyle(
            //   style: const TextStyle(
            //     fontSize: 55,
            //     fontWeight: FontWeight.w800,
            //     fontFamily: "Horizon",
            //   ),
            //   child: AnimatedTextKit(
            //     animatedTexts: [
            //       RotateAnimatedText(
            //         "IN",
            //         textStyle: const TextStyle(color: Colors.black),
            //       ),
            //       RotateAnimatedText(
            //         "IN",
            //         textStyle: const TextStyle(color: Colors.white),
            //       ),
            //       RotateAnimatedText(
            //         "IN",
            //         textStyle: const TextStyle(color: Colors.grey),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
