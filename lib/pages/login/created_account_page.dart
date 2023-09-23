import 'package:coffers_in/services/login_service.dart';
import 'package:coffers_in/util/colors/colors_custom.dart';
import 'package:flutter/material.dart';

class CreatedAccount extends StatefulWidget {
  const CreatedAccount({super.key});

  @override
  State<CreatedAccount> createState() => _CreatedAccountState();
}

class _CreatedAccountState extends State<CreatedAccount> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  LoginService login = LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: COLOR_COFFEE),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: COLOR_COFFEE,
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(90),
                bottomStart: Radius.circular(90),
              ),
            ),
            child: const Icon(Icons.access_alarm),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: "Digite seu Usuario"),
              controller: userNameController,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  hintText: "Digite seu e-mail"),
              controller: emailController,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  border: OutlineInputBorder(),
                  hintText: "Digite sua senha"),
              controller: passwordController,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  border: OutlineInputBorder(),
                  hintText: "Digite seu endereço"),
              controller: addressController,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  border: OutlineInputBorder(),
                  hintText: "Digite sua idade"),
              controller: ageController,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              onPressed: () async {
                await login.criarContaService(userNameController.text,
                    emailController.text, passwordController.text);
                if (context.mounted) Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(COLOR_COFFEE),
                fixedSize: MaterialStateProperty.all(const Size(100, 50)),
              ),
              child: const Text(
                "Cadastrar",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
