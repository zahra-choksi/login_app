
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/common/app_user/app_user_cubit.dart';
import 'core/common/app_user/app_user_state.dart';
import 'core/themes/app_themes.dart';
import 'feature/auth/presentation/bloc/auth_bloc.dart';
import 'feature/auth/presentation/bloc/auth_event.dart';
import 'feature/auth/presentation/pages/home_screen.dart';
import 'feature/auth/presentation/pages/welcome_screen.dart';
import 'init_dependency.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AppUserCubit>()),
        BlocProvider(create: (_) => sl<AuthBloc>(),),
      ],
      child: const MyApp()
  )
  );
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.backgroundTheme,
      title: 'Login App',
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLogIn;
        },
        builder: (context, isLoggedIn) {
          if(isLoggedIn){
            return const HomeScreen();
          }
          return const WelcomeScreen();
        },
      ),

    );
  }
}

