import 'package:ankara_workshop_web/screens/Home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyA56CtpF_XmfA5Ao0MncxzjpnbJp6wpeDg',
      appId: "1:1059742441724:web:3e940d05aeef5dea67f779",
      messagingSenderId: "1059742441724",
      projectId: "ankara-workshop",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
