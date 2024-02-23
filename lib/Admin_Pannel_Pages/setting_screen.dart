import 'package:babyshophub/Admin_Pannel_Pages/admin.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool isLoggedIn = false;

  Future<void> sendData() async {
    if (isLoggedIn) {
      // Log out logic
      setState(() {
        isLoggedIn = false;
      });
      return;
    }

    String nameText = nameController.text;
    String emailText = emailController.text;
    String passwordText = passwordController.text;

    if (nameText.isEmpty || emailText.isEmpty || passwordText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter name, email, and password'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    setState(() {
      isLoggedIn = true;
    });

    // Save data to Firestore
    firestore.collection('Admin').add({
      "Name": nameText,
      "Email": emailText,
      "Password": passwordText,
    }).then((value) {
      print("Data saved successfully!");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Admin_Pannel()),
      );
    }).catchError((error) {
      print("Failed to save data: $error");

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save data. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  Widget _buildSliderText(String text) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      margin: EdgeInsets.only(bottom: 10),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildInputBox(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF4911A),
            ),
            child: Center(
              child: Text(
                'Admin',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          _buildInputBox('Name', nameController),
          SizedBox(height: 20),
          _buildInputBox('Email', emailController),
          SizedBox(height: 20),
          _buildInputBox('Password', passwordController, isPassword: true),
          SizedBox(height: 16),
          if (isLoggedIn)
            Center(
              child: ElevatedButton(
                onPressed: () {
                  sendData();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF4911A),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 18.0),
                  child: Text('Logout'),
                ),
              ),
            )
          else
            Center(
              child: ElevatedButton(
                onPressed: () {
                  sendData();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF4911A),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 18.0),
                  child: Text('Login'),
                ),
              ),
            ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Color(0xFF749F29),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 130.0),
                child: Row(
                  children: [
                    _buildSliderText('Dashboard'),
                    _buildSliderText('Category'),
                    _buildSliderText('Product'),
                    _buildSliderText('Order'),
                    _buildSliderText('Settings'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          _buildSettingsSection(),
        ],
      ),
    );
  }
}
