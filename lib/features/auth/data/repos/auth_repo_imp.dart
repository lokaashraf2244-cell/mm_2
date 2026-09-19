import 'package:dartz/dartz.dart';

import '/core/errors/failure.dart';

import '../datasources/auth_remote_data_source.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';
import '../models/verify_email_request.dart';
import '../models/resend_otp_request.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> login(
      LoginRequest request,
      ) async {
    return await remoteDataSource.login(request);
  }

  @override
  Future<Either<Failure, dynamic>> signup(
     signupRequest request,
      ) async {
    return await remoteDataSource.register(request);
  }

  @override
  Future<Either<Failure, dynamic>> verifyEmail(
      VerifyEmailRequest request,
      ) async {
    return await remoteDataSource.verifyEmail(request);
  }

  @override
  Future<Either<Failure, dynamic>> resendOtp(
      ResendOtpRequest request,
      ) async {
    return await remoteDataSource.resendOtp(request);
  }
}