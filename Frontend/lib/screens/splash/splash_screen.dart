import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String route = "splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, '/signin');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueGrey, Colors.grey, Colors.blueGrey])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/image/SAAYALOGO.png',
                height: 200,
                width: 200,
              ),
            ),
            Center(
              child: Text(
                'Welcome to SAAYA Decor ',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Pleasw Wait',
              style: TextStyle(color: Colors.black, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
