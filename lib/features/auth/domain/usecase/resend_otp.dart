import 'package:dartz/dartz.dart';

import '/core/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../../data/models/resend_otp_request.dart';

class ResendOtp {
  final AuthRepository repository;

  ResendOtp(this.repository);

  Future<Either<Failure, dynamic>> call(
      ResendOtpRequest request,
      ) async {
    return await repository.resendOtp(request);
  }
}