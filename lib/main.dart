//Created by https://github.com/Asli-nur-t

import 'package:cityguidemob/models/place.dart';
import 'package:cityguidemob/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/welcome/welcome_screen.dart';
import 'theme.dart';
import 'package:flutter/material.dart';
import 'package:chucker_flutter/chucker_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ChuckerFlutter.showNotification = true;
  await Hive.initFlutter();
  Hive.registerAdapter(PlaceAdapter()); // Adapter'i kaydet
  await Hive.openBox<Place>('favorites'); // 'favorites' kutusunu aç
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Guide Mobile',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.light,
      home: const WelcomeScreen(),
      routes: AppRoutes.routes,
    );
  }
}
