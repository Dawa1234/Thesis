import 'package:SAAYADecor/models/profiles.dart';
import 'package:SAAYADecor/repository/profileRepository.dart';
import 'package:SAAYADecor/screens/cart/cart_screen.dart';
import 'package:SAAYADecor/screens/profile_page/change_password.dart';
import 'package:SAAYADecor/screens/profile_page/googlemap.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data_source/remote_data_source/response/profileResponse.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ShakeDetector? detector;
  void initState() {
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          // Navigator.pushNamed(context, "/");
          logout();
        });
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    detector!.stopListening();

    super.dispose();
  }

  @override
  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    Navigator.pushNamed(context, '/signin');
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: FutureBuilder<ProfileResponse?>(
        future: ProfileRepository().getprofile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Profile? profileResponse = snapshot.data!.user;
              return Column(
                children: [
                  ProfilePic(
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThlTauvFuw7q1xluWrxtf2uFBYgaa_a2GQfg&usqp=CAU"),
                  const SizedBox(height: 10),
                  Text(profileResponse!.name.toString(),
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0))),
                  Text(profileResponse.email.toString(),
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 0, 0, 0))),
                  const SizedBox(height: 20),
                  ProfileMenu(
                    text: "Edit Profile",
                    icon: "assets/icons/User Icon.svg",
                    press: () => {
                      Navigator.pushNamed(context, '/editprofile', arguments: {
                        "name": profileResponse.name.toString(),
                        "email": profileResponse.email.toString()
                      })
                    },
                  ),
                  ProfileMenu(
                    text: "Change Password",
                    icon: "assets/icons/Settings.svg",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePassword(),
                        ),
                      );
                    },
                  ),
                  ProfileMenu(
                    text: "About",
                    icon: "assets/icons/Location point.svg",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenu(
                    text: "My Cart",
                    icon: "assets/icons/Cart Icon.svg",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenu(
                    text: "Log Out",
                    icon: "assets/icons/Log out.svg",
                    press: () {
                      logout();
                    },
                  ),
                ],
              );
            }
            {
              return Center(
                child: Container(
                    child: Text(
                  "Please connect to internet ................",
                  style: TextStyle(fontSize: 40),
                )),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 37, 158, 172),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
