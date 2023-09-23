import 'package:coffers_in/model/user_model.dart';
import 'package:coffers_in/pages/carrinho/payment_page.dart';
import 'package:coffers_in/repository/user_repository.dart';
import 'package:coffers_in/services/login_service.dart';
import 'package:flutter/material.dart';

import '../../util/colors/colors_custom.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  UserRepository userRepository = UserRepository();
  final LoginService _loginService = LoginService();

  late UserModel user;
  List carts = [];
  var session;
  var objectId;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   isLoading;
  // }

  void getUser() async {
    setState(() {
      isLoading = true;
    });
    objectId = await _loginService.getObjectId();
    session = await _loginService.getSession();
    user = await userRepository.getUser(objectId);
    carts = user.cart!;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: COLOR_COFFEE,
        titleTextStyle: const TextStyle(color: Colors.white),
        title: const Text("Carrinho"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 570,
            width: double.infinity,
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: user.cart!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(user.cart![index].nameCoffee!),
                                    Text(
                                        "R\$ ${user.cart![index].priceCoffee!}")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text(user.cart![index].descriptionCoffee!),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: carts.isEmpty
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                          });

                          int fullValue = 0;
                          for (var e in user.cart!) {
                            fullValue += int.parse(e.priceCoffee!);
                          }

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(
                                paymentFull: fullValue,
                                objectId: objectId,
                                session: session,
                              ),
                            ),
                          );
                        },
                  child: const Text("Ir para pagamento")),
              ElevatedButton(
                  onPressed: () async {
                    await userRepository.editCartUser(session, objectId, []);
                    getUser();
                  },
                  child: const Text("Limpar"))
            ],
          )
        ],
      ),
    );
  }
}
