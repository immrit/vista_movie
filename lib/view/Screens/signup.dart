import 'package:flutter/material.dart';

<<<<<<< Updated upstream
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

=======
import '../../data/datasource/auth_datasource.dart';
import '../widgets/widgets.dart';
import 'login screen.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  TextEditingController confirmpassController=TextEditingController();
>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
<<<<<<< Updated upstream
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
=======
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Text("ثبت نام در ویستا مووی",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.white70)),
                SizedBox(height: 5),
                Text("ساخت حساب کاربری جدید",
                    style: TextStyle(fontSize: 18, color: Colors.white70)),
                SizedBox(height: 20),
                itemListFormLoginAndRegister('نام' , Icons.account_circle_rounded , nameController),
                SizedBox(height: 20),
          itemListFormLoginAndRegister('ایمیل', Icons.email , emailController),
                SizedBox(height: 20),
                itemListFormLoginAndRegister('گذرواژه', Icons.password , passController),
                SizedBox(height: 20),
                itemListFormLoginAndRegister('تکرار گذرواژه', Icons.password , confirmpassController),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade400
                  ),
                  onPressed: () {
                    var auth = AuthenticationRemote();
                    auth.register(nameController.text, passController.text, confirmpassController.text , emailController.text);                  },
                  child: Text("ثبت نام",
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
                        'وارد شوید',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    Text("  حساب کاربری دارید؟" ,style: TextStyle(color: Colors.white),),

                  ],
>>>>>>> Stashed changes
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
