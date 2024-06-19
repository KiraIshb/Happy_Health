import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/pages/registration.dart';

class FirebaseLogin extends StatelessWidget {
  const FirebaseLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError){
            return const Scaffold(
                body: Center(child: Text('Что-то пошло не так!')));
          }
          else if (snapshot.hasData)
            return const Reg();
          else
            return Reg();
        }
    );
  }
}

