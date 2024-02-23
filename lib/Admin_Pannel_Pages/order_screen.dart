import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
          _buildOrderSection('1', 'Salman Siddiqui', context),
          _buildOrderSection('2', 'Salman', context),
          // Add more sections as needed...
        ],
      ),
    );
  }

  Widget _buildSliderText(String text) {
    return Container(
      width:
          MediaQuery.of(context).size.width / 3,
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

  Widget _buildOrderSection(String number, String name, BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the order details page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OrderDetailsPage(orderNumber: number, orderName: name)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(number,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text(name,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Icon(Icons.delete, color: Colors.red),
                SizedBox(width: 16),
                Icon(Icons.delivery_dining, color: Colors.blue),
                SizedBox(width: 16),
                Icon(Icons.remove_red_eye, color: Color(0xFF749F29)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDetailsPage extends StatelessWidget {
  final String orderNumber;
  final String orderName;

  OrderDetailsPage({required this.orderNumber, required this.orderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
        backgroundColor: Color(0xFF749F29),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'View Order',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Order ID: $orderNumber',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Shipped To',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Name: Salman Siddiqui'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('City:Karachi'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Lane: Home'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Phone Number: +92 3101242766'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Postal Code: 12345'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Product',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Subtotal: \$90.00'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Discount: \$10.00'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Shipping: \$5.00'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$80',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
