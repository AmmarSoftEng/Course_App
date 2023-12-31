import 'package:dcloginscreen/hometwo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kSidebarBackgroundColor,
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        transform: Matrix4.translationValues(0, -75, 0),
                        child: Image.asset(
                          'asset/illustrations/illustration-14.png',
                        )),
                    Container(
                      transform: Matrix4.translationValues(0, -175, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Learn to desing\nand code apps',
                            style:
                                kLargeTitleStyle.copyWith(color: Colors.white),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            'Completed courses aboute the best\ntools and design system',
                            style: kHeadlineLabelStyle.copyWith(
                                color: Colors.white70),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  transform: Matrix4.translationValues(0, -150, 0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 53.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Log in to",
                          style: kTitle1Style,
                        ),
                        Text(
                          'Start Learning',
                          style: kTitle1Style.apply(color: Color(0xFF5B4CF0)),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 130,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kShadowColor,
                                      offset: Offset(0, 12),
                                      blurRadius: 16.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0, left: 16.0, right: 16.0),
                                      child: TextField(
                                        cursorColor: kPrimaryLabelColor,
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.email,
                                            color: Color(0xFF5488FF1),
                                            size: 20.0,
                                          ),
                                          border: InputBorder.none,
                                          hintText: 'Email Address',
                                          helperStyle: kLoginInputTextStyle,
                                        ),
                                        style: kLoginInputTextStyle.copyWith(
                                            color: Colors.black),
                                        onChanged: (textemail) {
                                          email = textemail;
                                          print(email);
                                        },
                                      ),
                                    ),
                                    Divider(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 5.0, left: 16.0, right: 16.0),
                                      child: TextField(
                                        obscureText: true,
                                        cursorColor: kPrimaryLabelColor,
                                        decoration: InputDecoration(
                                          icon: const Icon(
                                            Icons.lock,
                                            color: Color(0xFF5488FF1),
                                            size: 20.0,
                                          ),
                                          border: InputBorder.none,
                                          hintText: 'Password',
                                          helperStyle: kLoginInputTextStyle,
                                        ),
                                        style: kLoginInputTextStyle.copyWith(
                                            color: Colors.black),
                                        onChanged: (textpassword) {
                                          email = textpassword;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                try {
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Hometwo()));
                                } on FirebaseAuthException catch (err) {
                                  if (err.code == 'user-not-found') {
                                    try {
                                      await _auth
                                          .createUserWithEmailAndPassword(
                                              email: email, password: password)
                                          .then((user) => {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Hometwo(),
                                                  ),
                                                ),
                                              });
                                    } catch (e) {}
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content:
                                                Text(err.message.toString()),
                                            actions: [
                                              FloatingActionButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              )
                                            ],
                                          );
                                        });
                                  }
                                }
                              },
                              child: Container(
                                height: 47.0,
                                width: MediaQuery.of(context).size.width * 0.3,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.0),
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF73A0F4),
                                    Color(0xFF4A47F5)
                                  ]),
                                ),
                                child: Text(
                                  'Login',
                                  style: kCalloutLabelStyle.copyWith(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: Text(
                            'Forgot password',
                            style: kCalloutLabelStyle.copyWith(
                                color: Color(0x721B1E9C)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
