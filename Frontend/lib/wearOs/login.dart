import 'package:SAAYADecor/wearOs/dashboard.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

import '../models/userModel.dart';
import '../repository/userRepository.dart';

class WearOsLogin extends StatefulWidget {
  const WearOsLogin({Key? key}) : super(key: key);

  static String route = '/wearOsLoginScreen';
  @override
  State<WearOsLogin> createState() => _WearOsLoginState();
}

class _WearOsLoginState extends State<WearOsLogin> {
  _navigateToScreen(bool isLogin) {
    if (isLogin) {
       AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 1,
              channelKey: 'basic_channel',
              title: 'SignIn ',
              body: "SignIn Successfull"));
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AllProduct();
      }));
    } else {}
  }

  _loginUser(User user) async {
    try {
      UserRepository userRepository = UserRepository();

      bool isLogin = await userRepository.loginUser(user);

      if (isLogin) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {}
  }

  final email = TextEditingController(text: "safalstha818@gmail.com");
  final password = TextEditingController(text: "123456789");
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
      return AmbientMode(
        builder: (context, mode, child) {
          return Scaffold(
            backgroundColor: Colors.white,
              body: SafeArea(
                
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      Center(
                  child: Image.asset(
                    'assets/image/saaya.png',
                    height: 40,
                    width: 40,
                  ),
                  
                ),
                SizedBox(height: 5,),
                      SizedBox(
                        height: 35,
                        child: TextFormField(
                          controller: email,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            // hintText: 'username',
                            // hintStyle: TextStyle(fontSize: 10),
                            labelText: 'Username',
                            labelStyle: TextStyle(fontSize: 10),
                          ),
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 35,
                        child: TextFormField(
                          obscureText: true,
                          controller: password,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                            
                            hintStyle: TextStyle(fontSize: 10),
                            labelText: ' Password',
                            labelStyle: TextStyle(fontSize: 10),
                          ),
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              User user = User(
                                email: email.text,
                                password: password.text,
                              );
                              _loginUser(user);
                            },
                            child: const Text("login")),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
      );
    });
  }
}
