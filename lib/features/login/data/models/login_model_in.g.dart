// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModelIn _$LoginModelInFromJson(Map<String, dynamic> json) => LoginModelIn(
      acesso: Acesso.fromJson(json['acesso'] as Map<String, dynamic>),
      permissoes:
          Permissoes.fromJson(json['permissoes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelInToJson(LoginModelIn instance) =>
    <String, dynamic>{
      'acesso': instance.acesso,
      'permissoes': instance.permissoes,
    };

Acesso _$AcessoFromJson(Map<String, dynamic> json) => Acesso(
      usuarioBean:
          UsuarioBean.fromJson(json['usuarioBean'] as Map<String, dynamic>),
      codigo: (json['codigo'] as num).toInt(),
    );

Map<String, dynamic> _$AcessoToJson(Acesso instance) => <String, dynamic>{
      'usuarioBean': instance.usuarioBean,
      'codigo': instance.codigo,
    };

UsuarioBean _$UsuarioBeanFromJson(Map<String, dynamic> json) => UsuarioBean(
      login: json['login'] as String,
      funcionario:
          Funcionario.fromJson(json['funcionario'] as Map<String, dynamic>),
      codigo: (json['codigo'] as num).toInt(),
    );

Map<String, dynamic> _$UsuarioBeanToJson(UsuarioBean instance) =>
    <String, dynamic>{
      'login': instance.login,
      'funcionario': instance.funcionario,
      'codigo': instance.codigo,
    };

Funcionario _$FuncionarioFromJson(Map<String, dynamic> json) => Funcionario(
      codigo: (json['codigo'] as num).toInt(),
      nome: json['nome'] as String,
    );

Map<String, dynamic> _$FuncionarioToJson(Funcionario instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'nome': instance.nome,
    };

Permissoes _$PermissoesFromJson(Map<String, dynamic> json) => Permissoes(
      cancelarItens: json['cancelarItens'] as String,
      juntarContas: json['juntarContas'] as String,
      pagarPOSContaEmDinheiro: json['pagarPOSContaEmDinheiro'] as String,
      trocarContas: json['trocarContas'] as String,
      visualiarConta: json['visualiarConta'] as String,
      chamados: json['chamados'] as String,
      pedido: json['pedido'] as String,
      revisarSolicitacaoDeConta: json['revisarSolicitacaoDeConta'] as String,
      fecharConta: json['fecharConta'] as String,
      trocarItens: json['trocarItens'] as String,
      pedidosPendentes: json['pedidosPendentes'] as String,
      pagarPOSContaEmDinheiroSemConfirmarSenha:
          json['pagarPOSContaEmDinheiroSemConfirmarSenha'] as String,
    );

Map<String, dynamic> _$PermissoesToJson(Permissoes instance) =>
    <String, dynamic>{
      'cancelarItens': instance.cancelarItens,
      'juntarContas': instance.juntarContas,
      'pagarPOSContaEmDinheiro': instance.pagarPOSContaEmDinheiro,
      'trocarContas': instance.trocarContas,
      'visualiarConta': instance.visualiarConta,
      'chamados': instance.chamados,
      'pedido': instance.pedido,
      'revisarSolicitacaoDeConta': instance.revisarSolicitacaoDeConta,
      'fecharConta': instance.fecharConta,
      'trocarItens': instance.trocarItens,
      'pedidosPendentes': instance.pedidosPendentes,
      'pagarPOSContaEmDinheiroSemConfirmarSenha':
          instance.pagarPOSContaEmDinheiroSemConfirmarSenha,
    };
