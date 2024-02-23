import 'package:babyshophub/Admin_Pannel_Pages/admin.dart';
import 'package:babyshophub/Admin_Pannel_Pages/category_screen.dart';
import 'package:babyshophub/pages/baby_food_screen.dart';
import 'package:babyshophub/pages/cloth_screen.dart';
import 'package:babyshophub/pages/diapers_screen.dart';
import 'package:babyshophub/pages/screens/Main_Page.dart';
import 'package:babyshophub/pages/screens/checkout_screen.dart';
import 'package:babyshophub/pages/screens/detail_screen.dart';
import 'package:babyshophub/pages/screens/widgets/Registration_screen.dart';
import 'package:babyshophub/pages/screens/widgets/detail2_screen.dart';
import 'package:babyshophub/pages/screens/widgets/login_screen.dart';
import 'package:babyshophub/pages/screens/widgets/order_screen.dart';
import 'package:babyshophub/pages/screens/Components/profile_screen.dart';
import 'package:babyshophub/pages/screens/widgets/order_success_screen.dart';
import 'package:babyshophub/pages/screens/widgets/search_page_screen.dart';
import 'package:babyshophub/pages/screens/widgets/splash_screen.dart';
import 'package:babyshophub/pages/shopping_cart_screen.dart';
import 'package:babyshophub/pages/toys_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Admin_Pannel_Pages/order_screen.dart';
import 'Admin_Pannel_Pages/product_screen.dart';
import 'Admin_Pannel_Pages/setting_screen.dart';
import 'firebase_options.dart';
import 'package:file_picker/file_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

// void main() {
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//   ));
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: RegistrationScreen(),
      // home: LoginScreen(),
      // home: MainPageScreen(),
      // home: OrderSuccessPage(),
      // home: ProfileSettingsPage(),
      // home: DetailPage(),
      // home: DetailPage2(),
      // home: ToysPage(),
      // home: ClothPage(),
      // home: DiaperPage(),
      // home: BabyfoodPage(),
      // home: OrderHistoryScreen(),
      // home: ShoppingCart(),
      // home: CheckOutPage(),
      //  home: OrderHistoryScreen(),
      // home: SearchProductPage(),
      // home:Admin_Pannel(),
      // home: CategoryPage(),
      // home: ProductPage(),
      // home: OrderPage(),
      // home: SettingPage(),
      // home: ProfileScreen(),
    );
  }
}
