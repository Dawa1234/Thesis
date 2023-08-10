import 'package:SAAYADecor/models/userModel.dart';
import 'package:SAAYADecor/repository/userRepository.dart';
import 'package:SAAYADecor/screens/animation.dart';
import 'package:SAAYADecor/screens/profile_page/change_password.dart';
import 'package:SAAYADecor/screens/signup.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/local_auth_api.dart';
import 'navigation_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String route = "SignIn";
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  _navigateToScreen(bool isLogin) {
    if (isLogin) {
      // MotionToast.success(description: const Text('success login'))
      //     .show(context);
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 1,
              channelKey: 'basic_channel',
              title: 'Sign in',
              body: "Sign In Successfull"));
      Navigator.pushNamed(context, '/navigation_screen');

      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return NavigationDrawers();
      // }));
    } else {
      MotionToast.error(
              description: const Text("Either email or password is incorrect"))
          .show(context);
    }
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
    } catch (e) {
      MotionToast.error(
        description: Text("Error:${e.toString()}"),
      ).show(context);
    }
  }

  var emailController = TextEditingController(text: "dawa123@gmail.com");
  var passwordController = TextEditingController(text: "123123");
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();

    autoLogin();
  }

  void autoLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    // print(token);

    if (token != null && token.isNotEmpty) {
      _navigateToScreen(true);
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 40.0),
                  Center(
                    child: Image.asset(
                      'assets/image/SAAYALOGO.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  AnimationWidget(
                    axis: Axis.vertical,
                    curve: Curves.easeOutExpo,
                    offset: 100.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Column(
                      children: [
                        Column(
                          children: const [
                            Text(
                              "Welcome to SAAYA DECOR,",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 18, 56, 120),
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              "Login your account",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 18, 56, 120),
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          key: ValueKey('txtEmail'),
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
                                  borderRadius: BorderRadius.circular(80))),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          obscureText: _obscureText,
                          key: ValueKey('txtPassword'),
                          controller: passwordController,

                          //obscureText: true,
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
                                  borderRadius: BorderRadius.circular(80))),
                        ),
                        const SizedBox(height: 10.0),
                        AnimationWidget(
                          axis: Axis.vertical,
                          curve: Curves.easeOutExpo,
                          offset: 100.0,
                          duration: const Duration(milliseconds: 2000),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Forgot Password? "),
                              GestureDetector(
                                onTap: () {
                                  //Navigator.pushNamed(context, FingerprintPage.route);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChangePassword(),
                                      ));
                                },
                                child: const Text(
                                  "Reset Password",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 18, 56, 120),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              disabledForegroundColor:
                                  Colors.transparent.withOpacity(0.38),
                              disabledBackgroundColor:
                                  Colors.transparent.withOpacity(0.12),
                              shadowColor: Colors.transparent),
                          key: ValueKey('btnLogin'),
                          onPressed: () {
                            User user = User(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            _loginUser(user);
                          },
                          child: Container(
                            height: myHeight * 0.08,
                            width: myWidth,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color(0xFFF27121),
                                  Color(0xFFE94057),
                                  Color.fromARGB(255, 38, 152, 190),
                                ]),
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: const Center(
                              child: Text(
                                "Sign In",
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
                  AnimationWidget(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildAuthenticate(context),
                    ],
                  )),
                  const SizedBox(height: 40.0),
                  const SizedBox(height: 40.0),
                  AnimationWidget(
                    axis: Axis.vertical,
                    curve: Curves.easeOutExpo,
                    offset: 100.0,
                    duration: const Duration(milliseconds: 2000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Dont have an account? "),
                        GestureDetector(
                          onTap: () {
                            //  Navigator.pushNamed(context, SignUp.route);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp(),
                                ));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color.fromARGB(255, 18, 56, 120),
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

  Widget buildAvailability(BuildContext context) => buildButton(
        text: 'Check Availability',
        icon: Icons.event_available,
        onClicked: () async {
          final isAvailable = await LocalAuthApi.hasBiometrics();
          final biometrics = await LocalAuthApi.getBiometrics();

          final hasFingerprint = biometrics.contains(BiometricType.fingerprint);

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Availability'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildText('Biometrics', isAvailable),
                  buildText('Fingerprint', hasFingerprint),
                ],
              ),
            ),
          );
        },
      );

  Widget buildText(String text, bool checked) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            checked
                ? Icon(Icons.check, color: Colors.green, size: 24)
                : Icon(Icons.close, color: Colors.red, size: 24),
            const SizedBox(width: 12),
            Text(text, style: TextStyle(fontSize: 24)),
          ],
        ),
      );

  Widget buildAuthenticate(BuildContext context) => buildButton(
        text: 'Authenticate',
        icon: Icons.fingerprint,
        onClicked: () async {
          final isAuthenticated = await LocalAuthApi.authenticate();

          if (isAuthenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => NavigationDrawers()),
            );
          }
        },
      );

  Widget buildButton({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      IconButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
        ),
        icon: Icon(icon, size: 66),
        onPressed: onClicked,
      );
}
