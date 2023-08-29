
import 'package:e_commerce/screens/main_file2.dart';
import 'package:e_commerce/screens/card_scree.dart';
import 'package:flutter/material.dart';
import '../models/product_class.dart';
import 'catalog.dart';
import 'cate..list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'favorites.dart';
import 'home/home_page1.dart';
import 'home/homepage2.dart';
import 'profile/my_profile.dart';



class Mainfile extends StatefulWidget {
  const Mainfile({super.key});
  @override
  State<Mainfile> createState() => _MainfileState();
}

Product newProduct = Product();
Product saleProduct = Product();
Product allProducts = Product();

Categories categoryList = Categories();
int selactedPageIndex = 0;
PageController pageViewController = PageController();
List<Widget> listofScreens = [
  Homepage1(newProduct: newProduct),
  CategoriesList(categoryList: categoryList),
  
 
  const Favorites(),
  const MyProfile(),
];
List<Widget> allScreensList = [
  HomePage2(newProduct: newProduct, saleProduct: saleProduct),
];

class _MainfileState extends State<Mainfile> {
  void setTheState() {
    return setState(() {});
  }

  @override
  void initState() {
    getProductNew();
    setState(() {});
    getCategoriesList();
    getProductSale();
    getAllProducts();
    super.initState();
  }

  Future<void> getProductNew() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/tag/new/getAll'));
    setState(() {
      newProduct = Product.fromJson(jsonDecode(newResponse.body));
    });
  }

  Future<void> getAllProducts() async {
    http.Response newResponse = await http
        .get(Uri.parse('https://ecommerce.salmanbediya.com/products/getAll'));
    setState(() {
      allProducts = Product.fromJson(jsonDecode(newResponse.body));
    });
  }

  Future<void> getProductSale() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/tag/sale/getAll'));
    setState(() {
      saleProduct = Product.fromJson(jsonDecode(newResponse.body));
    });
  }

  Future<void> getCategoriesList() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/category/getAll'));
    setState(() {
      categoryList = Categories.fromJson(jsonDecode(newResponse.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        //
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        ),
        child: BottomNavigationBar(
            onTap: (intt) {
              setState(() {
                selactedPageIndex = intt;
              
                pageViewController.animateToPage(
                    selactedPageIndex, 
                    duration: const Duration(
                        microseconds:
                            300), 
                    curve: Curves
                        .bounceInOut 
                    );
              });
            },
            currentIndex: selactedPageIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.onBackground,
            showUnselectedLabels: true, 
            selectedLabelStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
            unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).colorScheme.background,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.shopping_cart),
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Shop',
              ),
             
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.favorite_rounded),
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Favorites'),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person_rounded),
                  icon: Icon(Icons.person_outline),
                  label: 'Profile'),
            ]),
      ),
      body: PageView(
        controller: pageViewController,
        children: listofScreens,
        onPageChanged: (intt) {
          selactedPageIndex = intt;
        },
      ),
    );
  }
}
