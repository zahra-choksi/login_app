
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/app_user/app_user_cubit.dart';
import '../../../../core/entities/user.dart';
import '../../../../core/usecase/use_case.dart';
import '../../domain/usecase/current_user.dart';
import '../../domain/usecase/log_in_usecase.dart';
import '../../domain/usecase/sign_up_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogIn _userLogIn;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogIn userLogIn,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  })
      : _userSignUp = userSignUp,
        _userLogIn = userLogIn,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_,emit)=> emit(AuthLoading()));
    on<AuthSignUp>(_authSignUp);
    on<AuthLogIn>(_authLogIn);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _authSignUp(AuthSignUp event, Emitter<AuthState> emit) async {

    final res = await _userSignUp(UserSignUpParams(
        name: event.name,
        email: event.email,
        password: event.password
    ));
    res.fold(
            (l) => emit(AuthFailure(l.message)),
            (r) => _emitAuthSuccess(r,emit)
    );
  }

  void _authLogIn (AuthLogIn event,Emitter<AuthState> emit )async {

    final res = await _userLogIn(UserLogInParams(
      email: event.email,
      password: event.password,
    ));
    res.fold(
            (l) => emit(AuthFailure(l.message)),
            (r) => _emitAuthSuccess(r,emit));
  }

  void _isUserLoggedIn (AuthIsUserLoggedIn event , Emitter<AuthState> emit)async {
    final res = await _currentUser(NoParams());
    res.fold(
          (l) => emit(AuthFailure(l.message)),
          (r) => _emitAuthSuccess(r,emit),
    );
  }
  void _emitAuthSuccess (User user , Emitter<AuthState> emit){
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
