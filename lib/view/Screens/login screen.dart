import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Text("خوش آمدید",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70)),
                SizedBox(height: 5),
                Text("وارد شوید",
                    style: TextStyle(fontSize: 18, color: Colors.white70)),
                itemListFormLoginAndRegister(
                    'ایمیل', Icons.email, emailController),
                SizedBox(height: 20),
                itemListFormLoginAndRegister(
                    'گذرواژه', Icons.password, passController),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade400),
                  onPressed: () {
                    // Add your button's onPressed logic here
                  },
                  child: Text("ورود",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text(
                        'ثبت نام کنید',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SignupScreen();
                            },
                          ),
                        );
                      },
                    ),
                    Text(
                      "  حساب کاربری ندارید؟",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
