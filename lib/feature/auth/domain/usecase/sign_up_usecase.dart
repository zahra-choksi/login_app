
import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../repository/auth_repository.dart';

class UserSignUp implements UseCase<User,UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
        name: params.name,
        email: params.email,
        password: params.password
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password
  });
}

