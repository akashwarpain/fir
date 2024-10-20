import 'package:fire/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fire/screens/auth.dart';
import 'package:fire/screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KNOWEDGE SHARING',
      theme: ThemeData().copyWith(
        // ignore: deprecated_member_use
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 7, 13, 97)),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }

          if (snapshot.hasData) {
            return HomeScreen(); // Replace with the appropriate screen
          }

          return const AuthScreen();
        },
      ),
    );
  }
}
