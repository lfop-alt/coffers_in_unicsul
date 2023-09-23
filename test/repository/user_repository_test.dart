import 'package:coffers_in/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class ValidateUserRepository {
  validate({String? objectId, dynamic repository}) {
    if (objectId == null && objectId == "") {
      return "O ObjectId é obrigatorio";
    }

    // final result = repository.getUser(objectId);

    // if (result.statscode)
  }
}

void main() {
  late ValidateUserRepository validateUserRepository;

  late UserRepository userRepository;

  setUp(() {
    validateUserRepository = ValidateUserRepository();
    userRepository = UserRepository();
  });
  group("Validar o userRepository", () {
    test("Verificar se o ObjectID é nulo", () {
      final result = validateUserRepository.validate(objectId: "");

      expect(result, equals("O ObjectId é obrigatorio"));
    });

    test("verificar se o objectId foi encontrado", () {
      String objectId = "abc";
      final result = userRepository.getUser(objectId);
      // final result = userRepository.getUser(objectId);

      expect(result, equals("Usuario não encontrado"));
    });
  });
}
