import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_mixin/models/cep_model.dart';
import 'package:get_state_mixin/pages/home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca Endereço por CEP'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                controller.cepSearch = value;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  controller.findAddress();
                },
                child: const Text('Buscar')),
            const SizedBox(
              height: 20,
            ),
            controller.obx(
              (state) => CepWidget(state),
              onEmpty: const Text('Nenhum CEP encontrado..'),
              onError: (error) => const Text('erro ao buscar CEP'),
            )
          ],
        ),
      )),
    );
  }
}

class CepWidget extends StatelessWidget {
  final CepModel? cepModel;

  const CepWidget(this.cepModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('CEP: ${cepModel?.cep ?? ''}'),
        Text('Cidade: ${cepModel?.cidade ?? ''}'),
        Text('Rua: ${cepModel?.logradouro ?? ''}'),
        Text('UF: ${cepModel?.uf ?? ''} '),
      ],
    );
  }
}
