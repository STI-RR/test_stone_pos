import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/core/util/crypto_util.dart';
import 'package:easyfood_app/features/configuracoes/domain/entities/configuracoes_entity.dart';
import 'package:easyfood_app/features/configuracoes/domain/usecases/get_configuracao_usecase.dart';
import 'package:easyfood_app/features/login/domain/entities/usuario_entity.dart';
import 'package:easyfood_app/features/login/domain/usecases/login_usecase.dart';
import 'package:easyfood_app/features/login/presentation/states/login_state.dart';
import 'package:easyfood_app/flavor_setup.dart';
import 'package:easyfood_app/loading_state.dart';
import 'package:flutter/material.dart';

class LoginController {
  final _formKey = GlobalKey<FormState>();
  final _senhaController = TextEditingController();
  final state = LoginState();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get senhaController => _senhaController;
  LoadingState get loadingState => state.loadingState;
  bool get isModoOffline => false;
  bool get isFichaHabilitado => true;

  void dispose() {
    _senhaController.dispose();
  }

  Future<UsuarioEntity> login() async {
    if (_formKey.currentState?.validate() ?? false) {
      state.loadingState = LoadingState.loading;

      final loginUseCase = LoginUseCase();
      final senhaMd5 = CryptoUtil.generateMd5(_senhaController.text);
      final params = LoginParams(senhaMd5);
      final result = await loginUseCase.call(params);

      if (result.isSuccess) {
        await loadConfiguracao();
        // if (_configuracoesEntity.flavor == Flavor.stone) {
        ativaSdkStone();
        // }

        return (result as Success).value;
      } else {
        state.loadingState = LoadingState.error;
        final errorMessage = (result as Failure).message;

        state.errorMessage = errorMessage;
        return Future.error(errorMessage);
      }
    }
    return Future.error('Formulário inválido');
  }

  bool validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }

  void clearErrorMessage() {
    state.errorMessage = null;
  }

  Future<void> loadConfiguracao() async {
    final useCase = GetConfiguracaoUseCase();
    final result = await useCase(const NoParams());

    if (result.isSuccess) {
      final configuracao = (result as Success).value;
      ConfiguracoesEntity.configuracaoRemota = configuracao;
    } else {
      state.loadingState = LoadingState.error;
      final errorMessage = (result as Failure).message;

      state.errorMessage = errorMessage;
      return Future.error(errorMessage);
    }
  }
}
