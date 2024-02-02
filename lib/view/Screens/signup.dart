import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isSubmitting = false;

  void _signUp() {
    // TODO: Implement sign up logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Directionality(
        textDirection: TextDirection.rtl, // اعمال جهت‌گیری RTL به کل صفحه
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ویستا مووی",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "ایجاد حساب کاربری جدید",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  style: TextStyle(color: Colors.white70),
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: "نام کاربری",
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.white70),
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "رمز عبور",
                    prefixIcon: Icon(Icons.lock),
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Colors.white70),
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "تکرار رمز عبور",
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _signUp,
                    child: Text(
                      "ثبت نام",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
