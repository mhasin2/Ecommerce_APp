import 'dart:io';

import 'package:e_commerce/screens/initial_screens/visualsearch2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main_file.dart';

class VisualFindingScreen extends StatefulWidget {
  const VisualFindingScreen({super.key});

  @override
  State<VisualFindingScreen> createState() => _VisualFindingScreenState();
}

File? imagePickerCamera;
File? imagePickerGallery;

class _VisualFindingScreenState extends State<VisualFindingScreen> {
  void swtichtheSplashScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Mainfile(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text('Visual search',
                  style: Theme.of(context).textTheme.headlineSmall),
           backgroundColor: Theme.of(context).colorScheme.background,
          actions: [IconButton(onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Mainfile()));
        }, icon: Icon(Icons.close_sharp))],
        leading:IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, size: 18)), 
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
           
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.black, Colors.transparent]),
                  backgroundBlendMode: BlendMode.screen,
                  image: DecorationImage(
                      image: AssetImage('assets/image 6.png'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                        'Search for an outfit by taking a photo or uploading an image',
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 25),
                    ElevatedButton(
                        onPressed: () async {
                          final ImagePicker imagePicker = ImagePicker();
                          XFile? image = await imagePicker.pickImage(
                              source: ImageSource.camera);
                          setState(() {
                            if (image != null) {
                              imagePickerCamera = File(image.path);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(343, 48),
                            shadowColor: Theme.of(context).colorScheme.primary,
                            elevation: 8, //Shadow radius
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text('TAKE A PHOTO',
                            style: Theme.of(context).textTheme.bodyMedium)),
                    const SizedBox(height: 15),
                    ElevatedButton(
                        onPressed: () async {
                          final ImagePicker imagePicker = ImagePicker();
                          XFile? image = await imagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (image != null) {
                              imagePickerGallery = File(image.path);
                            }
                            Future.delayed(const Duration(seconds: 2),
                                swtichtheSplashScreen);
                       
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VisualFindingSplashScreen(
                                      imagePickerGallery: imagePickerGallery),
                                ));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(343, 48),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(50))),
                        child: Text('UPLOAD AN IMAGE',
                            style: Theme.of(context).textTheme.bodyMedium)),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
