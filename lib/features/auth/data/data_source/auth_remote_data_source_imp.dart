import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/faliure.dart';
import 'package:mm_2/core/network/api_constants.dart';
import 'package:mm_2/core/network/api_consumer.dart';
import 'package:mm_2/features/auth/data/data_source/auth_remote_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final ApiConsumer apiConsumer;

  AuthDataSourceImpl(this.apiConsumer);

  @override
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    final response = await apiConsumer.post(
      path: ApiConstants.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    return response.fold(
          (failure) => Left(failure),
          (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final response = await apiConsumer.post(
      path: ApiConstants.register,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
    );

    return response.fold(
          (failure) => Left(failure),
          (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> verify({
    required String email,
    required String code,
  }) async {
    final response = await apiConsumer.post(
      path: ApiConstants.verifyEmail,
      data: {
        'email': email,
        'otp': code,
      },
    );

    return response.fold(
          (failure) => Left(failure),
          (data) => Right(data),
    );
  }
}

  @override
  Future<Either<Failure, Map<String, dynamic>>> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    final response = await apiConsumer.post(
      path: '/signup',
      body: {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
      },
    );

    return response.fold(
          (failure) => Left(failure),
          (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> verify({
    required String email,
    required String code,
  }) async {
    final response = await apiConsumer.post(
      path: '/verify',
      body: {
        'email': email,
        'code': code,
      },
    );

    return response.fold(
          (failure) => Left(failure),
          (data) => Right(data),
    );
  }
}