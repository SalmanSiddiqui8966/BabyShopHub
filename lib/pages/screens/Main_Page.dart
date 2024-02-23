import 'package:babyshophub/Admin_Pannel_Pages/order_screen.dart';
import 'package:babyshophub/pages/baby_food_screen.dart';
import 'package:babyshophub/pages/cloth_screen.dart';
import 'package:babyshophub/pages/diapers_screen.dart';
import 'package:babyshophub/pages/screens/widgets/detail2_screen.dart';
import 'package:babyshophub/pages/screens/widgets/order_screen.dart';
import 'package:babyshophub/pages/screens/widgets/search_page_screen.dart';
import 'package:babyshophub/pages/shopping_cart_screen.dart';
import 'package:babyshophub/pages/toys_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'Components/profile_screen.dart';
import 'detail_screen.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BabyShopHub',
                style: TextStyle(
                  color: Color(0xFF749F29),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width *
                    0.6, // Customize width as needed
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFBFE08A), width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Color(0xFF749F29),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 2,
              ),
              InkWell(
                onTap: () {
                  // Handle filter action here
                  print('Filter button pressed');
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF749F29),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xfFE9EBEA),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 18, right: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/gif banner.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 130,
                        width: 390,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 53,
                                      width: 53,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF749F29),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        child: Icon(
                                          Icons.grid_view_outlined,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      'Category',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 53,
                                      width: 53,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF6F6F6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ToysPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.toys,
                                            color: Color(0xFF749F29),
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      'Toys',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 53,
                                      width: 53,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF6F6F6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DiaperPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.bedroom_baby_outlined,
                                            color: Color(0xFF749F29),
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      'Diapers',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 53,
                                      width: 53,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF6F6F6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ClothPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.sledding_sharp,
                                            color: Color(0xFF749F29),
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      'Cloths',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 53,
                                      width: 53,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF6F6F6),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BabyfoodPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.food_bank_outlined,
                                            color: Color(0xFF749F29),
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      'Baby Foods',
                                      style: TextStyle(fontSize: 17),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Sale Products',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF749F29)),
                    )
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
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
                                padding:
                                    const EdgeInsets.only(right: 18.0, top: 15),
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
                                image: AssetImage(
                                    'lib/assets/images/downloaddd.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 22.0),
                                      child: Text(
                                        "Baby Toys",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '\$45.00',
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
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Transform.translate(
                                        offset: Offset(0, -5),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
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
                                padding:
                                    const EdgeInsets.only(right: 18.0, top: 15),
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
                                image: AssetImage(
                                    'lib/assets/images/cloth baby.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 22.0),
                                      child: Text(
                                        "Child Cloths",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '\20.00',
                                      style: TextStyle(
                                        color: Color(0xFFF4911A),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailPage2(),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 18.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Transform.translate(
                                              offset: Offset(0, -5),
                                              // Adjust the value to move the icon higher
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
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
                                padding:
                                    const EdgeInsets.only(right: 18.0, top: 15),
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
                                image: AssetImage(
                                    'lib/assets/images/diaper baby.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 22.0),
                                      child: Text(
                                        "Baby Diapers",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
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
                                      offset: Offset(0, -5),
                                      // Adjust the value to move the icon higher
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
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
                                padding:
                                    const EdgeInsets.only(right: 18.0, top: 15),
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
                                image: AssetImage(
                                    'lib/assets/images/baby food.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 22.0),
                                      child: Text(
                                        "Baby Food",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '\30.00',
                                      style: TextStyle(
                                        color: Color(0xFFF4911A),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 18.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Transform.translate(
                                            offset: Offset(0, -5),
                                            // Adjust the value to move the icon higher
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
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
                                padding:
                                    const EdgeInsets.only(right: 18.0, top: 15),
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
                                image:
                                    AssetImage('lib/assets/images/feeder.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 22.0),
                                      child: Text(
                                        "Natural Feeder",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
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
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Transform.translate(
                                      offset: Offset(0, -5),
                                      // Adjust the value to move the icon higher
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
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
                                padding:
                                    const EdgeInsets.only(right: 18.0, top: 15),
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
                                image: AssetImage(
                                    'lib/assets/images/grooming.jpg'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 22.0),
                                      child: Text(
                                        "Baby Grooming Kit",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '\$40.00',
                                      style: TextStyle(
                                        color: Color(0xFFF4911A),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 18.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Transform.translate(
                                            offset: Offset(0, -5),
                                            // Adjust the value to move the icon higher
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
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
