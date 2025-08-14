import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  bool obscurePassword1 = true;
  bool obscurePassword2 = true;
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  Future<void> registerUser() async {
    if (!FormKey.currentState!.validate()) return;

    final String fullName = namecontroller.text.trim();
    final String email = emailcontroller.text.trim();
    final String password = passwordcontroller.text.trim();
    final String confirmPassword = confirmpasswordcontroller.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    final nameParts = fullName.split(' ');
    final firstName = nameParts.isNotEmpty ? nameParts.first : '';
    final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : 'LastName';

    final url = Uri.parse('http://megahubproject.runasp.net/api/Auth/register');

    final body = {
      'firstName': firstName,
      'lastName': lastName,
      'userName': email.split('@')[0],
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Successful')),
        );
        // Navigator.pushReplacementNamed(context, '/login');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'] ?? 'Registration failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: FormKey,
        child: Stack(
          children: [
            Image.asset(
             "assets/images/signup_ui.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFF2F2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.only(top: 170, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Signup",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFFE32120),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFFE32120),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: namecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Full Name",
                      prefixIcon: Icon(Icons.person, color: Colors.grey),
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Email",
                      prefixIcon:
                      Icon(Icons.email_outlined, color: Colors.grey),
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    obscureText: obscurePassword1,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon:
                      Icon(Icons.lock_outline, color: Colors.grey),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword1 = !obscurePassword1;
                          });
                        },
                        icon: Icon(
                          obscurePassword1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: confirmpasswordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    obscureText: obscurePassword2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: "Confirm Password",
                      prefixIcon:
                      Icon(Icons.lock_outline, color: Colors.grey),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword2 = !obscurePassword2;
                          });
                        },
                        icon: Icon(
                          obscurePassword2
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Forgot password?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE32120),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: EdgeInsets.only(left: 100, right: 100),
                    child: MaterialButton(
                      onPressed: registerUser,
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Or Signup With",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE32120),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(
                          width: 50,
                          height: 50,
                          "https://imagepng.org/wp-content/uploads/2019/08/google-icon.png",
                          onTap: () {}),
                      SizedBox(width: 8),
                      _buildSocialIcon(
                          width: 50,
                          height: 50,
                          "https://logopng.com.br/logos/apple-4.png",
                          onTap: () {}),
                      SizedBox(width: 8),
                      _buildSocialIcon(
                          width: 50,
                          height: 50,
                          "https://static.vecteezy.com/system/resources/thumbnails/016/716/481/small_2x/facebook-icon-free-png.png",
                          onTap: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSocialIcon(String url,
    {required VoidCallback onTap,
      double width = 30,
      double height = 30}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(8),
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    ),
  );
}
