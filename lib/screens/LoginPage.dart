import 'package:flutter/material.dart';
import 'package:web_dashboard_app_tut/screens/HomePage.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;
  final _formKey = GlobalKey<FormState>();  // bool _validateFields() {
  //   bool valid = true;
  //
  //   // Check if email field is empty
  //   if (emailController.text.isEmpty) {
  //     setState(() {
  //       _emailError = 'Please enter your email';
  //     });
  //     valid = false;
  //   } else {
  //     setState(() {
  //       _emailError = null;
  //     });
  //   }
  //
  //   // Check if password field is empty
  //   if (passwordController.text.isEmpty) {
  //     setState(() {
  //       _passwordError = 'Please enter your password';
  //     });
  //     valid = false;
  //   } else {
  //     setState(() {
  //       _passwordError = null;
  //     });
  //   }
  //
  //   return valid;
  // }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    _animationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if(_formKey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });

      // TODO: Add authentication logic here

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage(index: 0)));
      setState(() {
        _isLoading = false;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color.fromRGBO(45, 70, 151, 1), Colors.red.shade400],
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/nist.png',
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Admin Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: TextFormField(

                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                              return 'Please enter a valid email address';
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.white),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Please enter your password";
                            } else if (value.toString().length < 6) {
                              return 'Password must be at least 6 characters long';
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.white),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
                      _isLoading
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: ElevatedButton(
                                onPressed: _login,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: const Color(0xFF5338DE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  minimumSize: const Size(200, 50),
                                ),
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Color.fromRGBO(45, 70, 151, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
