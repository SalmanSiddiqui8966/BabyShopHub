import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
                  _buildBoxWithImageAndIcons(
                    context,
                    'lib/assets/images/cloth baby.jpg',
                    'Child Cloths',
                    '10',
                    Icons.edit,
                    Icons.delete,
                  ),
                  _buildBoxWithImageAndIcons(
                    context,
                    'lib/assets/images/diaper baby.jpg',
                    'Baby Diapers',
                    '5',
                    Icons.edit,
                    Icons.delete,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBoxWithImageAndIcons(
                    context,
                    'lib/assets/images/baby food.jpg',
                    'Baby Food',
                    '8',
                    Icons.edit,
                    Icons.delete,
                  ),
                  _buildBoxWithImageAndIcons(
                    context,
                    'lib/assets/images/feeder.jpg',
                    'Natural Feeder',
                    '3',
                    Icons.edit,
                    Icons.delete,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Add Category page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCategoryPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF4911A),
                ),
                child: Text('Add Category'),
              ),
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

  Widget _buildDeleteDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Delete category'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Text('Are you sure want to delete it?')),
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

  Widget _buildBoxWithImageAndIcons(
    BuildContext context,
    String imagePath,
    String title,
    String count,
    IconData editIcon,
    IconData deleteIcon,
  ) {
    return InkWell(
      onTap: () {
        // Handle tap event
        _navigateToDetails(context, imagePath, title);
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
            Image.asset(
              imagePath, // Pass the actual path of your image as a parameter
              height: 120, // Adjust the height as needed
              width: 120, // Adjust the width as needed
            ),
            SizedBox(height: 8),
            Text(
              count,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
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

  void _navigateToDetails(
      BuildContext context, String imagePath, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CategoryDetailsPage(imagePath: imagePath, categoryName: title),
      ),
    );
  }
}

class AddCategoryPage extends StatelessWidget {
  final TextEditingController _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF749F29),
        title: Text('Add Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add Category',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: _categoryNameController,
              decoration: InputDecoration(
                labelText: 'Category Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Custom image upload widget
            GestureDetector(
              onTap: () async {
                // Handle image upload
                String? filePath = await _openFileManager();
                if (filePath != null) {
                  // Do something with the selected file path
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
                child: Center(
                  child: Icon(
                    Icons.image,
                    size: 48,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle Add Category button tap
                Navigator.of(context).pop(); // Go back to the previous page
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF4911A),
              ),
              child: Text('Add Category'),
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
      return result.files.single.path;
    }
    return null;
  }
}

class CategoryDetailsPage extends StatelessWidget {
  final String imagePath;
  final String categoryName;

  CategoryDetailsPage(
      {Key? key, required this.imagePath, required this.categoryName})
      : super(key: key);

  final TextEditingController _categoryDataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF749F29),
        title: Text(categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 200,
              width: 200,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _categoryDataController,
              decoration: InputDecoration(
                labelText: 'Category Data',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle update data button tap
                String updatedData = _categoryDataController.text;
                // Process the updated data as needed
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF4911A), // Replace with your desired color
              ),
              child: Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
//
// class CategoryPage extends StatefulWidget {
//   const CategoryPage({Key? key}) : super(key: key);
//
//   @override
//   _CategoryPageState createState() => _CategoryPageState();
// }
//
// class _CategoryPageState extends State<CategoryPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 200,
//             color: Color(0xFF749F29),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 130.0),
//                 child: Row(
//                   children: [
//                     _buildSliderText('Dashboard'),
//                     _buildSliderText('Category'),
//                     _buildSliderText('Product'),
//                     _buildSliderText('Order'),
//                     _buildSliderText('Settings'),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildBoxWithImageAndIcons(
//                     context,
//                     'lib/assets/images/cloth baby.jpg',
//                     'Child Cloths',
//                     '10',
//                     Icons.edit,
//                     Icons.delete,
//                   ),
//                   _buildBoxWithImageAndIcons(
//                     context,
//                     'lib/assets/images/diaper baby.jpg',
//                     'Baby Diapers',
//                     '5',
//                     Icons.edit,
//                     Icons.delete,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildBoxWithImageAndIcons(
//                     context,
//                     'lib/assets/images/baby food.jpg',
//                     'Baby Food',
//                     '8',
//                     Icons.edit,
//                     Icons.delete,
//                   ),
//                   _buildBoxWithImageAndIcons(
//                     context,
//                     'lib/assets/images/feeder.jpg',
//                     'Natural Feeder',
//                     '3',
//                     Icons.edit,
//                     Icons.delete,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to Add Category page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AddCategoryPage()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Color(0xFFF4911A),
//                 ),
//                 child: Text('Add Category'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSliderText(String text) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 3, // Adjust the width as needed
//       margin: EdgeInsets.only(bottom: 10),
//       child: Center(
//         child: Text(
//           text,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDeleteDialog(BuildContext context) {
//     return AlertDialog(
//       title: Text('Delete category'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Center(child: Text('Are you sure want to delete it?')),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle cancel button tap
//                   Navigator.of(context).pop();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.grey,
//                 ),
//                 child: Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle confirm delete button tap
//                   // Perform delete operation here
//                   Navigator.of(context).pop();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red,
//                 ),
//                 child: Text('Confirm Delete'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBoxWithImageAndIcons(
//       BuildContext context,
//       String imagePath,
//       String title,
//       String count,
//       IconData editIcon,
//       IconData deleteIcon,
//       ) {
//     return InkWell(
//       onTap: () {
//         // Handle tap event
//         _navigateToDetails(context, imagePath, title);
//       },
//       child: Container(
//         width: 220,
//         height: 250,
//         margin: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Your image widget goes here
//             Image.asset(
//               imagePath, // Pass the actual path of your image as a parameter
//               height: 120, // Adjust the height as needed
//               width: 120, // Adjust the width as needed
//             ),
//             SizedBox(height: 8),
//             Text(
//               count,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               title,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Icon(
//                   editIcon,
//                   color: Colors.blue,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Show delete confirmation dialog
//                     showDialog(
//                       context: context,
//                       builder: (context) => _buildDeleteDialog(context),
//                     );
//                   },
//                   child: Icon(
//                     deleteIcon,
//                     color: Colors.red,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _navigateToDetails(BuildContext context, String imagePath, String title) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CategoryDetailsPage(imagePath: imagePath, categoryName: title),
//       ),
//     );
//   }
// }
//
// class AddCategoryPage extends StatefulWidget {
//   const AddCategoryPage({Key? key}) : super(key: key);
//
//   @override
//   _AddCategoryPageState createState() => _AddCategoryPageState();
// }
//
// class _AddCategoryPageState extends State<AddCategoryPage> {
//   final TextEditingController _categoryNameController = TextEditingController();
//   String? _selectedImagePath;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF749F29),
//         title: Text('Add Category'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Add Category', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             SizedBox(height: 20),
//             TextField(
//               controller: _categoryNameController,
//               decoration: InputDecoration(
//                 labelText: 'Category Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: () async {
//                 // Handle image upload
//                 String? filePath = await _openFileManager();
//                 if (filePath != null) {
//                   // Do something with the selected file path
//                   setState(() {
//                     _selectedImagePath = filePath;
//                   });
//                   print('Selected file path: $filePath');
//                 }
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Center(
//                   child: _selectedImagePath != null
//                       ? Image.file(File(_selectedImagePath!))
//                       : Icon(
//                     Icons.image,
//                     size: 48,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Validate category name and image
//                 if (_validateInputs()) {
//                   // Perform add category operation here
//                   Navigator.of(context).pop(); // Go back to the previous page
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Color(0xFFF4911A),
//               ),
//               child: Text('Add Category'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<String?> _openFileManager() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
//     if (result != null) {
//       return result.files.single.path;
//     }
//     return null;
//   }
//
//   bool _validateInputs() {
//     if (_categoryNameController.text.isEmpty) {
//       // Show error message for empty category name
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please enter a category name'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//       return false;
//     } else if (_selectedImagePath == null) {
//       // Show error message for no selected image
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please select an image'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//       return false;
//     }
//     return true;
//   }
// }
//
//
// class CategoryDetailsPage extends StatelessWidget {
//   final String imagePath;
//   final String categoryName;
//
//   CategoryDetailsPage({Key? key, required this.imagePath, required this.categoryName}) : super(key: key);
//
//   final TextEditingController _categoryDataController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF749F29),
//         title: Text(categoryName),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               imagePath,
//               height: 200,
//               width: 200,
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _categoryDataController,
//               decoration: InputDecoration(
//                 labelText: 'Category Data',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle update data button tap
//                 String updatedData = _categoryDataController.text;
//                 // Process the updated data as needed
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Color(0xFFF4911A), // Replace with your desired color
//               ),
//               child: Text('Update Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
