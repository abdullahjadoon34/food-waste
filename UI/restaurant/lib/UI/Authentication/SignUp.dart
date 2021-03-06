import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/Services/Auth/Authservice.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final phone_numer = TextEditingController();
  final password_controller = TextEditingController();
  final mail_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                // Image.asset('assets/diamond.png')
                Icon(Icons.person_outline, size: 50.0),
                SizedBox(height: 16.0),
                Text('Create Account'),
              ],
            ),
            SizedBox(height: 70.0),
            TextField(
              controller: phone_numer,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.phone_android),
                labelText: 'Phone number',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: mail_controller,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.mail),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: password_controller,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Create Account'),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () async {
                  print('click');
                  Get.snackbar('Registering', 'processing request !',
                      showProgressIndicator: true,
                      snackPosition: SnackPosition.BOTTOM);
                  await AuthService()
                      .addNew(
                          phone_numer.text.toString().trim(),
                          password_controller.text.toString().trim(),
                          mail_controller.text.toString().trim())
                      .then((val) => {
                    print(val),
                            if (val.data['success'])
                              {

                                Get.toNamed('/dashboard'),
                                // Fluttertoast.showToast(
                                //     msg: val.data['msg'].toString(),
                                //     toastLength: Toast.LENGTH_LONG,
                                //     gravity: ToastGravity.BOTTOM,
                                //     backgroundColor: Colors.grey,
                                //     textColor: Colors.white,
                                //     fontSize: 16.0)
                              }

                          }
                          )
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
                  Get.toNamed('/login');
                },
                child: Text('Already have an account? Login'))
          ],
        ),
      ),
    );
  }
}
