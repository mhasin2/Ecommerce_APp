import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/productitem.dart';
import 'package:http/http.dart' as http;

import '../widgets/Favoritetile.dart';
import '../widgets/product_card2.dart';



class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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
    return Scaffold(
   appBar: AppBar(actions: const [Icon(Icons.search_rounded)],
   backgroundColor: const Color(0xff1E1F28),),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text("Favorites",style: Theme.of(context).textTheme.headlineLarge,),
             
              SizedBox(
             
                child: productList == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        controller: ScrollController(),
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
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
             
             
            ],
          ),
        ),
      ),
    );
  }
}