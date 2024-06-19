import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/services/my_button.dart';
import 'package:untitled/services/my_text.dart';



class Profile1 extends StatefulWidget {

  @override
  State<Profile1> createState() => _Profile();
}

class _Profile extends State<Profile1>{
  String about_me = '';
  String username = '';

  //final user = FirebaseAuth.instance.currentUser!;

  void userOut() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
    Navigator.pushNamed(context, '/reg');
  }
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var snapshot = FirebaseFirestore.instance.collection('Users').snapshots();
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: MyText(text: 'Мой профиль', isTitle: true, isDark: true)
        ),
        body: StreamBuilder(
          stream: snapshot,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData) return Text('Загрузка');
              return Padding(
                padding: EdgeInsets.all(40),
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (snapshot.data!.docs[index].get('uid') ==
                        FirebaseAuth.instance.currentUser?.uid)
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(text: 'Личные данные', isTitle: false, isDark: true),
                          Text(snapshot.data!.docs[index].get('username')),
                          Text(snapshot.data!.docs[index].get('email')),
                          Padding(padding: EdgeInsets.only(top: 25)),
                          MyText(text: 'Обо мне:', isTitle: false, isDark: true),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  child: Text(snapshot.data!.docs[index].get('about_me')
                                  )
                                )
                              ],
                            )
                          ),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage('assets/pen.png'), width: 25, height: 25),
                                Padding(padding: EdgeInsets.only(right: 10)),
                                Text('Изменить данные профиля', style: TextStyle(color: Colors.black, fontSize: 15, decoration: TextDecoration.underline),)
                              ],
                            ),
                            onPressed: () {
                              showDialog(context: context, builder: (BuildContext context) {
                                return Scaffold(
                                  resizeToAvoidBottomInset: false,
                                  appBar: AppBar(),
                                  body: Padding(
                                    padding: EdgeInsets.all(60),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MyText(text: 'Имя:', isTitle: false, isDark: true),
                                        TextField(
                                          onChanged: (String value) {
                                            username = value;
                                          },
                                        ),
                                        Padding(padding: EdgeInsets.only(top: 30)),
                                        MyText(text: 'Обо мне:', isTitle: false, isDark: true),
                                        TextField(
                                          onChanged: (String value) {
                                            about_me = value;
                                          },
                                        ),
                                        Padding(padding: EdgeInsets.only(top: 50)),
                                        MyButton(
                                            textButton: 'Сохранить',
                                            onTap: () {
                                              if (username != ''){
                                                Map<String, String> ref = {
                                                  'username': username,
                                                };
                                                FirebaseFirestore.instance.collection('Users').
                                                doc(currentUser.uid).update(ref);
                                              }
                                              if (about_me != '') {
                                                Map<String, String> ref = {
                                                  'about_me': about_me,
                                                };
                                                FirebaseFirestore.instance.collection('Users').
                                                doc(currentUser.uid).update(ref);
                                              }
                                              Navigator.of(context).pop();
                                            }
                                        )
                                      ],
                                    )
                                  ),
                                  bottomSheet: TextButton(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.logout, size: 20, color: Colors.grey,),
                                        Padding(padding: EdgeInsets.only(right: 10)),
                                        Text('Выйти', style: TextStyle(color: Colors.grey, fontSize: 15, decoration: TextDecoration.underline),)
                                      ],
                                    ),
                                    onPressed: userOut,
                                  )
                                );
                              });
                            },
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          Image.asset('assets/animal3.png')
                        ],
                      );
                      else return Padding(padding: EdgeInsets.zero);
                  }
                )
              );
          }
        ),
    );
  }
}

