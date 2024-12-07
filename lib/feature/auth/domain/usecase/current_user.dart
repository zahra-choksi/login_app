import 'package:fpdart/fpdart.dart';
import 'package:news_app/core/entities/user.dart';
import 'package:news_app/core/failure/failure.dart';
import 'package:news_app/core/usecase/use_case.dart';
import 'package:news_app/feature/auth/domain/repository/auth_repository.dart';

class CurrentUser implements UseCase <User,NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params)async {
    return await authRepository.currentUser();
  }

}