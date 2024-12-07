
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utilis/show_snackbar.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/reusable_button.dart';
import 'log_in_screen.dart';

class SignUp extends StatefulWidget {

  static route() => MaterialPageRoute(builder: (context) => const SignUp());

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is AuthFailure){
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if(state is AuthLoading){
              return const Loader();
            }
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    text(
                        boldText: 'Welcome to our Blog App',
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                    const SizedBox(height: 10,),
                    text(
                      boldText: 'Thank you for choosing our app',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 40,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: text(
                          boldText: 'Username',
                          fontWeight: FontWeight.w600,
                          fontSize: 19
                      ),
                    ),
                    const SizedBox(height: 20,),
                    authField(
                        nameController,
                        'username'
                    ),
                    const SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: text(
                          boldText: 'E-mail',
                          fontWeight: FontWeight.w600,
                          fontSize: 19
                      ),
                    ),
                    const SizedBox(height: 20,),
                    authField(
                        emailController,
                        'email'
                    ),
                    const SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: text(
                          boldText: 'Password',
                          fontWeight: FontWeight.w600,
                          fontSize: 19
                      ),
                    ),
                    const SizedBox(height: 20,),
                    authField(
                      passwordController,
                      'password',
                    ),
                    const SizedBox(height: 40,),
                    reusableButton(
                        func: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(AuthSignUp(
                                name: nameController.text.toString(),
                                email: emailController.text.toString(),
                                password: passwordController.text.toString()
                            ));
                           // Navigator.push(context, HomeScreen.route());
                          }

                        },
                        text: 'Sign up',
                        color: AppColors.white,
                        gradientColor1: AppColors.gradient2,
                        gradientColor2: AppColors.gradient1
                    ),
                    const SizedBox(height: 20,),
                    text(
                        boldText: 'OR',
                        fontSize: 30,
                        fontWeight: FontWeight.w500
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text(
                            boldText: 'You have Account ??',
                            fontWeight: FontWeight.w400,
                            fontSize: 20
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, LogIn.route());
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  color: AppColors.gradient2,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
