import 'package:coffers_in/pages/conta/navegacao_page.dart';
import 'package:coffers_in/repository/user_repository.dart';
import 'package:flutter/material.dart';

import '../../util/colors/colors_custom.dart';

class PaymentPage extends StatefulWidget {
  final int paymentFull;
  final String session;
  final String objectId;
  const PaymentPage(
      {super.key,
      required this.paymentFull,
      required this.objectId,
      required this.session});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  UserRepository userRepository = UserRepository();
  var snackbar =
      const SnackBar(content: Text("Compra realizada com sucesso!!"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: COLOR_COFFEE,
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Pagamento",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Valor: R\$ ${widget.paymentFull.toString()}"),
          const SizedBox(
            height: 10,
          ),
          const Text("Desconto: R\$ 0.00"),
          const SizedBox(
            height: 10,
          ),
          Text("Valor Final: R\$ ${widget.paymentFull.toString()}"),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              maxLength: 6,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Cupom")),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final scaff = ScaffoldMessenger.of(context);
                  final navigator = Navigator.of(context);
                  await userRepository
                      .editCartUser(widget.session, widget.objectId, []);

                  scaff.showSnackBar(snackbar);

                  navigator.pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const NavegacaoMotorista()),
                  );
                },
                child: const Text("PIX"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final scaff = ScaffoldMessenger.of(context);
                  final navigator = Navigator.of(context);

                  await userRepository
                      .editCartUser(widget.session, widget.objectId, []);

                  scaff.showSnackBar(snackbar);

                  navigator.pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const NavegacaoMotorista()),
                  );
                },
                child: const Text("Cartão de crédito"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final scaff = ScaffoldMessenger.of(context);
                  final navigator = Navigator.of(context);

                  await userRepository
                      .editCartUser(widget.session, widget.objectId, []);

                  scaff.showSnackBar(snackbar);

                  navigator.pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const NavegacaoMotorista()),
                  );
                },
                child: const Text("Debito"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final scaff = ScaffoldMessenger.of(context);
                  final navigator = Navigator.of(context);

                  await userRepository
                      .editCartUser(widget.session, widget.objectId, []);

                  scaff.showSnackBar(snackbar);

                  navigator.pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const NavegacaoMotorista()),
                  );
                },
                child: const Text("Pagar na entrega"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
