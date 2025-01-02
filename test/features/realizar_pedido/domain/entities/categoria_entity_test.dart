import 'package:easyfood_app/features/realizar_pedido/domain/entities/categoria_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Categoria com disponibilidade por dia como false deve ser considerada indisponivel', () {
    final categoria = CategoriaEntity(
      codigo: 1,
      tipo: TipoCategoria.produto,
      nome: 'Teste',
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
      disponivelSegunda: DateTime.now().weekday != DateTime.monday,
      disponivelTerca: DateTime.now().weekday != DateTime.tuesday,
      disponivelQuarta: DateTime.now().weekday != DateTime.wednesday,
      disponivelQuinta: DateTime.now().weekday != DateTime.thursday,
      disponivelSexta: DateTime.now().weekday != DateTime.friday,
      disponivelSabado: DateTime.now().weekday != DateTime.saturday,
      disponivelDomingo: DateTime.now().weekday != DateTime.sunday,
      visivelAppGarcom: true,
    );

    expect(categoria.isDisponivel, false);
  });

  test('Categoria com disponibilidade por dia como true deve ser considerada disponivel', () {
    final categoria = CategoriaEntity(
      codigo: 1,
      tipo: TipoCategoria.produto,
      nome: 'Teste',
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
      disponivelSegunda: DateTime.now().weekday == DateTime.monday,
      disponivelTerca: DateTime.now().weekday == DateTime.tuesday,
      disponivelQuarta: DateTime.now().weekday == DateTime.wednesday,
      disponivelQuinta: DateTime.now().weekday == DateTime.thursday,
      disponivelSexta: DateTime.now().weekday == DateTime.friday,
      disponivelSabado: DateTime.now().weekday == DateTime.saturday,
      disponivelDomingo: DateTime.now().weekday == DateTime.sunday,
      visivelAppGarcom: true,
    );

    expect(categoria.isDisponivel, true);
  });
}
