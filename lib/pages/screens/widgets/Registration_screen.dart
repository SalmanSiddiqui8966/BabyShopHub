import 'package:babyshophub/pages/screens/widgets/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController name =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController Password=TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> sendData() async {
    String nameText = name.text;
    String emailText = email.text;
    String passwordText = Password.text;

    firestore.collection('user').add({
      "Name": nameText,
      "Email": emailText,
      "Password": passwordText,
    }).then((value) {
      print("Data saved successfully!");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }).catchError((error) {
      print("Failed to save data: $error");
    });
  }

  var _isVisisble = false;
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
                child: LayoutBuilder(
                  builder: (ctx, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Registration ",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.01,
                        ),
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
                                controller:name,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your name',
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
                                controller:email,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your gmail',
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
                                obscureText: _isVisisble ? false : true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisisble = !_isVisisble;
                                      });
                                    },
                                    icon: Icon(
                                      _isVisisble
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Enter your password',
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()),);
                            },
                            child: Text(
                              'Registered',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
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
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                            ]))
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
