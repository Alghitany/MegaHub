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
    final lastName =
    nameParts.length > 1 ? nameParts.sublist(1).join(' ') : 'LastName';

    final url =
    Uri.parse('http://megahubproject.runasp.net/api/Auth/register');

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
      body: Column(
        children: [
          // Top illustration
          Image.asset(
            "assets/images/signup_ui.jpg",
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // White rounded container
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Color(0xFFFFF2F2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: FormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Signup / Login tabs
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
                      SizedBox(height: 20),

                      // Name
                      _buildInputField(
                        controller: namecontroller,
                        hintText: "Name",
                        icon: Icons.person,
                        validator: (value) =>
                        value!.isEmpty ? 'Enter your full name' : null,
                      ),
                      SizedBox(height: 15),

                      // Email
                      _buildInputField(
                        controller: emailcontroller,
                        hintText: "Email",
                        icon: Icons.email_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Enter your email';
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) return 'Enter valid email';
                          return null;
                        },
                      ),
                      SizedBox(height: 15),

                      // Password
                      _buildInputField(
                        controller: passwordcontroller,
                        hintText: "Password",
                        icon: Icons.lock_outline,
                        obscureText: obscurePassword1,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword1 = !obscurePassword1;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Enter your password';
                          if (value.length < 8)
                            return 'Password must be at least 8 characters';
                          return null;
                        },
                      ),
                      SizedBox(height: 15),

                      // Confirm Password
                      _buildInputField(
                        controller: confirmpasswordcontroller,
                        hintText: "Confirm Password",
                        icon: Icons.lock_outline,
                        obscureText: obscurePassword2,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword2
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword2 = !obscurePassword2;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Confirm your password';
                          if (value.length < 8)
                            return 'Password must be at least 8 characters';
                          return null;
                        },
                      ),

                      // Forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      // Signup Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: registerUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFE32120),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Text(
                            "Signup",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      Center(
                        child: Text(
                          "Or signup with",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE32120)),
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
                            onTap: () {},
                          ),
                          SizedBox(width: 12),
                          _buildSocialIcon(
                            width: 50,
                            height: 50,
                            "https://logopng.com.br/logos/apple-4.png",
                            onTap: () {},
                          ),
                          SizedBox(width: 12),
                          _buildSocialIcon(
                            width: 50,
                            height: 50,
                            "https://static.vecteezy.com/system/resources/thumbnails/016/716/481/small_2x/facebook-icon-free-png.png",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    String? Function(String?)? validator,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.grey),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
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
}
