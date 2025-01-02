import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/categoria_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/repositories/i_categoria_repository.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/usecases/get_categorias_disponiveis_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

List<CategoriaEntity> categorias = [
  _createCategoriaDisponivel(),
  _createCategoriaIndisponivelDia(),
  _createCategoriaIndisponivelHorario(),
];

CategoriaEntity _createCategoriaDisponivel() {
  return CategoriaEntity(
    horaInicioSeg: 14400000,
    horaFinalSeg: 100799000,
    horaInicioTer: 14400000,
    horaFinalTer: 100799000,
    horaInicioQua: 14400000,
    horaFinalQua: 100799000,
    horaInicioQui: 14400000,
    horaFinalQui: 100799000,
    horaInicioSex: 14400000,
    horaFinalSex: 100799000,
    horaInicioSab: 14400000,
    horaFinalSab: 100799000,
    horaInicioDom: 14400000,
    horaFinalDom: 100799000,
    codigo: 1,
    nome: 'Bebidas',
    descricao: 'Bebidas',
    tipo: TipoCategoria.produto,
    disponivelSegunda: true,
    disponivelTerca: true,
    disponivelQuarta: true,
    disponivelQuinta: true,
    disponivelSexta: true,
    disponivelSabado: true,
    disponivelDomingo: true,
    visivelAppGarcom: true,
  );
}

CategoriaEntity _createCategoriaIndisponivelDia() {
  return CategoriaEntity(
    horaInicioSeg: 14400000,
    horaFinalSeg: 100799000,
    horaInicioTer: 14400000,
    horaFinalTer: 100799000,
    horaInicioQua: 14400000,
    horaFinalQua: 100799000,
    horaInicioQui: 14400000,
    horaFinalQui: 100799000,
    horaInicioSex: 14400000,
    horaFinalSex: 100799000,
    horaInicioSab: 14400000,
    horaFinalSab: 100799000,
    horaInicioDom: 14400000,
    horaFinalDom: 100799000,
    codigo: 2,
    nome: 'Bebidas',
    descricao: 'Bebidas',
    tipo: TipoCategoria.produto,
    disponivelSegunda: false,
    disponivelTerca: false,
    disponivelQuarta: false,
    disponivelQuinta: false,
    disponivelSexta: false,
    disponivelSabado: false,
    disponivelDomingo: false,
    visivelAppGarcom: true,
  );
}

CategoriaEntity _createCategoriaIndisponivelHorario() {
  return CategoriaEntity(
    horaInicioSeg: 100798000, // 23:59:58
    horaFinalSeg: 100799000, // 23:59:59
    horaInicioTer: 100798000,
    horaFinalTer: 100799000,
    horaInicioQua: 100798000,
    horaFinalQua: 100799000,
    horaInicioQui: 100798000,
    horaFinalQui: 100799000,
    horaInicioSex: 100798000,
    horaFinalSex: 100799000,
    horaInicioSab: 100798000,
    horaFinalSab: 100799000,
    horaInicioDom: 100798000,
    horaFinalDom: 100799000,
    codigo: 3,
    nome: 'Bebidas',
    descricao: 'Bebidas',
    tipo: TipoCategoria.produto,
    disponivelSegunda: true,
    disponivelTerca: true,
    disponivelQuarta: true,
    disponivelQuinta: true,
    disponivelSexta: true,
    disponivelSabado: true,
    disponivelDomingo: true,
    visivelAppGarcom: true,
  );
}

class CategoriaRepositoryMock extends Mock implements ICategoriaRepository {}

void main() {
  setUpAll(() {
    GetIt.instance.registerSingleton<ICategoriaRepository>(CategoriaRepositoryMock());
  });

  test('Deve trazer apenas as categorias disponíveis', () async {
    //Arrange
    final repository = GetIt.instance.get<ICategoriaRepository>();
    when(() => repository.findAll()).thenAnswer((_) async => categorias);

    //Act
    final result = await GetCategoriasDisponiveisUseCase(repository).call(const NoParams());

    //Assert
    expect(result.isSuccess, true);
    expect(result, isA<Success<List<CategoriaEntity>>>());
    expect((result as Success<List<CategoriaEntity>>).value.length, 1);
  });
}
