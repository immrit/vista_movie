import 'package:flutter/material.dart';
import 'package:vista_movie/data/datasource/auth_datasource.dart';
import 'package:vista_movie/view/Screens/login_Screen.dart';
import 'package:vista_movie/view/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isSubmitting = false;
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
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                LoginRegisterTextField(
                    _usernameController, 'نام کاربری', Icons.person),
                const SizedBox(height: 10),
                LoginRegisterTextField(_emailController, 'ایمیل', Icons.email),
                const SizedBox(height: 10),
                LoginRegisterTextField(
                    _passwordController, 'رمز عبور', Icons.lock),
                const SizedBox(height: 10),
                LoginRegisterTextField(
                    _confirmPasswordController, 'تکرار رمز عبور', Icons.lock),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      var auth = AuthenticationRemote();
                      auth.register(
                          _usernameController.text,
                          _emailController.text,
                          _passwordController.text,
                          _confirmPasswordController.text);
                    },
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
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'حساب کاربری دارید؟',
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            shadowColor: Colors.transparent),
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            )),
                        child: Text("وارد شوید"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
