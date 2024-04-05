import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBSzikstzLm3Vf4sGxzHds79e-6J6Q3Gek",
            authDomain: "genefarm-dinocoders.firebaseapp.com",
            projectId: "genefarm-dinocoders",
            storageBucket: "genefarm-dinocoders.appspot.com",
            messagingSenderId: "251957041943",
            appId: "1:251957041943:web:e62a006b93b4e350b1f552",
            measurementId: "G-QDD9SGT8CD"));
  } else {
    await Firebase.initializeApp();
  }
}
