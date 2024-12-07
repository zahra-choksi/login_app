
import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user.dart';
import '../../../../core/failure/failure.dart';

abstract interface class AuthRepository {

  Future<Either<Failure,User>> signUpWithEmailPassword  ({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure,User>> logInWithEmailPassword ({
    required String email,
    required String password,
  });

  Future<Either<Failure,User>>  currentUser();
}

