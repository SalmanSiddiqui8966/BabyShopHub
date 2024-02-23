
import 'package:babyshophub/pages/screens/Main_Page.dart';
import 'package:babyshophub/pages/screens/widgets/Registration_screen.dart';
import 'package:babyshophub/pages/screens/widgets/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 50000),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RegistrationScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            color: Colors.white,
          ),
          ClipPath(
            clipper: NativeClipper(),
            child: Container(
              height: 450,
              color: Color(0xFFF4911A),
            ),
          ),
          Positioned(
            bottom: 405.0, // Adjust this value as per your requirement
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/round image.png'),
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 400.0),
                child: Container(
                  child: Text(
                    'Your One-Stop Destination \n       for Baby Essentials \n          BabyShopHub',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 140,),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 700.0),
              child: Container(
                width: 350,
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen(),),);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF749F29),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 25.0, // Adjust this value as per your requirement
            bottom: 35.0, // Adjust this value as per your requirement
            child: Container(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPageScreen(),),);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: Color(0xFF749F29), fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}

class NativeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(top: 140.0),
    //           child: Center(
    //             child: Lottie.asset("lib/assets/baby.json"),
    //           ),
    //         ),
    //         SizedBox(height: 20), // Add some space between Lottie animation and the container
    //         Padding(
    //           padding: const EdgeInsets.only(top: 60.0),
    //           child: Container(
    //             height: 60,
    //             width: 350,
    //             decoration: BoxDecoration(
    //               color: Color(0xFF749F29),
    //               borderRadius: BorderRadius.circular(30),
    //             ),
    //             child: Center(
    //               child: Text(
    //                 'Get Started', // Updated the text to include the price
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 17,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //
    //
    //
    //
    //
    // );


