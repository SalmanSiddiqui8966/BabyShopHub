import 'package:babyshophub/pages/screens/Main_Page.dart';
import 'package:flutter/material.dart';

import '../detail_screen.dart';

class SearchProductPage extends StatefulWidget {
  @override
  _SearchProductPageState createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  // Dummy data for demonstration
  List<String> searchResults = [
    'Baby Toys',
    'Child Clothes',
    'Baby Diapers',
    'Baby Foods',
    'Natural Feeder'
    'Baby Grooming Kit'
    'Children Car',
    'Toy Bar',
    'Child Toy Truck',
    'Wooden House',
    'Retro Toy Car',

  ];

  List<String> filteredResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF749F29),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPageScreen()),
            );
          },
        ),
        title: Text('Search....'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPageScreen()),
              );
              _searchController.clear();
              setState(() {
                _searchText = "";
                filteredResults.clear();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildSearchResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      onChanged: (text) {
        setState(() {
          _searchText = text;
          filteredResults = searchResults
              .where((result) =>
              result.toLowerCase().contains(_searchText.toLowerCase()))
              .toList();
        });
      },
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: Icon(Icons.search),
        suffixIcon: _searchText.isNotEmpty
            ? IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            _searchController.clear();
            setState(() {
              _searchText = "";
              filteredResults.clear();
            });
          },
        )
            : null,
      ),
    );
  }

  Widget _buildSearchResult() {
    return _searchText.isNotEmpty
        ? Expanded(
      child: ListView.builder(
        itemCount: filteredResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredResults[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(),
                ),
              );
            },
          );
        },
      ),
    )
        : Container(); // Empty container if there are no search results
  }
}

// class CartPage extends StatelessWidget {
//   final String productName;
//
//   CartPage(this.productName);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add to Cart'),
//       ),
//       body: Center(
//         child: Text('Product added to cart: $productName'),
//       ),
//     );
//   }
// }

void main() {
  runApp(MaterialApp(
    home: SearchProductPage(),
  ));
}

