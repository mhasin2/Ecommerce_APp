import 'package:flutter/material.dart';

import 'home/home_page1.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/bags.png"),
                  Text("Success!",
                  style: Theme.of(context).textTheme.headlineLarge,),
                  Text("Your order will be delivered soon.",
                  style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text("Thank you for choosing our app!",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
           InkWell(
           onTap: () {
             Navigator.pop(context);
           },
             child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 60,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Continue Shopping',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
           ),
          ],
        ),
      ),
    );
  }
}