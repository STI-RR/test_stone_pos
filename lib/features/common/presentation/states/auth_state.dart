import 'package:easyfood_app/core/util/permissions.dart';
import 'package:easyfood_app/features/login/domain/entities/permissoes_entity.dart';
import 'package:easyfood_app/features/login/domain/entities/usuario_entity.dart';
import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  UsuarioEntity? _usuario;
  UsuarioEntity? get usuario => _usuario;

  final List<Permissoes> _permissions = [];
  bool hasPermission(Permissoes permission) => _permissions.contains(permission);

  set usuario(UsuarioEntity? loggedUser) {
    _usuario = loggedUser;
    _permissions.clear();
    _permissions.addAll(_toPermissions(loggedUser?.permissoes));
    notifyListeners();
  }

  List<Permissoes> _toPermissions(PermissoesEntity? permissoes) {
    if (permissoes == null) {
      return [];
    }

    final permissions = <Permissoes>[];

    if (permissoes.cancelarItens == '1') {
      permissions.add(Permissoes.cancelarItens);
    }
    if (permissoes.chamados == '1') {
      permissions.add(Permissoes.chamados);
    }
    if (permissoes.fecharConta == '1') {
      permissions.add(Permissoes.fecharConta);
    }
    if (permissoes.juntarContas == '1') {
      permissions.add(Permissoes.juntarContas);
    }
    if (permissoes.pagarPOSContaEmDinheiro == '1') {
      permissions.add(Permissoes.pagarContaEmDinheiro);
    }
    if (permissoes.pagarPOSContaEmDinheiroSemConfirmarSenha == '1') {
      permissions.add(Permissoes.pagarContaEmDinheiroSeSenha);
    }
    if (permissoes.pedido == '1') {
      permissions.add(Permissoes.realizarPedido);
    }
    if (permissoes.trocarContas == '1') {
      permissions.add(Permissoes.trocarContas);
    }
    if (permissoes.trocarItens == '1') {
      permissions.add(Permissoes.trocarItens);
    }
    if (permissoes.visualizarConta == '1') {
      permissions.add(Permissoes.visualizarConta);
    }

    // As duas permissões abaixo são novas e foram adicionadas após a criação do enum Permissoes
    // Por padrão, elas são consideradas como true
    if (permissoes.realizarPedidoMesa == '1' || permissoes.realizarPedidoMesa == null) {
      permissions.add(Permissoes.realizarPedidoMesa);
    }
    if (permissoes.realizarPedidoCartao == '1' || permissoes.realizarPedidoCartao == null) {
      permissions.add(Permissoes.realizarPedidoComanda);
    }

    return permissions;
  }
}
