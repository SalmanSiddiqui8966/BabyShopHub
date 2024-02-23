import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Main_Page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var _isVisible = false;

  Future<void> sendData() async {
    String emailText = email.text;
    String passwordText = Password.text;

    // Basic validation check
    if (emailText.isEmpty || passwordText.isEmpty) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter both email and password'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    firestore.collection('user').add({
      "Email": emailText,
      "Password": passwordText,
    }).then((value) {
      print("Data saved successfully!");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainPageScreen()),
      );
    }).catchError((error) {
      print("Failed to save data: $error");

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to login. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  height: deviceHeight * 0.30,
                  child: FittedBox(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'lib/assets/images/child.jpg',
                      ),
                      radius: 120,
                    ),
                  ),
                ),
              ),
              Container(
                height: deviceHeight * 0.65,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(builder: (ctx, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login Now",
                        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.01),
                      Text('Please enter the details below to continue'),
                      SizedBox(
                        height: constraints.maxHeight * 0.08,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Center(
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'enter@gmail.com',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Center(
                            child: TextField(
                              controller: Password,
                              obscureText: !_isVisible,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _isVisible ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                border: InputBorder.none,
                                hintText: 'Password',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Color(0xFF749F29),
                                ),
                              ))
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.12,
                        margin: EdgeInsets.only(
                          top: constraints.maxHeight * 0.05,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            sendData();
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF4911A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Don\'t have an Account!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(
                                    text: ' Register',
                                    style: TextStyle(
                                        color: Color(0xFF749F29),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {})
                              ]))
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
