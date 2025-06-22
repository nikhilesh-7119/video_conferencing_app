import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:zoom_clone_tutorial/resources/auth_methods.dart';
import 'package:zoom_clone_tutorial/screens/home_screen.dart';
import 'package:zoom_clone_tutorial/screens/login_screen.dart';
import 'package:zoom_clone_tutorial/screens/video_call_screen.dart';
import 'package:zoom_clone_tutorial/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDKk9McKverP8s5-Ws-issmoQMpQ_KHOrU",
        authDomain: "zoom-clone-tutorial-2ce09.firebaseapp.com",
        projectId: "zoom-clone-tutorial-2ce09",
        storageBucket: "zoom-clone-tutorial-2ce09.firebasestorage.app",
        messagingSenderId: "838519492963",
        appId: "1:838519492963:web:4dbe8f1af52d6a73c8c356",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Conferencing App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backGroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/video-call': (context) => const VideoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
