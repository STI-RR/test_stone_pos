import 'package:easyfood_app/features/realizar_pedido/domain/entities/tabela_de_preco_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tabelaDePrecosDiferenteCadaDia = {
    DateTime.monday: 10.0,
    DateTime.tuesday: 11.0,
    DateTime.wednesday: 12.0,
    DateTime.thursday: 13.0,
    DateTime.friday: 14.0,
    DateTime.saturday: 15.0,
    DateTime.sunday: 16.0,
  };

  test('deve ter o preco atual igual ao preco do dia atual', () async {
    //Arrange
    final tabelaDePreco = TabelaDePrecoEntity(
      precoSegunda: tabelaDePrecosDiferenteCadaDia[DateTime.monday]!,
      precoTerca: tabelaDePrecosDiferenteCadaDia[DateTime.tuesday]!,
      precoQuarta: tabelaDePrecosDiferenteCadaDia[DateTime.wednesday]!,
      precoQuinta: tabelaDePrecosDiferenteCadaDia[DateTime.thursday]!,
      precoSexta: tabelaDePrecosDiferenteCadaDia[DateTime.friday]!,
      precoSabado: tabelaDePrecosDiferenteCadaDia[DateTime.saturday]!,
      precoDomingo: tabelaDePrecosDiferenteCadaDia[DateTime.sunday]!,
      valorPromocao: 0.0,
      horaInicialSegunda: 14400000,
      horaFinalSegunda: 100799000,
      horaInicialDomingo: 14400000,
      horaFinalDomingo: 100799000,
      horaInicialTerca: 14400000,
      horaFinalTerca: 100799000,
      horaInicialQuarta: 14400000,
      horaFinalQuarta: 100799000,
      horaInicialQuinta: 14400000,
      horaFinalQuinta: 100799000,
      horaInicialSexta: 14400000,
      horaFinalSexta: 100799000,
      horaInicialSabado: 14400000,
      horaFinalSabado: 100799000,
    );

    //Act
    final precoAtual = tabelaDePreco.precoAtual;

    //Assert
    expect(precoAtual, tabelaDePrecosDiferenteCadaDia[DateTime.now().weekday]);
  });
}
