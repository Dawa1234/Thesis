import 'package:SAAYADecor/repository/userRepository.dart';
import 'package:SAAYADecor/screens/profile_page/profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../data_source/remote_data_source/response/profileResponse.dart';
import '../../models/profiles.dart';
import '../../repository/profileRepository.dart';
import 'components/profile_pic.dart';

class ChangePassword extends StatefulWidget {
  final String? image;
  const ChangePassword({super.key, this.image});
  static const String route = "Change Password";
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  
  @override
  Widget build(BuildContext context) {
      void _changePasswordUrl(String? oldPassword, String? newPassword, String? passwordConfirm) async {
      try {
        UserRepository userRepository = UserRepository();

        bool isLogin = await userRepository.changePassword(oldPassword, newPassword, passwordConfirm);
        if(isLogin==true){
          print("password changed");
        }
        else{
          print("password not changed");
        }
  
      
      } catch (e) {
        MotionToast.error(
          description: Text("Error:${e.toString()}"),
        ).show(context);
      }
    }

    TextEditingController oldPassword = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

return Scaffold(
     appBar: AppBar(
        title: const Text('Change Password'),
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
                          controller: oldPassword,
                          decoration: InputDecoration(
                            labelText: 'Old Password',
                            prefixIcon: Icon(Icons.lock),
                            border: myInputBorder(),
                            enabledBorder: myInputBorder(),
                            focusedBorder: myFocusBorder(),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: newPassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            border: myInputBorder(),
                            enabledBorder: myInputBorder(),
                            focusedBorder: myFocusBorder(),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          controller:  confirmPassword,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            prefixIcon: Icon(Icons.lock),
                            border: myInputBorder(),
                            enabledBorder: myInputBorder(),
                            focusedBorder: myFocusBorder(),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            
                            _changePasswordUrl(oldPassword.text, newPassword.text, confirmPassword.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ),
                            );
                          

                          },
                          child: Text('Update Password'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 37, 158, 172),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            textStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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

// import 'package:SAAYA_Ecommerce/repository/userRepository.dart';
// import 'package:SAAYA_Ecommerce/screens/profile_page/profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:motion_toast/motion_toast.dart';

// class ChangePassword extends StatefulWidget {
//   // final String? image;
//   const ChangePassword({super.key,});

//   static const String route = "ChangePassword";
//   @override
//   State<ChangePassword> createState() => _ChangePasswordState();
// }

// class _ChangePasswordState extends State<ChangePassword> {
//   @override
//   Widget build(BuildContext context) {

//     void _changePasswordUrl(String? oldPassword, String? newPassword, String? passwordConfirm) async {
//       try {
//         UserRepository userRepository = UserRepository();

//         bool isLogin = await userRepository.changePassword(oldPassword, newPassword, passwordConfirm);
//         if(isLogin==true){
//           print("password changed");
//         }
//         else{
//           print("password not changed");
//         }
  
      
//       } catch (e) {
//         MotionToast.error(
//           description: Text("Error:${e.toString()}"),
//         ).show(context);
//       }
//     }

//     TextEditingController oldPassword = TextEditingController();
//     TextEditingController newPassword = TextEditingController();
//     TextEditingController confirmPassword = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Change Password'),
//         elevation: 4.0,
//         centerTitle: true,
//         backgroundColor: Color.fromARGB(255, 37, 158, 172),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only(top: 50.0),
//           child: Stack(children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(top: 80.0),
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               decoration: const BoxDecoration(
//                 color: Colors.amber,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40.0),
//                   topRight: Radius.circular(40.0),
//                 ),
//               ),
//               child: Column(
//                 // ignore: prefer_const_literals_to_create_immutables
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
//                     child: Column(
//                       children: <Widget>[
//                         TextField(
//                           controller: oldPassword,
//                           decoration: InputDecoration(
//                             labelText: 'Old Password',
//                             prefixIcon: Icon(Icons.lock),
//                             border: myInputBorder(),
//                             enabledBorder: myInputBorder(),
//                             focusedBorder: myFocusBorder(),
//                           ),
//                         ),
//                         SizedBox(height: 20.0),
//                         TextField(
//                           controller: newPassword,
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             prefixIcon: Icon(Icons.lock),
//                             border: myInputBorder(),
//                             enabledBorder: myInputBorder(),
//                             focusedBorder: myFocusBorder(),
//                           ),
//                         ),
//                         const SizedBox(height: 20.0),
//                         TextField(
//                           controller:  confirmPassword,
//                           decoration: InputDecoration(
//                             labelText: 'Confirm Password',
//                             prefixIcon: Icon(Icons.lock),
//                             border: myInputBorder(),
//                             enabledBorder: myInputBorder(),
//                             focusedBorder: myFocusBorder(),
//                           ),
//                         ),
//                         const SizedBox(height: 20.0),
//                         ElevatedButton(
//                           onPressed: () {
                            
//                             _changePasswordUrl(oldPassword.text, newPassword.text, confirmPassword.text);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProfileScreen(),
//                               ),
//                             );
                          

//                           },
//                           child: Text('Update Password'),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Color.fromARGB(255, 96, 18, 213),
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 40.0, vertical: 10.0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                             textStyle: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Stack(
//                 children: <Widget>[
//                   ClipOval(
//                     child: Image.asset(
//                       'assets/image/passwords.webp',
//                       width: 150,
//                       height: 150,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   // Positioned(
//                   //   bottom: 5,
//                   //   right: 15.5,
//                   //   child: Container(
//                   //       padding: const EdgeInsets.all(5.0),
//                   //       decoration: BoxDecoration(
//                   //         color: Colors.blueGrey,
//                   //         borderRadius: BorderRadius.circular(150),
//                   //       ),
//                   //       child: const Icon(
//                   //         Icons.edit,
//                   //         size: 30,
//                   //       )),
//                   // ),
//                 ],
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }

//   OutlineInputBorder myInputBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(20.0),
//       borderSide: BorderSide(
//         color: Colors.black,
//         width: 3.0,
//       ),
//     );
//   }

//   OutlineInputBorder myFocusBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(20.0),
//       borderSide: BorderSide(
//         color: Color.fromARGB(255, 11, 146, 218),
//         width: 3.0,
//       ),
//     );
//   }
// }

