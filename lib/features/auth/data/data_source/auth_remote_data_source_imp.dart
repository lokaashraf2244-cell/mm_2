import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm/core/network/api/api_consumer.dart';
import 'package:mm/data/data_source/abstract/auth_datasource.dart';

class AuthDataSourceImpl implements AuthDataSource {

  final ApiConsumer apiConsumer;

  AuthDataSourceImpl(this.apiConsumer);

  @override
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    final response = await  apiConsumer.post(
      path: '/login',
      body: {
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