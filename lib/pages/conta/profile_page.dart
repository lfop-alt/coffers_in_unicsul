import 'dart:io';

import 'package:coffers_in/pages/home_page.dart';
import 'package:coffers_in/pages/login/login_page.dart';
import 'package:coffers_in/pages/conta/navegacao_page.dart';
import 'package:coffers_in/repository/user_repository.dart';
import 'package:coffers_in/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../util/colors/colors_custom.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserRepository _userRepository = UserRepository();
  var cart = [];
  var username = "";
  var email = "";
  var session = "";

  @override
  void initState() {
    super.initState();

    getUser();
  }

  void getUser() async {
    email = await loginService.getEmail();
    username = await loginService.getUserName();
    session = await loginService.getSession();
    cart = await _userRepository.getCard(session);
    setState(() {});
  }

  XFile? image;

  LoginService loginService = LoginService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: COLOR_COFFEE,
          ),
          currentAccountPicture: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Wrap(
                    children: [
                      ListTile(
                        title: const Text("Câmera"),
                        onTap: () async {
                          final navigator = Navigator.of(context);
                          final ImagePicker picker = ImagePicker();
                          image = await picker.pickImage(
                            source: ImageSource.camera,
                          );
                          setState(() {});

                          navigator.pop();
                        },
                      ),
                      ListTile(
                        title: const Text("Galeria"),
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                        },
                      )
                    ],
                  );
                },
              );
            },
            child: image != null
                ? CircleAvatar(backgroundImage: FileImage(File(image!.path)))
                : const CircleAvatar(child: Icon(Icons.add_a_photo)),
          ),
          accountName: Text(username),
          accountEmail: Text(email),
        ),
        ListTile(
          title: const Text("Sair"),
          onTap: () async {
            final navigator = Navigator.of(context);
            await loginService.logout();
            navigator.pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false);
          },
        ),
        ListTile(
          title: const Text("Rota do pedido"),
          enabled: cart.isEmpty ? false : true,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NavegacaoMotorista(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text("Configurações"),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        )
      ]),
    );
  }
}
