import 'package:SAAYADecor/models/userModel.dart';
import 'package:SAAYADecor/screens/signin.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../repository/userRepository.dart';
import 'animation.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String route = "SignUp";
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? username;
  String? email;
  String? password;
  String? confirmPassword;

  _registerUser(User user) async {
    bool isLogin = await UserRepository().registerUser(user);
    if (isLogin) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 1,
              channelKey: 'basic_channel',
              title: 'Registered ',
              body: "Registration Successfull"));
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SignIn();
      }));
      //Navigator.popAndPushNamed(context, '/signin');
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(msg) {
    if (msg) {
      MotionToast.success(description: const Text('success register'))
          .show(context);
    } else {
      MotionToast.warning(description: const Text('error rergister'))
          .show(context);
    }
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white60, Colors.blueGrey, Colors.white70])),
        child: SafeArea(
          child: SizedBox(
            height: 900,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: myHeight * 0.07,
                    width: myWidth,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignIn(),
                                  ));
                            },
                            child:
                                const Icon(Icons.arrow_back_ios_new_rounded)),
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/image/SAAYALOGO.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          AnimationWidget(
                            axis: Axis.vertical,
                            curve: Curves.easeOutExpo,
                            offset: 100.0,
                            duration: const Duration(milliseconds: 800),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              // child: Text(
                              //   "SAAYA",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     color: Color.fromARGB(255, 18, 56, 120),
                              //     fontSize: 32.0,
                              //   ),
                              // ),
                            ),
                          ),
                          AnimationWidget(
                            axis: Axis.vertical,
                            curve: Curves.easeOutExpo,
                            offset: 100.0,
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      // Text(
                                      //   "Welcome,",
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.bold,
                                      //     color:
                                      //         Color.fromARGB(255, 18, 56, 120),
                                      //     fontSize: 22.0,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        "Create your account",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 18, 56, 120),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  TextFormField(
                                    key: const ValueKey('txtName'),
                                    controller: nameController,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      setState(() {
                                        username = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Name",
                                        suffixIcon: Icon(Icons.person),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(80))),
                                  ),
                                  const SizedBox(height: 10.0),
                                  TextFormField(
                                    key: const ValueKey('txtEmail'),
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      setState(() {
                                        email = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        suffixIcon: Icon(Icons.email),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(80))),
                                  ),
                                  const SizedBox(height: 10.0),
                                  TextFormField(
                                    key: const ValueKey('txtPassword'),
                                    controller: passwordController,
                                    
                                    obscureText: true,
                                    onChanged: (value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        //suffixIcon: Icon(Icons.lock),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(80))),
                                  ),
                                  const SizedBox(height: 10.0),
                                  TextFormField(
                                    key: const ValueKey('txtConfirmPassword'),
                                    controller: confirmPasswordController,
                                    
                                    obscureText: true,
                                    onChanged: (value) {
                                      setState(() {
                                        confirmPassword = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Confirm Password",
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                        ),
                              //            suffixIcon: IconButton(icon: Icon(_obscureText? Icons.visibility : Icons.visibility_off,), 
                              // onPressed: () {
                              //   setState(() {
                              //     _obscureText= !_obscureText;
                              //   });
                              //   },),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(80))),
                                  ),
                                  const SizedBox(height: 40.0),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        disabledForegroundColor: Colors
                                            .transparent
                                            .withOpacity(0.38),
                                        disabledBackgroundColor: Colors
                                            .transparent
                                            .withOpacity(0.12),
                                        shadowColor: Colors.transparent),
                                    key: const ValueKey('btnRegister'),
                                    onPressed: () {
                                      User user = User(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                      _registerUser(user);
                                    },
                                    child: Container(
                                      height: myHeight * 0.08,
                                      width: myWidth - 10,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color(0xFFF27121),
                                            Color(0xFFE94057),
                                            Color.fromARGB(255, 38, 152, 190),
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(25.0)),
                                      child: const Center(
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                        AnimationWidget(
                    axis: Axis.vertical,
                    curve: Curves.easeOutExpo,
                    offset: 100.0,
                    duration: const Duration(milliseconds: 2000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, SignIn.route);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignIn(),
                                ));
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color:  Color.fromARGB(255, 18, 56, 120),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                    
                          const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget orSignIn(String image, int duration) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return AnimationWidget(
      axis: Axis.vertical,
      curve: Curves.easeOutExpo,
      offset: 100.0,
      duration: Duration(milliseconds: duration),
      child: Container(
        height: myHeight * 0.08,
        width: myWidth * 0.16,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5.0)),
        child: Center(
          child: Image.asset(image, height: 30.0),
        ),
      ),
    );
  }
}
