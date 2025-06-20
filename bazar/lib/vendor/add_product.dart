import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart'; // For kIsWeb & Desktop checks
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart'; // For MIME type handling
import 'package:mime/mime.dart'; // To detect MIME type

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _mrpController = TextEditingController();
  final TextEditingController _vendorController = TextEditingController();
  final TextEditingController _resellerController = TextEditingController();
  final TextEditingController _vendorIDController = TextEditingController();
  final TextEditingController _resellerIDController = TextEditingController();

  Uint8List? _webImage;
  String? _webImageName; // Store file name for web uploads
  File? _mobileImage;
  bool _isUploading = false;

  /// **Pick Image for Web, Mobile, and Desktop**
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb ||
          Platform.isWindows ||
          Platform.isLinux ||
          Platform.isMacOS) {
        var f = await pickedFile.readAsBytes();
        setState(() {
          _webImage = f;
          _webImageName = pickedFile.name; // Store file name
        });
      } else {
        setState(() {
          _mobileImage = File(pickedFile.path);
        });
      }
    }
  }

  /// **Upload Product to API**
  Future<void> _submitProduct() async {
    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _quantityController.text.isEmpty ||
        _mrpController.text.isEmpty ||
        (_webImage == null && _mobileImage == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all fields and select an image')),
      );
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://127.0.0.1:8080/api/products'));

      // **Add text fields**
      request.fields['name'] = _nameController.text;
      request.fields['description'] = _descriptionController.text;
      request.fields['quantity'] = _quantityController.text;
      request.fields['mrp'] = _mrpController.text;
      request.fields['vendor_id'] =
          _vendorIDController.text; // Example static values
      request.fields['reseller_id'] = _resellerIDController.text;
      request.fields['vendor_price'] = "178578";
      request.fields['reseller_price'] = "10000";
      request.fields['vendor_name'] = _vendorController.text;
      request.fields['reseller_name'] = _resellerController.text;
      request.fields['category_name'] = "Electronics";

      // ✅ **Ensure picture1 stores an image file, not a text value!**
      if (!kIsWeb && _mobileImage != null) {
        // ✅ Mobile (Android/iOS)
        String? mimeType = lookupMimeType(_mobileImage!.path);
        String fileExtension = mimeType?.split('/').last ?? 'jpeg';

        request.files.add(
          await http.MultipartFile.fromPath(
            'picture1',
            _mobileImage!.path,
            contentType: MediaType('image', fileExtension),
          ),
        );
      } else if ((kIsWeb ||
              Platform.isWindows ||
              Platform.isLinux ||
              Platform.isMacOS) &&
          _webImage != null &&
          _webImageName != null) {
        // ✅ Web & Desktop
        String? mimeType = lookupMimeType(_webImageName!);
        String fileExtension = mimeType?.split('/').last ?? 'jpeg';

        request.files.add(
          http.MultipartFile.fromBytes(
            'picture1',
            _webImage!,
            filename: _webImageName, // Store original filename
            contentType: MediaType('image', fileExtension),
          ),
        );
      }
      

      // **Send request**
      var response = await request.send();

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }

    setState(() {
      _isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Product Name"),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: 3,
              ),
              TextField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: "Quantity"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _mrpController,
                decoration: const InputDecoration(labelText: "MRP"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _vendorController,
                decoration: const InputDecoration(labelText: "Vendor Name"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _resellerController,
                decoration: const InputDecoration(labelText: "Reseller Name"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _vendorIDController,
                decoration: const InputDecoration(labelText: "Vendor ID"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _resellerIDController,
                decoration: const InputDecoration(labelText: "Reseller ID"),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 20),

              // ✅ **Image Preview**
              _webImage != null
                  ? Image.memory(_webImage!,
                      width: 200, height: 200, fit: BoxFit.cover)
                  : _mobileImage != null
                      ? Image.file(_mobileImage!,
                          width: 200, height: 200, fit: BoxFit.cover)
                      : const Icon(Icons.image, size: 100, color: Colors.grey),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: _pickImage,
                child: const Text("Pick Image"),
              ),

              const SizedBox(height: 20),

              _isUploading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submitProduct,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                      child: const Text("Submit Product",
                          style: TextStyle(color: Colors.white)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
