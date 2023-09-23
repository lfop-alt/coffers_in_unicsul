import 'package:coffers_in/pages/login/created_account_page.dart';
import 'package:coffers_in/pages/home_page.dart';
import 'package:coffers_in/repository/login_repository.dart';
import 'package:coffers_in/services/login_service.dart';
import 'package:flutter/material.dart';

import '../../util/colors/colors_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginRepository loginRepository = LoginRepository();
  final LoginService _loginService = LoginService();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              // color: COLOR_COFFEE,
              decoration: BoxDecoration(
                color: COLOR_COFFEE,
                borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(70),
                    bottomEnd: Radius.circular(70)),
              ),
              child: const Center(
                  child: Icon(
                Icons.coffee,
                size: 70,
              )),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: TextField(
                controller: loginController,
                decoration: const InputDecoration(
                    hintText: "Digite seu usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    prefixIcon: Icon(Icons.email)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Digite sua senha",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    prefixIcon: Icon(Icons.key)),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 5, 0),
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {}, child: const Text("Esqueceu a senha ?")),
            ),
            const SizedBox(
              height: 50,
            ),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      var response = await loginRepository.realizarLogin(
                          loginController.text.trim(),
                          passwordController.text.trim());

                      if (response.statusCode == 200) {
                        await _loginService.saveTokenSharedPreference(
                            response.data["sessionToken"]);
                        await _loginService.saveObjectIdSharedPreference(
                            response.data["objectId"]);

                        await _loginService
                            .saveEmailSharedPreference(response.data["email"]);
                        await _loginService.saveUserNameSharedPreference(
                            response.data["username"]);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(COLOR_COFFEE),
                        fixedSize:
                            MaterialStateProperty.all(const Size(80, 80))),
                    child: const Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.black,
                    ),
                  ),
            const SizedBox(
              height: 35,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreatedAccount(),
                      ));
                },
                child: const Text("Não possui conta ? Criar uma conta")),
          ],
        ),
      ),
    );
  }
}
