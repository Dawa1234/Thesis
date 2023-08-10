
import 'package:SAAYADecor/screens/profile_page/profile_screen.dart';
import 'package:SAAYADecor/screens/profile_page/property_screen.dart';

import 'package:flutter/material.dart';
import './homepage_screen.dart';
import 'cart/cart_screen.dart';


class NavigationDrawers extends StatefulWidget {

  @override
  State<NavigationDrawers> createState() => _NavigationDrawersState();
}

class _NavigationDrawersState extends State<NavigationDrawers> {
  int _selectedIndex = 0;
  List<Widget> lstWidget = [HomePage(),  const CartScreen(),const PropertyScreen(), const ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(247, 222, 211, 211),
        currentIndex: _selectedIndex,
        unselectedItemColor: const Color.fromARGB(255, 37, 158, 172),
        selectedItemColor:  Color.fromARGB(255, 0, 37, 42),
        elevation: 10,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Cart',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Property',
          ),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
         
        ],
      ),
      body: lstWidget[_selectedIndex],
    );
  }
}
