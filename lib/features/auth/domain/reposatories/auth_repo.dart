import 'package:dartz/dartz.dart';

import '/core/errors/failures.dart';

import '../../data/models/login_request.dart';
import '../../data/models/register_request.dart';
import '../../data/models/verify_email_request.dart';
import '../../data/models/resend_otp_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, dynamic>> login(
      LoginRequest request,
      );

  Future<Either<Failure, dynamic>> register(
      SignupRequest request,
      );

  Future<Either<Failure, dynamic>> verifyEmail(
      VerifyEmailRequest request,
      );

  Future<Either<Failure, dynamic>> resendOtp(
      ResendOtpRequest request,
      );
}