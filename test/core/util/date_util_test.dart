import 'package:easyfood_app/core/util/date_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testes para segundos', () {
    test('deve retornar Agora se for menos de um minuto atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(seconds: 30));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, 'Agora');
    });

    test('Não deve retornar Agora se for mais de um minuto atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(seconds: 61));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, isNot('Agora'));
    });
  });

  group('Testes para minutos', () {
    test('Deve retornar um minuto atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(minutes: 1));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '1 minuto atrás');
    });

    test('Deve retornar 2 minutos atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(minutes: 2));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '2 minutos atrás');
    });

    test('Deve retornar 59 minutos atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(minutes: 59));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '59 minutos atrás');
    });
  });

  group('Testes para horas', () {
    test('Deve retornar uma hora atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(hours: 1));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '1 hora atrás');
    });

    test('Deve retornar 2 horas atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(hours: 2));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '2 horas atrás');
    });

    test('Deve retornar 23 horas atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(hours: 23));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '23 horas atrás');
    });

    test('Deve retornar 1 hora e 30 minutos atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(hours: 1, minutes: 30));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '1 hora e 30 minutos atrás');
    });
  });

  group('Testes para dias', () {
    test('Deve retornar um dia atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(days: 1));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '1 dia atrás');
    });

    test('Deve retornar 2 dias atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(days: 2));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '2 dias atrás');
    });

    test('Deve retornar 30 dias atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(days: 30));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '30 dias atrás');
    });

    test('Deve retornar 1 dia e 2 horas atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(days: 1, hours: 2));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '1 dia e 2 horas atrás');
    });

    test('Deve retornar 1 dia e 2 minutos atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(days: 1, minutes: 2));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '1 dia e 2 minutos atrás');
    });

    test('Deve retornar 1 dia, 2 horas e 2 minutos atrás', () async {
      //Arrange
      final date = DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 2));

      //Act
      final result = DateUtil.getFormattedTimeAgo(date);

      //Assert
      expect(result, '1 dia, 2 horas e 2 minutos atrás');
    });
  });

  group('Testes para formatação de data/hora', () {
    test('Deve retornar 21 Set. 2023 - 14:30', () async {
      //Arrange
      final date = DateTime(2023, 9, 21, 14, 30);

      //Act
      final result = DateUtil.getFormattedDateTimeWithMonthAbbreviated(date);

      //Assert
      expect(result, '21 Set. 2023 - 14:30');
    });

    test('Deve retornar 01/09/2023 04:03:06', () async {
      //Arrange
      final date = DateTime(2023, 9, 1, 4, 3, 6);

      //Act
      final result = DateUtil.getFormattedDateTime(date);

      //Assert
      expect(result, '01/09/2023 04:03:06');
    });

    test('Deve retornar 20/12/2023 20:59:59', () async {
      //Arrange
      final date = DateTime(2023, 12, 20, 20, 59, 59);

      //Act
      final result = DateUtil.getFormattedDateTime(date);

      //Assert
      expect(result, '20/12/2023 20:59:59');
    });
  });
}
