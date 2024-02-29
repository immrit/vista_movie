import 'package:flutter/material.dart';
import 'package:vista_movie/data/datasource/auth_datasource.dart';
import 'package:vista_movie/data/repository/autuntication_repository.dart';
import 'package:vista_movie/view/Screens/login_Screen.dart';

import '../widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
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
                LoginRegisterTextField('نام کاربری', Icons.person,
                    _usernameController, TextInputType.name, false),
                const SizedBox(height: 10),
                LoginRegisterTextField('ایمیل', Icons.email, _emailController,
                    TextInputType.emailAddress, false),
                const SizedBox(height: 10),
                LoginRegisterTextField('رمز عبور', Icons.lock,
                    _passwordController, TextInputType.visiblePassword, true),
                const SizedBox(height: 10),
                LoginRegisterTextField(
                    'تکرار رمزعبور',
                    Icons.lock,
                    _confirmPasswordController,
                    TextInputType.visiblePassword,
                    true),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () async {
                      var either = await AutunticationRepository().register();
                      either.fold((err) {
                        print(err);
                      }, (succ) {
                        print('succ');
                      });
                      // AuthenticationRemote().register(
                      //     _usernameController.text,
                      //     _passwordController.text,
                      //     _confirmPasswordController.text,
                      //     _emailController.text);
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
