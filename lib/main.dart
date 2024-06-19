import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/pages/list_ready_habit.dart';
import 'package:untitled/pages/auth_page.dart';
import 'package:untitled/services/notice.dart';
import 'firebase_options.dart';
import 'package:untitled/pages/registration.dart';
import 'package:untitled/pages/menu.dart';
import 'package:untitled/pages/habits.dart';
import 'package:untitled/pages/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAPI().initNotification();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AuthPage(),
        '/reg': (context) => Reg(),
        '/menu': (context) => Menu(),
        '/hab': (context) => ListHabits(),
        '/prof': (context) => Profile1(),
        '/ready': (context) => ListCategory()
      },
    )
  );
}