import 'package:flutter/material.dart';
import 'package:flutter_estudo/pages/home/home_page_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return SizedBox(
            child: ListView.builder(
              itemCount: controller.clientes.length,
              itemBuilder: (BuildContext context, int index) {
                if (controller.clientes.isEmpty) {
                  return const Text("Não há clientes!");
                }
                return Center(
                  child: Card(
                    child: Text(
                      controller.clientes[index]['name'].toString(),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getClientes();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ); */
    );
  }
}
