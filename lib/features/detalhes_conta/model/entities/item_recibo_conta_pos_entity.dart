// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_recibo_conta_pos_entity.g.dart';

@JsonSerializable()
class ItemReciboContaPosEntity extends Equatable {
  const ItemReciboContaPosEntity({
    required this.quantidade,
    required this.descricao,
    required this.precoUnitario,
    required this.precoVenda,
  });

  final int quantidade;
  final String descricao;
  final double precoUnitario;
  final double precoVenda;

  factory ItemReciboContaPosEntity.fromJson(Map<String, dynamic> json) => _$ItemReciboContaPosEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ItemReciboContaPosEntityToJson(this);

  @override
  List<Object?> get props => [descricao, precoUnitario];

  ItemReciboContaPosEntity copyWith({
    int? quantidade,
    String? descricao,
    double? precoUnitario,
    double? precoVenda,
  }) {
    return ItemReciboContaPosEntity(
      quantidade: quantidade ?? this.quantidade,
      descricao: descricao ?? this.descricao,
      precoUnitario: precoUnitario ?? this.precoUnitario,
      precoVenda: precoVenda ?? this.precoVenda,
    );
  }
}
