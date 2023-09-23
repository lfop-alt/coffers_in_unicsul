import 'package:coffers_in/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../../repository/user_repository.dart';
import '../../services/login_service.dart';
import '../../util/colors/colors_custom.dart';

class ProdutoPage extends StatefulWidget {
  final Map coffee;
  const ProdutoPage({super.key, required this.coffee});

  @override
  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  UserRepository userRepository = UserRepository();
  final LoginService _loginService = LoginService();

  List cart = [];
  bool isLoading = false;
  var session = "";

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    session = await _loginService.getSession();

    cart = await userRepository.getCard(session);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: COLOR_COFFEE,
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Center(
                            child: Text(
                              widget.coffee["nameCoffee"].toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Horizon"),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "Ingredientes",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 16),
                          child: Text(widget.coffee["ingredientCoffee"]
                              .toString()
                              .splitMapJoin(
                                ",",
                                onMatch: (p0) => "\n -",
                              )
                              .splitMapJoin(
                                "[",
                                onMatch: (p0) => "- ",
                              )
                              .splitMapJoin(
                                "]",
                                onMatch: (p0) => "",
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Divider(
                            height: 1,
                            color: COLOR_COFFEE_LIGHT,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: Text(
                              widget.coffee["descriptionCoffee"],
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Divider(
                            height: 1,
                            color: COLOR_COFFEE_LIGHT,
                          ),
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Preço:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "R\$ ${widget.coffee["priceCoffee"]}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final navigator = Navigator.of(context);
                      setState(() {
                        isLoading = true;
                      });
                      cart.add(widget.coffee);
                      var objectId = await _loginService.getObjectId();
                      await userRepository.editCartUser(
                          session, objectId, cart);
                      setState(() {
                        isLoading = false;
                      });
                      navigator.pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text("Adicionar no carrinho"),
                  )
                ],
              ),
      ),
    );
  }
}
