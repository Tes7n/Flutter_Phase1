import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1nep/provider/locationprovider.dart';
import 'package:flutter_1nep/screens/home.dart';
import 'package:flutter_1nep/screens/loadingscreen.dart';
import 'package:flutter_1nep/screens/loginpage.dart';
import 'package:flutter_1nep/screens/onboard.dart';
import 'package:flutter_1nep/screens/onboardscreen.dart';
import 'package:flutter_1nep/screens/otpscreen.dart';
import 'package:flutter_1nep/screens/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LocationProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: OnBoardScreen());
  }
}
