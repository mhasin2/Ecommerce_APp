
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/productitem.dart';
import '../../widgets/Favoritetile.dart';




class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}


class _MyOrderState extends State<MyOrder> {
   AppBar _showAppBAr() {
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
    List<Products>? productList;



  @override
  void initState() {
    super.initState();
    fetchData();
   
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://ecommerce.salmanbediya.com/products/tag/sale/getAll'),
    );

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final productItems = ProductItems.fromJson(decodedResponse);
      setState(() {
        productList = productItems.products;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }


  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
      appBar: _showAppBAr(),
       
       backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Text(
                  "My Orders",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge,
                ),
                Expanded(child:  SizedBox(
             
                child: productList == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        controller: ScrollController(),
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: productList!.length,
                        itemBuilder: (context, index) {
                          final product = productList![index];
                          return ProductCard(
                            imagepath: product.image ?? "",
                            category: product.category?.name ?? "",
                            price: product.price ?? "",
                            tag: product.tag?.name ?? "",
                            title: product.name ?? "",
                            rating: product.rating ?? "",
                          );
                        },
                      ),
              ),
             )
          ],
        ),
      ),
      ),
    );
  
  }
}