//Created by https://github.com/Asli-nur-t

import 'package:flutter/material.dart';

import '../../components/primary_button.dart';
import '../../constants.dart';
import '../Login/login_screen.dart';
import '../signup/signup_screen.dart';

class SigninOrSignupScreen extends StatelessWidget {
  const SigninOrSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset(
                "assets/images/Travel.png",
                height: 250,
                width: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: kDefaultPadding),
              const Text(
                "Yeni yerler görmek ve unutulmaz anılar biriktirmek için CityGuide’a katılın.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 100, 1, 1),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                text: "Giriş Yap",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kTextFieldFillColor,
                ),
              ),
              const SizedBox(height: kDefaultPadding * 1.5),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: "Kaydol",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kTextFieldFillColor,
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
