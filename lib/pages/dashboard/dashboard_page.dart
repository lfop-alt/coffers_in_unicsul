import 'package:coffers_in/pages/dashboard/product_page.dart';
import 'package:coffers_in/services/item_service.dart';
import 'package:coffers_in/util/colors/colors_custom.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var itens = [];
  bool isLoadingImage = true;
  ItemService itemService = ItemService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItensCoffee();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isLoadingImage;
  }

  void getItensCoffee() async {
    itens = await itemService.getItens();
    setState(() {
      isLoadingImage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: COLOR_COFFEE,
        titleTextStyle: const TextStyle(color: Colors.white),
        title: const Text("Dashboard"),
      ),
      body: isLoadingImage
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              itemCount: itens.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdutoPage(
                          coffee: itens[index],
                        ),
                      ),
                    );
                  },
                  child: isLoadingImage
                      ? const CircularProgressIndicator()
                      : Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            color: Colors.white,
                            image: DecorationImage(
                              image:
                                  AssetImage("lib/images/cafe${index + 1}.jpg"),
                            ),
                          ),
                          child: Text(
                            itens[index]["nameCoffee"],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: COLOR_COFFEE),
                          ),
                        ),
                );
              },
            ),
    );
  }
}
