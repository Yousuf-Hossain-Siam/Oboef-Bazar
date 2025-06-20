import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Uint8List? _imageBytes;
  String? _imageName;
  File? _selectedImage;
  String? _selectedRole;
  bool? _isloading = false;

  Future<void> _pickImage() async {
    if (kIsWeb) {
      // Flutter Web file picker
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        setState(() {
          _imageBytes = result.files.first.bytes;
          _imageName = result.files.first.name;
        });
      }
    } else {
      // Android/iOS file picker
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path); // Convert XFile to File
        });
      }
    }
  }

  Future<void> registerAdmin() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isloading = true;
    });
    const String apiUrl = 'http://127.0.0.1:8080/api/admins'; // Your API

    var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
      ..fields['name'] = _nameController.text
      ..fields['password'] = _passwordController.text
      ..fields['email'] = _emailController.text
      ..fields['role'] = _selectedRole!
      ..fields['phone'] = _phoneController.text
      ..fields['address'] = _addressController.text;

    if (kIsWeb && _imageBytes != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          _imageBytes!,
          filename: _imageName,
        ),
      );
    } else if (!kIsWeb && _selectedImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          _selectedImage!.path,
        ),
      );
    }

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Admin Registered Successfully!$_selectedRole"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to Register: ${response.body}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred!"),
          backgroundColor: Colors.red,
        ),
      );
    }
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.9, // Responsive width
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(0, 5), // Slight elevation effect
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Wrap content height
                children: [
                  Center(
                    child: Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Name Field
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Name"),
                    validator: (value) =>
                        value!.isEmpty ? "Enter your name" : null,
                  ),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value!.contains("@") ? null : "Enter a valid email",
                  ),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (value) =>
                        value!.length >= 6 ? null : "Password must be 6+ chars",
                  ),

                  // Phone Field
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: "Phone"),
                    keyboardType: TextInputType.phone,
                    validator: (value) => value!.length >= 10
                        ? null
                        : "Enter a valid phone number",
                  ),

                  // Address Field
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(labelText: "Address"),
                    validator: (value) =>
                        value!.isNotEmpty ? null : "Enter your address",
                  ),

                  // Role Dropdown
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: "Select Role"),
                    value: _selectedRole,
                    items: ["Admin", "Vendor", "Reseller"].map((role) {
                      return DropdownMenuItem(value: role, child: Text(role));
                    }).toList(),
                    onChanged: (value) => setState(() => _selectedRole = value),
                    validator: (value) =>
                        value == null ? "Select a role" : null,
                  ),

                  SizedBox(height: 20),

                  // Image Picker
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: _imageBytes != null
                            ? MemoryImage(_imageBytes!) // Web
                            : _selectedImage != null
                                ? FileImage(_selectedImage!) // Mobile
                                : AssetImage("assets/images/vendor.png")
                                    as ImageProvider,
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.file_upload, color: Colors.grey),
                        onPressed: _pickImage,
                      ),
                      Text(
                        "Upload Image",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 20),

                  // Register Button with Gradient
                  GestureDetector(
                    onTap: registerAdmin,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.purple]),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.4),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: _isloading!
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
