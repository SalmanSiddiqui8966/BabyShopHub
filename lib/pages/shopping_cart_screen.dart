import 'dart:math';

import 'package:babyshophub/pages/screens/Components/profile_screen.dart';
import 'package:babyshophub/pages/screens/checkout_screen.dart';
import 'package:babyshophub/pages/screens/detail_screen.dart';
import 'package:babyshophub/pages/screens/widgets/order_screen.dart';
import 'package:babyshophub/pages/screens/widgets/search_page_screen.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  bool isItemAddedToCart = false;
  List<CartItemData> cartItems = [
    CartItemData(
      productName: 'Baby Toys',
      price: 45.00,
      quantity: 1,
      imagePath: 'lib/assets/images/downloaddd.png',
    ),
    // CartItemData(
    //   productName: 'Baby Diapers',
    //   price: 30.00,
    //   quantity: 1,
    //   imagePath: 'lib/assets/images/downloaddd.png',
    // ),
    // Add more CartItemData as needed
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF749F29),
        elevation: 0,
        title: Center(
          child: Text(
            'Shopping Cart',
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(),),);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Row(
              children: [
                Icon(Icons.shopping_basket_outlined, color: Colors.white),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItem(
                  cartItemData: cartItems[index],
                  onDelete: () {
                    setState(() {
                      cartItems.removeAt(index);
                    });
                  },
                  onQuantityChange: (newQuantity) {
                    setState(() {
                      cartItems[index].quantity = newQuantity;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$$totalPrice',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF4911A),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOutPage(),),);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF749F29),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Checkout',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
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

class CartItem extends StatelessWidget {
  final CartItemData cartItemData;
  final VoidCallback onDelete;
  final ValueChanged<int> onQuantityChange;

  CartItem({
    required this.cartItemData,
    required this.onDelete,
    required this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(cartItemData.imagePath),
            ),
          ),
        ),
        title: Text(cartItemData.productName),
        subtitle: Text('Price: \$${cartItemData.price}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                onQuantityChange(max(1, cartItemData.quantity - 1));
              },
            ),
            Text('${cartItemData.quantity}'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                onQuantityChange(cartItemData.quantity + 1);
              },
            ),
            SizedBox(width: 16),
            IconButton(
              icon: Icon(Icons.clear, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemData {
  final String productName;
  final double price;
  int quantity;
  final String imagePath;

  CartItemData({
    required this.productName,
    required this.price,
    required this.quantity,
    required this.imagePath,
  });
}

class CheckoutPage extends StatelessWidget {
  final List<CartItemData> cartItems;

  CheckoutPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          // Implement your checkout UI here
          // Use cartItems for displaying the selected items
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ShoppingCart(),
  ));
}