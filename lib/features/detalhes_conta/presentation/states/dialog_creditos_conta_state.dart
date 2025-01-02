import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/detalhes_conta/model/entities/credito_entity.dart';
import 'package:easyfood_app/loading_state.dart';
import 'package:flutter/material.dart';

class DialogCreditosContaState extends ChangeNotifier {
  final ContaEntity conta;
  List<CreditoEntity> creditos = [];
  String errorMessage = '';

  DialogCreditosContaState(this.conta);

  LoadingState loadingState = LoadingState.loaded;
  void setLoadingState(LoadingState state) {
    loadingState = state;
    notifyListeners();
  }

  Future<List<CreditoEntity>> getCreditosConta() async {
    setLoadingState(LoadingState.loading);

    await Future.delayed(const Duration(milliseconds: 300)); // Simulando um delay

    return [];
  }
}
