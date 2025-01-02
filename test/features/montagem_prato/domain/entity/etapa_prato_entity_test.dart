import 'package:easyfood_app/features/montagem_prato/domain/entity/etapa_prato_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve retornar 1 Itens grátis', () {
    // Arrange
    final entity = EtapaPratoEntity(
      codigo: 1,
      codigoEtapa: 1,
      nome: 'TESTE',
      maximoItens: 0,
      maximoItensGratis: 1,
      multiplicidade: 1,
      minimoItensDistintos: 0,
      trocavel: false,
    );

    // Act
    final info = entity.informacaoSecundaria;

    // Assert
    expect(info, '1 Item grátis');
  });

  test('Deve retornar trocáveis com parenteses', () {
    // Arrange
    final entity = EtapaPratoEntity(
      codigo: 1,
      codigoEtapa: 1,
      nome: 'TESTE',
      maximoItens: 0,
      maximoItensGratis: 1,
      multiplicidade: 1,
      minimoItensDistintos: 0,
      trocavel: true,
    );

    // Act
    final info = entity.informacaoSecundaria;

    // Assert
    expect(info, '1 Item grátis (trocáveis)');
  });

  test('Deve retornar trocáveis sem parenteses', () {
    // Arrange
    final entity = EtapaPratoEntity(
      codigo: 1,
      codigoEtapa: 1,
      nome: 'TESTE',
      maximoItens: 0,
      maximoItensGratis: 0,
      multiplicidade: 1,
      minimoItensDistintos: 0,
      trocavel: true,
    );

    // Act
    final info = entity.informacaoSecundaria;

    // Assert
    expect(info, 'trocáveis');
  });

  test(('Deve retornar o maximo de itens selecionados'), () {
    // Arrange
    final entity = EtapaPratoEntity(
      codigo: 1,
      codigoEtapa: 1,
      nome: 'TESTE',
      maximoItens: 2,
      maximoItensGratis: 0,
      multiplicidade: 1,
      minimoItensDistintos: 0,
      trocavel: false,
    );

    // Act
    final info = entity.informacaoSecundaria;

    // Assert
    expect(info, 'máximo 2 itens');
  });

  test(('Deve retornar: Selecione quantos quiser'), () {
    // Arrange
    final entity = EtapaPratoEntity(
      codigo: 1,
      codigoEtapa: 1,
      nome: 'TESTE',
      maximoItens: 0,
      maximoItensGratis: 0,
      multiplicidade: 1,
      minimoItensDistintos: 0,
      trocavel: false,
    );

    // Act
    final info = entity.informacaoSecundaria;

    // Assert
    expect(info, 'Selecione quantos quiser');
  });

  test(('Deve retornar: 1 Item grátis (trocáveis), máximo 2 itens, 2 itens distintos'), () {
    // Arrange
    final entity = EtapaPratoEntity(
      codigo: 1,
      codigoEtapa: 1,
      nome: 'TESTE',
      maximoItens: 2,
      maximoItensGratis: 1,
      multiplicidade: 1,
      minimoItensDistintos: 2,
      trocavel: true,
    );

    // Act
    final info = entity.informacaoSecundaria;

    // Assert
    expect(info, '1 Item grátis (trocáveis), máximo 2 itens, 2 itens distintos');
  });
}
