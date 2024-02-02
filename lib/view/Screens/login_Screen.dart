import 'package:flutter/material.dart';
import 'package:vista_movie/view/Screens/signup_Screen.dart';
import 'package:vista_movie/view/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
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
                  "ورود به حساب کاربری",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                LoginRegisterTextField(
                    _usernameController, 'نام کاربری', Icons.person),
                const SizedBox(height: 10),
                LoginRegisterTextField(
                    _passwordController, 'رمز عبور', Icons.lock),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "ورود",
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
                      'حساب کاربری ندارید؟',
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            shadowColor: Colors.transparent),
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            )),
                        child: Text("ایجاد کنید"))
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
