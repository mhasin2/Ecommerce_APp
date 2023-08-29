import 'package:e_commerce/screens/sucess.dart';
import 'package:flutter/material.dart';

class Add_Shopping_Address extends StatefulWidget {
  const Add_Shopping_Address({Key? key}) : super(key: key);

  @override
  State<Add_Shopping_Address> createState() => _Add_Shopping_AddressState();
}

class _Add_Shopping_AddressState extends State<Add_Shopping_Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 10, 20),
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Adding Shipping Address', style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Metropolis', 
                      color: Colors.white,
                    ),),
        backgroundColor: const Color.fromARGB(255, 0, 10, 20),
        elevation: 0,
        leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 18)),
      ),
      body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60,),
                                Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              label: const Text(
                                'Full name',
                                style: TextStyle(color: Colors.grey),
                              ),
                              hintText: "  Full name ",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Metropolis",
                                fontSize: 14,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                       const SizedBox(
                          height: 16,
                        ),
                                                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              label: const Text(
                                'Address',
                                style: TextStyle(color: Colors.grey),
                              ),
                              hintText: "  3 Newbridge Court ",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Metropolis",
                                fontSize: 14,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                       const SizedBox(
                          height: 16,
                        ),
                                                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              label: const Text(
                                'City',
                                style: TextStyle(color: Colors.grey),
                              ),
                              hintText: "  Chino Hills ",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Metropolis",
                                fontSize: 14,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                       const SizedBox(
                          height: 16,
                        ),
                                                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              label: const Text(
                                'State/Province/Region',
                                style: TextStyle(color: Colors.grey),
                              ),
                              hintText: "  California ",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Metropolis",
                                fontSize: 14,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                       const SizedBox(
                          height: 16,
                        ),
                                                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              label: const Text(
                                'Zip Code (Postal Code)',
                                style: TextStyle(color: Colors.grey),
                              ),
                              hintText: "  91709 ",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Metropolis",
                                fontSize: 14,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                       const SizedBox(
                          height: 16,
                        ),
                                                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                              suffixIcon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                              label: const Text(
                                'Country',
                                style: TextStyle(color: Colors.grey),
                              ),
                              hintText: "  United States ",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Metropolis",
                                fontSize: 14,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                       const SizedBox(
                          height: 46,
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left: 36.0),
                          child: SizedBox(
                            width: 430,
                            height: 50,
                         
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Success()));
                              },
                             
                              child: const Text(
                                'SAVE ADDRESS',
                                style: TextStyle(
                                    fontFamily: "Metropolis", fontSize: 15),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 230, 5, 65),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
      ]),
    );
  }
}