
import '../../../../core/entities/user.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState{}

final class AuthSuccess extends AuthState {
  final User id;
  AuthSuccess(this.id);
}

final class AuthFailure extends AuthState{
  final String message ;
  AuthFailure (this.message);
}
