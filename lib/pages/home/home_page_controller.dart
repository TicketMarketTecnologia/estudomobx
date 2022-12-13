import 'package:flutter_estudo/repositories/clientes_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_page_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  List<dynamic> clientes = [];

  @action
  Future<void> getClientes() async {
    clientes = await ClientesRepository().getClientes();

    print(clientes);
  }
}
