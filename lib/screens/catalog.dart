import 'package:e_commerce/screens/main_file.dart';
import 'package:flutter/material.dart';
import '../models/product_class.dart';

import '../widgets/product_card2.dart';

class Catalog extends StatefulWidget {
  Categories? categoryList;
  Product? allProducts;
  int? categorieIndex;
  Catalog(
      {super.key, this.categoryList, this.categorieIndex, this.allProducts});

  @override
  State<Catalog> createState() =>
      _CatalogState();
}

class _CatalogState extends State<Catalog> {
  void setTheState() {
    return setState(() {});
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
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
       
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
              '${widget.categoryList?.categories?[widget.categorieIndex ?? 0].name}',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 34, fontWeight: FontWeight.w700, height: 0)),
        ),
        const SizedBox(height: 10),
        Row(children: [
          const Spacer(),
          const Icon(Icons.swap_vert_outlined),
          Text('Price: lowest to high',
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: 20),
        ]),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
              height: 30,
              child: Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.categoryList?.categories?.length ?? 5,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: ElevatedButton(
    
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                backgroundColor:
                                    Theme.of(context).colorScheme.onBackground,
                      
                              ),
                              child: Text(
                                  '${widget.categoryList?.categories?[index].name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary))),
                        );
                      })))),
        ),
        const SizedBox(height: 15),
        Expanded(
            child: ListView.builder(
                itemCount: widget.allProducts?.products?.length ?? 5,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      TileWidget02(
                        product: widget.allProducts,
                        index: index,
                        setTheState: setTheState,
                      ),
                    ],
                  );
                })))
      ])),
    );
  }
}
