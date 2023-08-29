import 'dart:convert';
import 'package:e_commerce/models/login_signup_module.dart';
import 'package:e_commerce/screens/main_file.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'forgot_screen.dart';
import 'visual_search.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  Login _login = Login();
  bool isLoading = false; // Added loading indicator state

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future<void> loginAPIfuncation() async {
    try {
      Response response = await http.put(
        Uri.parse('https://ecommerce.salmanbediya.com/users/login'),
        body: {
          'email': emailLoginController.text,
          'password': passwordLoginController.text,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _login = Login.fromJson(jsonDecode(response.body));
        });

        if (_login.message == "User login successfully") {
          showSnackbar("Login successful");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VisualFindingScreen(),
            ),
          );
        }
      } else {
        showSnackbar("Login failed. ${response.body}${response.statusCode}");
      }
    } catch (error) {
      showSnackbar("An error occurred. Please try again later.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 85),
                  TextField(
                    controller: emailLoginController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    cursorColor: Theme.of(context).colorScheme.onBackground,
                    decoration: textFieldDecoration('Email'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordLoginController,
                    obscureText: true,
                    style: Theme.of(context).textTheme.bodyMedium,
                    cursorColor: Theme.of(context).colorScheme.onBackground,
                    decoration: textFieldDecoration('Password'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot your password?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_right_alt,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: isLoading
                        ? null // Disable button while loading
                        : () {
                            setState(() {
                              isLoading = true; // Show loader
                            });

                            loginAPIfuncation().then((value) {
                              setState(() {
                                isLoading = false; // Hide loader
                              });

                              if (_login.message == "User login successfully") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const VisualFindingScreen(),
                                  ),
                                );
                              }
                            });
                          },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(343, 48),
                      shadowColor: Theme.of(context).colorScheme.primary,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: isLoading
                        ? CircularProgressIndicator() // Show loader while logging in
                        : Text(
                            'LOGIN',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                  ),
                  const Spacer(),
                  Text(
                    "Or login with social account",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.onBackground,
                            fixedSize: const Size(92, 64),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Image.asset("assets/Google.png"),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.onBackground,
                            fixedSize: const Size(92, 64),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Image.asset("assets/Facebook.png"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration textFieldDecoration(lableText) {
    return InputDecoration(
      label: Text(lableText, style: Theme.of(context).textTheme.titleMedium),
      contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 25),
      filled: true,
      fillColor: Theme.of(context).colorScheme.onSecondary,
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
