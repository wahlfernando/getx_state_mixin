import 'package:get/get.dart';
import 'package:get_state_mixin/models/cep_model.dart';

import 'package:get_state_mixin/repository/viacep_repository.dart';

class HomeController extends GetxController with StateMixin<CepModel> {
  final ViacepRepository _repository;

  final _cepSearch = ''.obs;

  //setter:
  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;

  HomeController(this._repository);

  @override
  void onReady() {
    change(state, status: RxStatus.empty());
  }

  Future<void> findAddress() async {
    change(state, status: RxStatus.loading());
    append(() => () {
      final cep = _cepSearch.value;
      return _repository.getCep(cep);
    });
  }

  // O metodo "append" ja traz todos os beneficios do erro e sucesso incorporado para os estados que devemos usar na tela. 

 
}
