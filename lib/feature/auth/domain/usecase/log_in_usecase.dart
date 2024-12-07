
import 'package:fpdart/fpdart.dart';

import '../../../../core/entities/user.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../repository/auth_repository.dart';

class UserLogIn implements UseCase<User,UserLogInParams> {
  final AuthRepository authRepository;
  UserLogIn(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLogInParams params) async{
    return await authRepository.logInWithEmailPassword(
      email: params.email,
      password: params.password,
    );

  }

}


class UserLogInParams {
  final String email;
  final String password;
  UserLogInParams({
    required this.email,
    required this.password
  });
}