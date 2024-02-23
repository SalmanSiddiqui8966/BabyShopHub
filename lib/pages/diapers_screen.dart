import 'package:babyshophub/pages/screens/Components/profile_screen.dart';
import 'package:babyshophub/pages/screens/Main_Page.dart';
import 'package:babyshophub/pages/screens/widgets/order_screen.dart';
import 'package:babyshophub/pages/screens/widgets/search_page_screen.dart';
import 'package:babyshophub/pages/shopping_cart_screen.dart';
import 'package:flutter/material.dart';

class DiaperPage extends StatefulWidget {
  const DiaperPage({super.key});

  @override
  State<DiaperPage> createState() => _DiaperPageState();
}

class _DiaperPageState extends State<DiaperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Child Diapers',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
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
                Icon(Icons.shopping_basket_outlined, color: Colors.black),
              ],
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF4911A).withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0, top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    size: 25,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            Image(
                              height: 150,
                              width: double.infinity,
                              image: AssetImage('lib/assets/images/diaper 1.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22.0),
                                    child: Text(
                                      "Tidy Baby Diaper",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    '\$10.00',
                                    style: TextStyle(
                                      color: Color(0xFFF4911A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(),),);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Transform.translate(
                                      offset: Offset(0, -5), // Adjust the value to move the icon higher
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF749F29),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF4911A).withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0, top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    size: 25,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            Image(
                              height: 150,
                              width: double.infinity,
                              image: AssetImage('lib/assets/images/diaper 2.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22.0),
                                    child: Text(
                                      "Pampers",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    '\$9.00',
                                    style: TextStyle(
                                      color: Color(0xFFF4911A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Transform.translate(
                                          offset: Offset(0, -5), // Adjust the value to move the icon higher
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF749F29),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF4911A).withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0, top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    size: 25,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            Image(
                              height: 150,
                              width: double.infinity,
                              image: AssetImage('lib/assets/images/diaper 3.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22.0),
                                    child: Text(
                                      "Molfix Diapers",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    '\$15.00',
                                    style: TextStyle(
                                      color: Color(0xFFF4911A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Transform.translate(
                                    offset: Offset(0, -5), // Adjust the value to move the icon higher
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF749F29),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF4911A).withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0, top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    size: 25,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            Image(
                              height: 150,
                              width: double.infinity,
                              image: AssetImage('lib/assets/images/diaper 4.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22.0),
                                    child: Text(
                                      "Huggies",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    '\$5.00',
                                    style: TextStyle(
                                      color: Color(0xFFF4911A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Transform.translate(
                                          offset: Offset(0, -5), // Adjust the value to move the icon higher
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF749F29),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF4911A).withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0, top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    size: 25,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            Image(
                              height: 150,
                              width: double.infinity,
                              image: AssetImage('lib/assets/images/diaper 5.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22.0),
                                    child: Text(
                                      "Happy Little Camper",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    '\$12.00',
                                    style: TextStyle(
                                      color: Color(0xFFF4911A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Transform.translate(
                                    offset: Offset(0, -5), // Adjust the value to move the icon higher
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF749F29),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF4911A).withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0, top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    size: 25,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            Image(
                              height: 150,
                              width: double.infinity,
                              image: AssetImage('lib/assets/images/diaper 6.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22.0),
                                    child: Text(
                                      "Kisskids Baby Diapers",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    '\$20.00',
                                    style: TextStyle(
                                      color: Color(0xFFF4911A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Transform.translate(
                                          offset: Offset(0, -5), // Adjust the value to move the icon higher
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF749F29),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ],
        ),
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
                child: Column(
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(
                      height: 3,
                    ),
                    Text('Cart'),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Transform.rotate(
          angle: -0.5, // Adjust the rotation angle as needed
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Color(0xFFF4911A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Transform.rotate(
                angle: 0.5, // Adjust the rotation angle as needed
                child: Icon(Icons.add, size: 30, color: Colors.white),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
