import 'package:easyfood_app/core/exception/validation_exception.dart';
import 'package:easyfood_app/features/montagem_prato/domain/entity/etapa_prato_entity.dart';
import 'package:easyfood_app/features/montagem_prato/domain/entity/sub_prato_entity.dart';
import 'package:easyfood_app/features/montagem_prato/domain/entity/sub_prato_etapa_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/ingrediente_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/item_cardapio_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/tabela_de_preco_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ItemCardapioPratoEntity prato;
  late TabelaDePrecoEntity tabelaDePrecos;

  setUp(() {
    tabelaDePrecos = TabelaDePrecoEntity(
      precoSegunda: 10,
      precoTerca: 10,
      precoQuarta: 10,
      precoQuinta: 10,
      precoSexta: 10,
      precoSabado: 10,
      precoDomingo: 10,
      valorPromocao: 10,
      horaInicialSegunda: 0,
      horaFinalSegunda: 0,
      horaInicialDomingo: 0,
      horaFinalDomingo: 0,
      horaInicialTerca: 0,
      horaFinalTerca: 0,
      horaInicialQuarta: 0,
      horaFinalQuarta: 0,
      horaInicialQuinta: 0,
      horaFinalQuinta: 0,
      horaInicialSexta: 0,
      horaFinalSexta: 0,
      horaInicialSabado: 0,
      horaFinalSabado: 0,
    );
    prato = ItemCardapioPratoEntity(
      codigo: 1,
      nome: 'Prato 1',
      nomePda: 'Prato 1',
      ingredientes: [
        IngredienteEntity(codigo: 1, nome: 'Ingrediente 1', selecionado: true, valor: 0),
        IngredienteEntity(codigo: 2, nome: 'Ingrediente 2', selecionado: true, valor: 0),
      ],
      opcionais: [
        IngredienteEntity(codigo: 3, nome: 'Opcional 1', selecionado: false, valor: 1),
        IngredienteEntity(codigo: 4, nome: 'Opcional 2', selecionado: false, valor: 2),
      ],
      tabelaDePrecos: tabelaDePrecos,
    );
  });

  group('Testes alterando quantidade', () {
    test('Não deve ser possível inserir quantidade zero', () async {
      //Arrange

      //Act

      //Assert
      expect(() => prato.quantidade = 0, throwsA(isA<ValidationException>()));
    });

    test('Ao alterar a quantidade, deve refletir na propriedade quantidade', () async {
      //Arrange

      //Act
      prato.quantidade = 2;

      //Assert
      expect(prato.quantidade, 2);
    });

    test('Ao alterar a quantidade, deve refletir na propriedade valor', () async {
      //Arrange
      final valorUnitario = prato.valorUnitario;

      //Act
      prato.quantidade = 2;

      //Assert
      expect(prato.valor, valorUnitario * 2);
    });
  });

  group('Testes alterando os adicionais', () {
    test('Ao alterar os ingredientes e adicionais, deve refletir na propriedade observacaoCompleta', () async {
      //Arrange

      //Act
      prato.ingredientes[0].selecionado = false;
      prato.opcionais[1].selecionado = true;

      //Assert
      expect(prato.observacaoCompleta, 'S/ Ingrediente 1\nC/ Opcional 2');
    });

    test('Ao alterar os adicionais, deve refletir na propriedade preco', () async {
      //Arrange
      final precoInicial = prato.valor;
      final precoAdicional = prato.opcionais[1].valor;

      //Act
      prato.opcionais[1].selecionado = true;

      //Assert
      expect(prato.valor, precoInicial + precoAdicional);
    });
  });

  group('Testes pratos montaveis', () {
    test('deve dar uma quebra de linha entre as seleções de etapas diferentes', () async {
      //Arrange
      final itemCardapio = ItemCardapioMontavelEntity(
        codigo: 1,
        nome: 'Prato 1',
        nomePda: 'Prato 1',
        ingredientes: [],
        opcionais: [],
        observacoesFixas: [],
        valorUnitario: 10,
        etapas: [
          EtapaPratoEntity(
            codigo: 1,
            nome: 'Etapa 1',
            codigoEtapa: 1,
            multiplicidade: 1,
            maximoItens: 1,
            minimoItensDistintos: 0,
            maximoItensGratis: 0,
            trocavel: false,
            subPratos: [
              SubPratoEtapaEntity(
                subPrato: SubPratoEntity(
                  codigo: 1,
                  nome: 'Subprato 1',
                ),
                precoAdicional: 0,
                quantidade: 1,
              ),
            ],
          ),
          EtapaPratoEntity(
            codigo: 1,
            nome: 'Etapa 2',
            codigoEtapa: 1,
            multiplicidade: 1,
            maximoItens: 1,
            minimoItensDistintos: 0,
            maximoItensGratis: 0,
            trocavel: false,
            subPratos: [
              SubPratoEtapaEntity(
                subPrato: SubPratoEntity(
                  codigo: 1,
                  nome: 'Subprato 2',
                ),
                precoAdicional: 0,
                quantidade: 1,
              ),
            ],
          ),
        ],
        maximoItens: 0,
      );

      //Act
      itemCardapio.etapas[0].subPratos[0].quantidadeSelecionada = 1;
      itemCardapio.etapas[1].subPratos[0].quantidadeSelecionada = 1;
      final obs = itemCardapio.observacaoCompleta;

      //Assert
      expect(obs, 'C/ Subprato 1\nC/ Subprato 2');
    });

    test('não deve dar uma quebra de linha após etapa sem nenhuma seleção', () async {
      //Arrange
      final itemCardapio = ItemCardapioMontavelEntity(
        codigo: 1,
        nome: 'Prato 1',
        nomePda: 'Prato 1',
        ingredientes: [],
        opcionais: [],
        observacoesFixas: [],
        valorUnitario: 10,
        etapas: [
          EtapaPratoEntity(
            codigo: 1,
            nome: 'Etapa 1',
            codigoEtapa: 1,
            multiplicidade: 1,
            maximoItens: 1,
            minimoItensDistintos: 0,
            maximoItensGratis: 0,
            trocavel: false,
            subPratos: [
              SubPratoEtapaEntity(
                subPrato: SubPratoEntity(
                  codigo: 1,
                  nome: 'Subprato 1',
                ),
                precoAdicional: 0,
                quantidade: 1,
              ),
            ],
          ),
          EtapaPratoEntity(
            codigo: 1,
            nome: 'Etapa 2',
            codigoEtapa: 1,
            multiplicidade: 1,
            maximoItens: 1,
            minimoItensDistintos: 0,
            maximoItensGratis: 0,
            trocavel: false,
            subPratos: [
              SubPratoEtapaEntity(
                subPrato: SubPratoEntity(
                  codigo: 1,
                  nome: 'Subprato 2',
                ),
                precoAdicional: 0,
                quantidade: 1,
              ),
            ],
          ),
        ],
        maximoItens: 0,
      );

      //Act
      itemCardapio.etapas[0].subPratos[0].quantidadeSelecionada = 0;
      itemCardapio.etapas[1].subPratos[0].quantidadeSelecionada = 1;
      final obs = itemCardapio.observacaoCompleta;

      //Assert
      expect(obs, 'C/ Subprato 2');
    });

    test('não deve ter observação se não selecionar nenhum item de nenhuma etapa', () async {
      //Arrange
      final itemCardapio = ItemCardapioMontavelEntity(
        codigo: 1,
        nome: 'Prato 1',
        nomePda: 'Prato 1',
        ingredientes: [],
        opcionais: [],
        observacoesFixas: [],
        valorUnitario: 10,
        etapas: [
          EtapaPratoEntity(
            codigo: 1,
            nome: 'Etapa 1',
            codigoEtapa: 1,
            multiplicidade: 1,
            maximoItens: 1,
            minimoItensDistintos: 0,
            maximoItensGratis: 0,
            trocavel: false,
            subPratos: [
              SubPratoEtapaEntity(
                subPrato: SubPratoEntity(
                  codigo: 1,
                  nome: 'Subprato 1',
                ),
                precoAdicional: 0,
                quantidade: 1,
              ),
            ],
          ),
          EtapaPratoEntity(
            codigo: 1,
            nome: 'Etapa 2',
            codigoEtapa: 1,
            multiplicidade: 1,
            maximoItens: 1,
            minimoItensDistintos: 0,
            maximoItensGratis: 0,
            trocavel: false,
            subPratos: [
              SubPratoEtapaEntity(
                subPrato: SubPratoEntity(
                  codigo: 1,
                  nome: 'Subprato 2',
                ),
                precoAdicional: 0,
                quantidade: 1,
              ),
            ],
          ),
        ],
        maximoItens: 0,
      );

      //Act
      itemCardapio.etapas[0].subPratos[0].quantidadeSelecionada = 0;
      itemCardapio.etapas[1].subPratos[0].quantidadeSelecionada = 0;
      final obs = itemCardapio.observacaoCompleta;

      //Assert
      expect(obs, '');
    });
  });
}
