import '/core/errors/failure.dart';
abstract class AuthDataSource {

  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  });


  Future<Either<Failure, Map<String, dynamic>>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<Either<Failure, Map<String, dynamic>>> verify({
    required String email,
    required String code,
  });
}