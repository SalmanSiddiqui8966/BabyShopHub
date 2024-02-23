import 'dart:js';

import 'package:babyshophub/pages/screens/widgets/order_screen.dart';
import 'package:babyshophub/pages/screens/widgets/order_success_screen.dart';
import 'package:babyshophub/pages/screens/widgets/search_page_screen.dart';
import 'package:babyshophub/pages/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Components/profile_screen.dart';
import 'Main_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: CheckOutPage(),
  ));
}

class CheckOutPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF749F29),
        elevation: 0,
        title: Center(
          child: Text(
            'Checkout',
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingCart()),
            );
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
                'Credit and debit cards are the most common payment methods for e-commerce transactions.'),
            SizedBox(height: 16),
            Divider(thickness: 2),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 8),
                    Text(
                      'Shipping',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShippingPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Shipping Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Divider(thickness: 2),
            SizedBox(height: 16),
            Row(
              children: [
                Image.network(
                    'lib/assets/images/downloaddd.png',
                    width: 50,
                    height: 50),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Baby Toys'),
                    Text('Price: \$90.00'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(thickness: 2),
            SizedBox(height: 16),
            Text(
              'Total',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price: \$90.00'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderSuccessPage(),),);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF4911A),
                  ),
                  child: Text('Place Order'),
                ),
              ],
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
    );
  }

  Future<void> placeOrder() async {
    try {
      await _firestore.collection('orders').add({
        'productName': 'Product Name',
        'price': 50.00,
      });
      print('Order placed successfully!');
    } catch (e) {
      print('Error placing order: $e');
    }
  }
}

class ShippingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF749F29),
        elevation: 0,
        title: Center(
          child: Text(
            'Address Details',
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckOutPage()),
            );
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
                  SizedBox(height: 3),
                  Text('Home'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.search),
                  SizedBox(height: 3),
                  Text('Search'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(height: 3),
                  Text('Cart'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.history),
                  SizedBox(height: 3),
                  Text('Orders'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.star),
                  SizedBox(height: 3),
                  Text('Reviews'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.person),
                  SizedBox(height: 3),
                  Text('Profile'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ShippingForm(),
    );
  }
}

class ShippingForm extends StatefulWidget {
  @override
  _ShippingFormState createState() => _ShippingFormState();
}

class _ShippingFormState extends State<ShippingForm> {
  final TextEditingController address = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> sendData() async {
    String addressText = address.text;
    String nameText = name.text;
    String streetText = street.text;
    String phoneText = phone.text;
    String cityText = city.text;
    String stateText = state.text;

    firestore.collection('Payment').add({
      "Address": addressText,
      "Name": nameText,
      "Street": streetText,
      "Phone": phoneText,
      "City": cityText,
      "State": stateText,
    }).then((value) {
      print("Data saved successfully!");
    }).catchError((error) {
      print("Failed to save data: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 40),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: address,
              decoration: InputDecoration(labelText: 'Address Location ie. home'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter address';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: name,
              decoration: InputDecoration(labelText: 'Full Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: street,
              decoration: InputDecoration(labelText: 'Street'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter street';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: phone,
              decoration: InputDecoration(labelText: 'Phone'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: city,
                    decoration: InputDecoration(labelText: 'City'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter city';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: state,
                    decoration: InputDecoration(labelText: 'State'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter state';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendData();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutPage()),);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF4911A),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 18.0),
                  child: Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

