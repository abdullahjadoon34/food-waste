import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eats/Db/Constants.dart';
import 'package:flutter_eats/Db/Services/AuthService.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final phone_numer = TextEditingController();
  final password_controller = TextEditingController();
  final mail_controller = TextEditingController();
  final name_controller = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Sign up',
          style: TextStyle(
            color: kTextColor,
          ),
        ),
      ),
      body: Center(
        child: Builder(
            builder: (context) => ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlutterLogo(
                          size: 70,
                          curve: Curves.easeInOutCubic,
                        )),
                    Container(
                      color: Colors.black45,
                      child: TextField(
                        controller: name_controller,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(CupertinoIcons.person_crop_circle),
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      color: Colors.black45,
                      child: TextField(
                        controller: phone_numer,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(CupertinoIcons.phone_circle),
                          labelText: 'Phone number',
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      color: Colors.black45,
                      child: TextField(
                        controller: mail_controller,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(CupertinoIcons.mail),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      color: Colors.black45,
                      child: TextField(

                        controller: password_controller,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(CupertinoIcons.lock_circle),
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoButton.filled(
                        child: Text('Create Account'),
                        onPressed: () async {
                          print('click');
                          Get.snackbar('Registering', 'processing request !',
                              showProgressIndicator: true,
                              snackPosition: SnackPosition.BOTTOM);
                          await AuthService()
                              .register(
                                phone_numer.text.toString().trim(),
                                password_controller.text.toString().trim(),
                                mail_controller.text.toString().trim(),
                                name_controller.text.toString().trim(),
                              )
                              .then((val) => {
                                print(val),
                                    if (val.data['success'])
                                      {
                                        saveLogin(val.data['msg']),
                                        Get.toNamed('/dashboard'),
                                      }
                                  })
                              .catchError((e) => {
                                    Get.snackbar('Error', e.toString(),
                                        snackPosition: SnackPosition.BOTTOM)
                                  });
                        },
                      ),
                    ),
                    SizedBox(height: 32.0),
                    FlatButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Already  have an account? ',
                              style:
                                  TextStyle(color: kTextColor, fontSize: 16)),
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 16))
                        ])))
                  ],
                )),
      ),
    );
  }

  saveLogin(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('token', token);
      print(prefs.getString('token'));
    });
  }
}
