import 'dart:convert';
import 'package:bazar/admin/admin_home.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _adminName = "";
  String _adminEmail = "";
  String _token = "";
  String? selectrole = "";

  bool get isLoading => _isLoading;
  String get adminName => _adminName;
  String get adminEmail => _adminEmail;

  Future<void> loginAdmin({
    required BuildContext context,
    required String email,
    required String password,
    required String role,
  }) async {
    const String apiUrl = 'http://127.0.0.1:8080/api/admins/login';

    _isLoading = true;
    notifyListeners();

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        _token = responseData['token']; // Save token
        role = responseData['role'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token);

        // // Fetch admin details after login
        // await fetchAdminDetails();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseData['message']),
            backgroundColor: Colors.green,
          ),
        );
        if (role == selectrole) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminHome()));
        }
        // Navigate to Admin Home
      } else {
        var responseData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login Failed: ${responseData['message']}"),
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

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchAdminDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) return;

    const String apiUrl = 'http://127.0.0.1:8080/api/admins/profile';

    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        _adminName = responseData['name'] ?? "Unknown";
        _adminEmail = responseData['email'] ?? "Unknown";
        notifyListeners();
      } else {
        print("Failed to fetch admin details");
      }
    } catch (e) {
      print("Error fetching admin details: $e");
    }
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Remove all stored data

    _adminName = "";
    _adminEmail = "";
    _token = "";
    notifyListeners();

    Navigator.pushReplacementNamed(context, '/login');
  }
}
