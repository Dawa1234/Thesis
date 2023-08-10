import 'package:flutter/material.dart';

import '../data_source/remote_data_source/response/profileResponse.dart';
import '../models/profiles.dart';
import '../repository/profileRepository.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/homepage_screen.dart';
import '../screens/order_history/order_history.dart';
import '../screens/profile_page/components/profile_pic.dart';
import '../screens/profile_page/profile_screen.dart';

class Navbar extends StatefulWidget {
  final String? image;
  const Navbar({Key? key, this.image}) : super(key: key);
  static const String route = "Navbar";
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<Widget> lstWidget = [
    HomePage(),
    const CartScreen(),
    const ProfileScreen(),
    const OrderHistory()
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              color: const Color.fromARGB(255, 37, 158, 172),
              padding: EdgeInsets.only(
                  top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
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
                          const SizedBox(height: 5),
                          Text('Kathmandu, Nepal')
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
            ListTile(
              leading: const Icon(Icons.home),
              iconColor: Colors.black,
              title: const Text(
                'Home',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/navigation_screen');
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text(
                'About',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/map');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text(
                'Cart',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/carts');
              },
            ),
            ListTile(
              leading: const Icon(Icons.my_library_books),
              title: const Text(
                'My Order',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/order_history');
              },
            ),
            // const Divider(
            //   color: Colors.black54,
            // ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text(
                'Profile',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
