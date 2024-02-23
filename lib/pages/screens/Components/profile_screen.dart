import 'dart:js';

import 'package:babyshophub/pages/screens/widgets/login_screen.dart';
import 'package:flutter/material.dart';

import '../Main_Page.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);
  void dialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: ListTile(
                      leading: Icon(Icons.camera),
                      title: Text('Camera'),
                    ),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF749F29),
        title: const Text("Profile"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPageScreen(),),);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileCircle(),
            SizedBox(
              height: 40,
            ), // Added profile circle
            ProfileMenu(
              text: "My Account",
              icon: Icons.account_circle, // Replace with desired IconData
              press: () => {},
            ),
            SizedBox(
              height: 30,
            ),
            ProfileMenu(
              text: "Notifications",
              icon: Icons.notifications, // Replace with desired IconData
              press: () {},
            ),
            SizedBox(
              height: 30,
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icons.settings, // Replace with desired IconData
              press: () {},
            ),
            SizedBox(
              height: 30,
            ),
            ProfileMenu(
              text: "Help Center",
              icon: Icons.help, // Replace with desired IconData
              press: () {},
            ),
            SizedBox(
              height: 30,
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icons.exit_to_app, // Replace with desired IconData
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen(),),);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCircle() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            'lib/assets/images/salmansiddiqui.png',
          ),
          fit: BoxFit.cover, // Adjust this based on your requirement
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){

              },
              child: Icon(
                Icons.camera_alt,
                color: Color(0xFF749F29),size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback press;

  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
              color: Color(0xFFF4911A),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
