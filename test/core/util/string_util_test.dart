import 'package:easyfood_app/core/util/string_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Telefone completo | ', () {
    test('Deve formatar telefone com input completo sem parenteses', () async {
      //Arrange
      const input = '95988055855';

      //Act
      final result = StringUtil.formataTelefoneComDDDeNonoDigito(input);

      //Assert
      expect(result, '(95) 9 8805-5855');
    });

    test('Deve formatar telefone com input completo com parenteses', () async {
      //Arrange
      const input = '(95)988055855';

      //Act
      final result = StringUtil.formataTelefoneComDDDeNonoDigito(input);

      //Assert
      expect(result, '(95) 9 8805-5855');
    });

    test('Deve formatar telefone com input completo com parenteses e traco', () async {
      //Arrange
      const input = '(95)98805-5855';

      //Act
      final result = StringUtil.formataTelefoneComDDDeNonoDigito(input);

      //Assert
      expect(result, '(95) 9 8805-5855');
    });
  });

  group('Telefone vazio | ', () {
    test('Deve retornar string vazia se telefone contiver apenas parenteses e espaços', () async {
      //Arrange
      const input = '( )    ';

      //Act
      final result = StringUtil.formataTelefoneComDDDeNonoDigito(input);

      //Assert
      expect(result, '');
    });
    test('Deve retornar string vazia se telefone contiver apenas parenteses, traço e espaços', () async {
      //Arrange
      const input = '( )    -    ';

      //Act
      final result = StringUtil.formataTelefoneComDDDeNonoDigito(input);

      //Assert
      expect(result, '');
    });
  });

  group('Telefones incompletos | ', () {
    test('Deve retornar somente DDD entre parenteses', () async {
      //Arrange
      const input = '(95)    -';

      //Act
      final result = StringUtil.formataTelefoneComDDDeNonoDigito(input);

      //Assert
      expect(result, '(95) ');
    });
    test('Deve retornar somente DDD entre parenteses', () async {
      //Arrange
      const input = '(95)9   -';

      //Act
      final result = StringUtil.formataTelefoneComDDDeNonoDigito(input);

      //Assert
      expect(result, '(95) 9 ');
    });
    test('Deve retornar somente DDD entre parenteses', () async {
      //Arrange
      const input = '(95)98  -';

      //Act
      final result = StringUtil.formataTelefoneComDDDeNonoDigito(input);

      //Assert
      expect(result, '(95) 9 8');
    });
  });
}
