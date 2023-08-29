import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController nameSignUpController = TextEditingController();
TextEditingController emailSignUpController = TextEditingController();
TextEditingController passwordSignUpController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
   void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ),
    );
  }

  Future<void> getLoginData() async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://ecommerce.salmanbediya.com/users/register'),
        body: {
          'name': nameSignUpController.text,
          'email': emailSignUpController.text,
          'password': passwordSignUpController.text,
        },
      );

      print('-----------statusCode= ${response.statusCode}------------');

      if (response.statusCode == 201) {
        // Show successful signup snackbar
        showSnackbar("Signup successful${response.statusCode}${response.body}");
      } else {
        // Show error snackbar
        showSnackbar("Signup failed. ${response.statusCode}${response.body}");
      }
    } catch (error) {
      // Show error snackbar
      showSnackbar("An error occurred. Please try again later.");
      print('Error Error Error $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           backgroundColor: const Color.fromRGBO(30, 31, 40, 1),
        leading: Container(),
      ),
        resizeToAvoidBottomInset: false,

        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              const SizedBox(height: 10),
             
              Row(
                children: [
                  Text("Sign up",
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
              const SizedBox(height: 85),
    

              TextField(
                  controller: nameSignUpController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorColor: Theme.of(context).colorScheme.onBackground,
                  decoration: textFieldDecoration('Name')),
              const SizedBox(height: 10),
              TextField(
                  controller: emailSignUpController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorColor: Theme.of(context).colorScheme.onBackground,
                  decoration: textFieldDecoration('Email')),
              const SizedBox(height: 10),
              TextField(
                  controller: passwordSignUpController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorColor: Theme.of(context).colorScheme.onBackground,
                  obscureText: true,
                  decoration: textFieldDecoration('Password')),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  'Already have an account?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
             
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()));
                    },
                    icon: Icon(
                      Icons.arrow_right_alt,
                      color: Theme.of(context).colorScheme.primary,
                    ))
              ]),
              const SizedBox(height: 20),
             
              ElevatedButton(
                  onPressed: () {
                    getLoginData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(343, 48),
                      shadowColor: Theme.of(context).colorScheme.primary,
                      elevation: 8, 
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text('SIGN UP',
                      style: Theme.of(context).textTheme.bodyMedium)),
              const Spacer(),
              Text("Or sign up with social account",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 5),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onBackground,
                            fixedSize: const Size(92, 64),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Image.asset("assets/Google.png")),
                    const SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onBackground,
                            fixedSize: const Size(92, 64),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Image.asset("assets/Facebook.png")),
                  ],
                ),
              ),
              const SizedBox(height: 30)
            ])));
  }

  InputDecoration textFieldDecoration(lableText) {
    return InputDecoration(
        label: Text(lableText, style: Theme.of(context).textTheme.titleMedium),
        contentPadding:
            const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 25),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onSecondary,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.error)));
  }
}
