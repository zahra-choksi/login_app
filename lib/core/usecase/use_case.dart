import 'package:fpdart/fpdart.dart';
import 'package:news_app/core/failure/failure.dart';

abstract interface class UseCase<SuccessType ,Params>{
  Future<Either<Failure,SuccessType>> call(Params params);
}

class NoParams{}