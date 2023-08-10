import 'package:SAAYADecor/repository/userRepository.dart';
import 'package:SAAYADecor/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../data_source/remote_data_source/response/profileResponse.dart';
import '../../models/profiles.dart';
import '../../repository/profileRepository.dart';
import 'components/profile_pic.dart';

class EditProfile extends StatefulWidget {
  final String? image;
  const EditProfile({super.key, this.image});
  static const String route = "EditProfile";
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  
  TextEditingController names = TextEditingController();
  TextEditingController email = TextEditingController();
     _updateUser(String ? name, String ?email ) async {
    bool isLogin = await UserRepository().updateProfile(name,email);
    if (isLogin) {
      Navigator.popAndPushNamed(context, SignIn.route);
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
  @override
  Widget build(BuildContext context) {
    final profile = ModalRoute.of(context)!.settings.arguments as Map;
    final namess = profile['name'];
    final emailr = profile['email'];
  
    names.text = namess;
    email.text = emailr;

return Scaffold(
     appBar: AppBar(
        title: const Text('Edit Profile'),
        elevation: 4.0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 37, 158, 172),
      ),
  body: ListView(
    children: [
      Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: FutureBuilder<ProfileResponse?>(
                  future: ProfileRepository().getprofile(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        Profile? profileResponse = snapshot.data!.user;
                        return Column(
                          children: [
                            ProfilePic(image: profileResponse!.avatar!.url),
                            const SizedBox(height: 10),
                            Text(profileResponse.name.toString(),
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0))),
                            Text(profileResponse.email.toString(),
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(255, 0, 0, 0))),
                         
                          ],
                        );
                      }
                      {
                        return const Center(
                          child: Text("No data"),
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
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
    ),
    Container(
     // padding: const EdgeInsets.only(top: 0.0),
        child: Stack(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 80.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 151, 194, 188),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                      top: 100.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: names,
                        decoration: InputDecoration(
                          labelText: 'Names',
                          prefixIcon: const Icon(Icons.person),
                          border: myInputBorder(),
                          enabledBorder: myInputBorder(),
                          focusedBorder: myFocusBorder(),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          border: myInputBorder(),
                          enabledBorder: myInputBorder(),
                          focusedBorder: myFocusBorder(),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                         _updateUser(names.text,email.text);


                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 37, 158, 172),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Update Profile'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          
        ]),
    ),
    ]
  ),
); 
  }

  OutlineInputBorder myInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 3.0,
      ),
    );
  }

  OutlineInputBorder myFocusBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 73, 40, 40),
        width: 3.0,
      ),
    );
  }
}
