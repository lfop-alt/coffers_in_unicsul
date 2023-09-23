import 'package:coffers_in/pages/carrinho/carrinho_page.dart';
import 'package:coffers_in/pages/dashboard/dashboard_page.dart';
import 'package:coffers_in/pages/conta/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _seletedIndex = 0;

  final List<Widget> _screans = [
    const DashboardPage(),
    const CarrinhoPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
            BottomNavigationBarItem(icon: Icon(Icons.sell), label: "Carrinho"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Conta")
          ],
          currentIndex: _seletedIndex,
          onTap: (value) {
            setState(() {
              _seletedIndex = value;
            });
          },
        ),
        body: _screans[_seletedIndex]);
  }
}
