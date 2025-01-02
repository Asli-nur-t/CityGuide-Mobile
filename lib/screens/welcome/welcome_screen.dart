import '../../constants.dart';
import '../signinOrSignUp/signin_or_signup_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui'; // For ImageFilter.blur

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Resmi tam ekran olarak ayarla
          Positioned.fill(
            child: Image.asset(
              "assets/images/italy.jpg",
              fit: BoxFit.cover, // Ekranı tamamen kaplamasını sağlar
            ),
          ),
          // İçeriği ekle
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.9, // Ekranın %90'ını kaplayacak şekilde ayarlandı
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      color: Colors.deepOrange.withOpacity(0.0),
                      child: Text(
                        "Seyahat Uygulamana \n Hoşgeldin!",
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Boşluk eklemek için
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.9, // Ekranın %90'ını kaplayacak şekilde ayarlandı
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      color: Colors.blueGrey.withOpacity(0.0),
                      child: Text(
                        "CityGuide ile en popüler yerleri, gizli köşeleri  ve en iyi restoranları keşfedin.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                FittedBox(
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninOrSignupScreen(),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Atla",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
