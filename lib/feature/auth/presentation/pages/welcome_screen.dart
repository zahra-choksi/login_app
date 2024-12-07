
import 'package:flutter/material.dart';
import 'package:news_app/feature/auth/presentation/pages/sign_up_screen.dart';

import '../../../../core/themes/app_colors.dart';
import '../widgets/reusable_button.dart';
import 'log_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage("images/girl.png")),
          const SizedBox(height: 20,),
          Text("Hello !!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 30,
            ),),
          const SizedBox(height: 20,),
          Text(
            'Welcome to our blog App',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700
            ),
          ),
          const SizedBox(height: 20,),
          reusableButton(
              text: 'Log In',
              color: AppColors.white,
              gradientColor1: AppColors.gradient2,
              gradientColor2: AppColors.gradient1,
              func: (){
                Navigator.push(context, LogIn.route());
              }
          ),
          const SizedBox(height: 20,),
          reusableButton(
              text: "Sign Up",
              color: AppColors.gradient1,
              gradientColor1: AppColors.white,
              gradientColor2: AppColors.white,
              func: (){
                Navigator.push(context, SignUp.route());
              }
          )
        ],
      ),
    );
  }
}
