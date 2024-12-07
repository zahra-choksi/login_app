
import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user.dart';
import '../../../../core/exception/server_exception.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl (this.remoteDataSource);
  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
  }) async {
    try {
      final userId =   await remoteDataSource.signUpWithEmailPassword(
          name: name,
          email: email,
          password: password
      );
      return right(userId);
    } on ServerException catch(e) {
      return left(Failure(e.message));

    }

  }

  @override
  Future<Either<Failure, User>> logInWithEmailPassword({
    required String email,
    required String password
  }) async {
    try {
      final userId = await remoteDataSource.logInWithEmailPassword(
          email: email,
          password: password
      );
      return right(userId);
    } on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> currentUser() async{
    try {
      final user = await remoteDataSource.getCurrentUserData();
      if (user == null){
        return left(Failure('user not logged in'));
      }
      return right(user);
    }on ServerException
    catch(e){
      throw left(Failure(e.message));
    }
  }

}
