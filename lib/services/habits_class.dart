import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class classHabit extends StatefulWidget {

  String state1;
  String state2;

  classHabit({super.key, required this.state1, required this.state2});

  @override
  State<classHabit> createState() => _classHabit(this.state1, this.state2);
}

class _classHabit extends State<classHabit> {

  bool ab = true;
  String state1;
  String state2;
  String about = '';
  String name = '';
  final currentUser = FirebaseAuth.instance.currentUser!;

  _classHabit(this.state1, this.state2);

  Padding _state1(){
    return Padding(
        padding: EdgeInsets.all(20),
        child: Text(state1, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600, decoration: TextDecoration.none))
    );
  }

  Padding _state2(){
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(state1, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600, decoration: TextDecoration.none)),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(state2, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500, decoration: TextDecoration.none)),
            ]
        )
    );
  }

  reverse() {
    setState(() {
      ab = ab? false:true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: reverse,
        child: DecoratedBox(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/gradient_full.jpg'), fit: BoxFit.none), borderRadius: BorderRadius.circular(17)),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                ab? _state1():_state2()
              ]
            )

        )
    );
  }
}