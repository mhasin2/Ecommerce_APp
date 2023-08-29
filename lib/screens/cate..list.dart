import 'package:e_commerce/screens/main_file.dart';
import 'package:flutter/material.dart';
import '../models/product_class.dart';
import 'catalog.dart';

class CategoriesList extends StatefulWidget {
  Categories? categoryList;
  Product? allProducts;

  CategoriesList({super.key, this.categoryList, this.allProducts});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {

AppBar _showAppBar() {
    return AppBar(
      leading:   Container(),
          
      backgroundColor: const Color.fromRGBO(30, 31, 40, 1),
      actions: const [
        Icon(Icons.search),
        Padding(padding: EdgeInsets.all(10)),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Catalog(
                                categorieIndex: 0,
                                allProducts: allProducts,
                                categoryList: categoryList,
                               
                              )
    
                          ));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(343, 48),
                    shadowColor: Theme.of(context).colorScheme.primary,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: Text('VIEW ALL ITEMS',
                    style: Theme.of(context).textTheme.bodyMedium)),
          ),
          const SizedBox(height: 15),
          Text('Choose category', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Catalog(
                                          categorieIndex: index,
                                          allProducts: allProducts,
                                          categoryList: categoryList,
                                        )));
                          },
                          child: Text("${categoryList.categories?[index].name}",
                              style: Theme.of(context).textTheme.bodyLarge)),
                    ),
                    SizedBox(
                      height: 50,
                      
                      child: Divider(color: Theme.of(context).colorScheme.onSurface)),
                  
                  ]);
            },
            itemCount: categoryList.categories?.length,
          ))
        ]),
      ),
    );
  }
}
