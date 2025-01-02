import 'package:equatable/equatable.dart';

class EnderecoEntity extends Equatable {
  final int? codigo;
  final String logradouro;
  final String numero;
  final String complemento;

  const EnderecoEntity({
    this.codigo,
    required this.logradouro,
    required this.numero,
    required this.complemento,
  });

  @override
  List<Object?> get props => [
        logradouro,
        numero,
        complemento,
      ];

  String get enderecoCompleto => '$logradouro, $numero${complemento.isNotEmpty ? ', $complemento' : ''} ';
}
