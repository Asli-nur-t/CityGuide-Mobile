//Created by https://github.com/Asli-nur-t

import 'package:flutter/material.dart';

import '../../components/primary_button.dart';
import '../../constants.dart';
//import '../chats/chats_screen.dart';

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
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/images/Logo_light.png"
                    : "assets/images/Logo_dark.png",
                height: 250,
                width: 250,
                fit: BoxFit
                    .contain, // Görselin nasıl ölçeklendirileceğini belirler
              ),
              const SizedBox(height: kDefaultPadding),
              const Text(
                "Yeni yerler görmek ve unutulmaz anılar biriktirmek için CityGuide’a katılın.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 100, 1, 1)),
              ),

              const Spacer(),
              //PrimaryButton(
              // text: "Sign In",
              // press: () => Navigator.push(
              //context,
              // MaterialPageRoute(import 'package:flutter/material.dart';
              //
              // import '../../components/primary_button.dart';
              // import '../../constants.dart';
              // //import '../chats/chats_screen.dart';
              //
              // class SigninOrSignupScreen extends StatelessWidget {
              //   const SigninOrSignupScreen({super.key});
              //
              //   @override
              //   Widget build(BuildContext context) {
              //     return Scaffold(
              //       backgroundColor: kBackgroundColor,
              //       body: SafeArea(
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              //           child: Column(
              //             children: [
              //               const Spacer(flex: 2),
              //               Image.asset(
              //                 MediaQuery.of(context).platformBrightness == Brightness.light
              //                     ? "assets/images/Logo_light.png"
              //                     : "assets/images/Logo_dark.png",
              //                 height: 250,
              //                 width: 250,
              //                 fit: BoxFit
              //                     .contain, // Görselin nasıl ölçeklendirileceğini belirler
              //               ),
              //               const SizedBox(height: kDefaultPadding),
              //               const Text(
              //                 "Yeni yerler görmek ve unutulmaz anılar biriktirmek için CityGuide’a katılın.",
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     fontSize: 20,
              //                     fontWeight: FontWeight.w400,
              //                     color: Color.fromARGB(255, 100, 1, 1)),
              //               ),
              //
              //               const Spacer(),
              //               //PrimaryButton(
              //               // text: "Sign In",
              //               // press: () => Navigator.push(
              //               //context,
              //               // MaterialPageRoute(
              //               // builder: (context) => const ChatsScreen(),
              //               // ),
              //               // ),
              //               //),
              //               const SizedBox(height: kDefaultPadding * 1.5),
              //               PrimaryButton(
              //                 color: Theme.of(context).colorScheme.secondary,
              //                 text: "Sign Up",
              //                 press: () {},
              //               ),
              //               const Spacer(flex: 3),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   }
              // }
              // builder: (context) => const ChatsScreen(),
              // ),
              // ),
              //),
              const SizedBox(height: kDefaultPadding * 1.5),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: "Sign Up",
                press: () {},
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
