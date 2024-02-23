import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('Products');

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
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProductCard(
                      context, 'Product 1', Icons.edit, Icons.delete),
                  _buildProductCard(
                      context, 'Product 2', Icons.edit, Icons.delete),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProductCard(
                      context, 'Product 3', Icons.edit, Icons.delete),
                  _buildProductCard(
                      context, 'Product 4', Icons.edit, Icons.delete),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSliderText(String text) {
    return Container(
      width:
          MediaQuery.of(context).size.width / 3, // Adjust the width as needed
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

  Widget _buildProductCard(BuildContext context, String productName,
      IconData editIcon, IconData deleteIcon) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddProductPage(),
          ),
        );
      },
      child: Container(
        width: 220,
        height: 250,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your image widget goes here
            Icon(
              Icons.image,
              size: 120,
              color: Colors.grey,
            ),
            SizedBox(height: 8),
            Text(
              productName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            // Additional non-bold one-line text (description)
            Text(
              'Product description goes here.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  editIcon,
                  color: Colors.blue,
                ),
                GestureDetector(
                  onTap: () {
                    // Show delete confirmation dialog
                    showDialog(
                      context: context,
                      builder: (context) => _buildDeleteDialog(context),
                    );
                  },
                  child: Icon(
                    deleteIcon,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Delete product'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Text('Are you sure you want to delete it?')),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle cancel button tap
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle confirm delete button tap
                  // Perform delete operation here
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('Confirm Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productDescController = TextEditingController();
  String? _selectedImagePath;

  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF749F29),
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add Product',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _productPriceController,
              decoration: InputDecoration(
                labelText: 'Product Price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _productDescController,
              decoration: InputDecoration(
                labelText: 'Product Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                // Handle image upload
                String? filePath = await _openFileManager();
                if (filePath != null) {
                  setState(() {
                    _selectedImagePath = filePath;
                  });
                  print('Selected file path: $filePath');
                }
              },
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: _displaySelectedImage(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle Add Product button tap
                _addProductToFirestore();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF4911A),
              ),
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _openFileManager() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      String? filePath = result.files.single.path;
      print('Selected image path: $filePath');
      return filePath;
    }
    return null;
  }
  Widget _displaySelectedImage() {
    if (_selectedImagePath != null) {
      return Image.file(
        File(_selectedImagePath!),
        width: double.infinity,
        height: 120,
        fit: BoxFit.cover,
      );
    } else {
      return Center(
        child: Icon(
          Icons.image,
          size: 48,
          color: Colors.grey,
        ),
      );
    }
  }

  Future<void> _addProductToFirestore() async {
    print('Adding product to Firestore');
    print('Selected image path: $_selectedImagePath');

    // Check other data fields as well
    print('Product name: ${_productNameController.text}');
    print('Product price: ${_productPriceController.text}');
    print('Product description: ${_productDescController.text}');

    await productsCollection.add({
      'name': _productNameController.text,
      'price': _productPriceController.text,
      'description': _productDescController.text,
      'imagePath': _selectedImagePath,
    });
  }
}
