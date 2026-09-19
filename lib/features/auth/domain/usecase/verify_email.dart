import 'package:dartz/dartz.dart';

import '/core/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../../data/models/verify_email_request.dart';

class VerifyEmail {
  final AuthRepository repository;

  VerifyEmail(this.repository);

  Future<Either<Failure, dynamic>> call(
      VerifyEmailRequest request,
      ) async {
    return await repository.verifyEmail(request);
  }
}