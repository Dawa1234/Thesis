import 'package:SAAYADecor/repository/profileRepository.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
static const String route = "ProfileScreen";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    
    super.initState();
    ProfileRepository().getprofile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 4.0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 37, 158, 172),
      ),
      body:  Body(),
      
    );
  }
}

