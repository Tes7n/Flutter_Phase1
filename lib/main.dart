import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_1nep/provider/locationprovider.dart';
import 'package:flutter_1nep/screens/start/home/startscreen.dart';
import 'package:flutter_1nep/screens/start/home/homestack.dart';
import 'package:flutter_1nep/screens/start/home/homestack.dart';
import 'package:flutter_1nep/screens/customwidgets/loadingscreen.dart';
import 'package:flutter_1nep/screens/start/verification/loginpage.dart';
import 'package:flutter_1nep/screens/start/welcome/onboardscreen.dart';
import 'package:flutter_1nep/screens/start/verification/otpscreen.dart';
import 'package:flutter_1nep/screens/start/splashscreen/splashscreen.dart';
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
    return MaterialApp(home: StartScreen());
  }
}
