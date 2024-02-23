import 'package:babyshophub/pages/screens/Components/profile_screen.dart';
import 'package:babyshophub/pages/screens/widgets/order_screen.dart';
import 'package:babyshophub/pages/screens/widgets/search_page_screen.dart';
import 'package:babyshophub/pages/screens/widgets/splash_screen.dart';
import 'package:babyshophub/pages/shopping_cart_screen.dart';
import 'package:flutter/material.dart';

import 'Main_Page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isItemAddedToCart = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF749F29),
        elevation: 0,
        title: Center(
          child: Text(
            'Details',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPageScreen(),),);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Row(
              children: [
                Icon(Icons.shopping_basket_outlined),
              ],
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipPath background
          Stack(
            children: [
              ClipPath(
                clipper: NativeClipper(),
                child: Container(
                  height: 350,
                  color: Color(0xFF749F29), // Choose the color you want
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Positioned(
                    child: Image(
                      height: 500,
                      width: 500,
                      image: AssetImage('lib/assets/images/downloaddd.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 420.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Baby Toys',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Color(0xFFF4911A)),
                        Text('4.55', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$45.00',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFF4911A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'The best way to introduce a new toy to your baby is to have them see you play with it. When you introduce a toy, like the Ele rattle, demonstrate how to play with it.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Container(
              width: 350,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isItemAddedToCart = true;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoppingCart(),),);
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
                    'Add to Cart',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.shop,
                    color: Color(0xFF749F29),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text('Home'),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchProductPage(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      height: 3,
                    ),
                    Text('Search'),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCart(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.shopping_cart),
                        SizedBox(
                          height: 3,
                        ),
                        Text('Cart'),
                      ],
                    ),
                    if (isItemAddedToCart) // Conditionally display the red dot
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red, // Set the color of the dot
                          ),
                          child: Text(
                            '1', // You can dynamically set the count of items in the cart
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderHistoryScreen(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Icon(Icons.history),
                    SizedBox(
                      height: 3,
                    ),
                    Text('Orders'),
                  ],
                ),
              ),
              Column(
                children: [
                  Icon(Icons.star),
                  SizedBox(
                    height: 3,
                  ),
                  Text('Reviews'),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(),),);
                },
                child: Column(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      height: 3,
                    ),
                    Text('Profile'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }
}
