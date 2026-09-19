import 'package:dartz/dartz.dart';

import '/core/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../../data/models/login_request.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<Either<Failure, dynamic>> call(
      LoginRequest request,
      ) async {
    return await repository.login(request);
  }
}