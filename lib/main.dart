import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/models/resturent.dart';

import 'package:resturent_app/pages/services/auth/auth_get.dart';

import 'package:resturent_app/pages/themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        //theme provider
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),

        //resturent provider

        ChangeNotifierProvider(
          create: (context) => Resturent(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resturent App',
      home: AuthGet(),
      theme: themeProvider.themeData,
      darkTheme: ThemeData.dark(),
    );
  }
}
