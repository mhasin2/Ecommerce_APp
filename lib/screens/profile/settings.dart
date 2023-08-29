

import 'package:flutter/material.dart';
import 'dart:convert';



class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _switchvalue = true;
  bool _switchvalue1 = false;
  bool _switchvalue2 = false;

   

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        showDragHandle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Password Change",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                TextField(
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: const InputDecoration(
                    hintText: 'Old Password',
                    hintStyle: TextStyle(
                        color: const Color.fromRGBO(246, 246, 246, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    labelText: 'Old Password',
                    labelStyle: TextStyle(
                        color: const Color.fromRGBO(246, 246, 246, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot your password?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Image.asset('assets/round-arrow_right_alt-24px.png'),
                  ],
                ),
                TextField(
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: const InputDecoration(
                    hintText: 'New Password',
                    hintStyle: TextStyle(
                        color: const Color.fromRGBO(246, 246, 246, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    labelText: 'New Password',
                    labelStyle: TextStyle(
                        color: const Color.fromRGBO(246, 246, 246, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: const InputDecoration(
                      hintText: 'Repeat New Password',
                      hintStyle: TextStyle(
                          color: const Color.fromRGBO(246, 246, 246, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      labelText: 'Repeat New Password',
                      labelStyle: TextStyle(
                          color: const Color.fromRGBO(246, 246, 246, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 60,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Change Password',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  AppBar _showAppBar() {
    return AppBar(
      leading:   IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 18)),
      backgroundColor: const Color.fromRGBO(30, 31, 40, 1),
      actions: const [
        Icon(Icons.search),
        Padding(padding: EdgeInsets.all(10)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _showAppBar(),
      
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 34),
              ),
              Text(
                "Personal Information",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 16),
              ),
              Container(
                height: 50,
                color: Theme.of(context).colorScheme.onSecondary,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Full Name",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.onSecondary,
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date of Birth",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "12/12/1989",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Password",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 16)),
                      TextButton(
                          onPressed: _modalBottomSheetMenu,
                          child: Text(
                            "Change",
                            style: Theme.of(context).textTheme.bodySmall,
                          ))
                    ],
                  ),
                  Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.onSecondary,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "**********",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Notification",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sales",
                              style: Theme.of(context).textTheme.bodySmall),
                          Switch(
                              activeColor: const Color.fromRGBO(85, 216, 90, 1),
                              value: _switchvalue,
                              onChanged: (value) {
                                setState(() {
                                  _switchvalue = value;
                                });
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sales",
                              style: Theme.of(context).textTheme.bodySmall),
                          Switch(
                              activeColor: const Color.fromRGBO(85, 216, 90, 1),
                              value: _switchvalue1,
                              onChanged: (value) {
                                setState(() {
                                  _switchvalue1 = value;
                                });
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sales",
                              style: Theme.of(context).textTheme.bodySmall),
                          Switch(
                              activeColor: const Color.fromRGBO(85, 216, 90, 1),
                              value: _switchvalue2,
                              onChanged: (value) {
                                setState(() {
                                  _switchvalue2 = value;
                                });
                              }),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
