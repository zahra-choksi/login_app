import '../../entities/user.dart';

class AppUserState {}

final class AppUserInitial extends AppUserState {}

final class AppUserLogIn extends AppUserState {
  final User user;
  AppUserLogIn(this.user);

}
