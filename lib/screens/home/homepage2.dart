import 'package:e_commerce/screens/main_file.dart';
import 'package:flutter/material.dart';
import '../../models/product_class.dart';

import '../../widgets/product_card1.dart';

class HomePage2 extends StatefulWidget {
  final Product? newProduct;
  final Product? saleProduct;
  const HomePage2({super.key, this.newProduct, this.saleProduct});
  @override
  State<HomePage2> createState() => _HomePage2State();
}

String tempImage = 'assets/h1.jpg';

class _HomePage2State extends State<HomePage2> {
  void setTheState() {
    setState(() {});
  }
bool isLoadingNewProduct = false;
 bool isLoadingSaleProduct = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
    
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, size: 18)),
        ),
        body: 
         SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 196,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: const AssetImage('assets/h2.png'),
                      
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.1), BlendMode.darken))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Street clothes',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w700,
                                    height: 0)),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () {
                           
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(160, 36),
                                shadowColor: Theme.of(context).colorScheme.primary,
                                elevation: 8, 
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: Text('Check',
                                style: Theme.of(context).textTheme.bodyMedium)),
                      ]),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 337,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(children: [
                      Row(children: [
                        const SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sale',
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(height: 2),
                              Text('Super summer sale',
                                  style: Theme.of(context).textTheme.titleSmall),
                            ]),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text('View all',
                              style: Theme.of(context).textTheme.titleSmall),
                        )
                      ]),
                      const SizedBox(height: 5),
                      Expanded(
                         child: ListView.builder(
                            itemBuilder: ((context, index) {
                              return Card1(
                                index: index,
                                product: saleProduct,
                                setTheState: setTheState,
                              );
      
                             
                            }),
                            itemCount: widget.saleProduct?.products?.length ?? 5,
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics()),
                      )
                    ]),
                  )),
              const SizedBox(height: 20),
              SizedBox(
                  height: 337,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(children: [
                      Row(children: [
                        const SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New',
                                style: Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(height: 2),
                              Text('You’ve never seen it before!',
                                  style: Theme.of(context).textTheme.titleSmall),
                            ]),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text('View all',
                              style: Theme.of(context).textTheme.titleSmall),
                        )
                      ]),
                      const SizedBox(height: 5),
                      Expanded(
                        
                        child: 
                       newProduct==null?
                        const Center(child: CircularProgressIndicator()):
                      ListView.builder(
                          itemBuilder: ((context, index) {
                            return Card1(
                              index: index,
                              product: newProduct,
                              setTheState: setTheState,
                            );
                          }),
                          itemCount: newProduct.products?.length ?? 5,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics()),
                      )
                    ],
                    
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
