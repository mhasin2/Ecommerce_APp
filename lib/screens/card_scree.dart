



import 'package:flutter/material.dart';


import '../models/product_class.dart';


import '../widgets/product_card1.dart';
import 'add_shipping_address.dart';


class CardScreen extends StatefulWidget {
  final Function setTheState;
  final int index;
  Product? product;
  CardScreen(
      {super.key,
      required this.product,
      required this.index,
      required this.setTheState});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  Icon unCheckIcon =
      const Icon(Icons.favorite_border, color: Color(0xffABB4BD));
  Icon checkIcon = const Icon(Icons.favorite, color: Color(0xffEF3651));
  bool isFavorite = false;
  

  void colorBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        showDragHandle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child:SizedBox(
      height: 375,
      child: Column(children: [
        const SizedBox(height: 30),
        Text('Select color', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          sizeandColorContainer("Blue"),
          sizeandColorContainer("Black"),
          // sizeandColorContainer("White")
        ]),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          sizeandColorContainer("Red"),
          sizeandColorContainer("Purpal"),
         
        ]),
        const SizedBox(height: 10),
        const Divider(),
        ListTile(
          title:
              Text('Color info', style: Theme.of(context).textTheme.bodyLarge),
          trailing: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios, size: 15)),
        ),
        const Divider(),
        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(343, 48),
                shadowColor: Theme.of(context).colorScheme.primary,
                elevation: 8, 
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text('Save Info',
                style: Theme.of(context).textTheme.bodyMedium)),
      ]),
    ),
          );
        });
  }
  
   void sizeBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        showDragHandle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child:SizedBox(
      height: 375,
      child: Column(children: [
        const SizedBox(height: 30),
        Text('Select size', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          sizeandColorContainer("XS"),
          sizeandColorContainer("S"),
          // sizeandColorContainer("M")
        ]),
        const SizedBox(height: 7),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          sizeandColorContainer("L"),
          sizeandColorContainer("Xl"),
        
        ]),
        const SizedBox(height: 10),
        const Divider(),
        ListTile(
          title:
              Text('Size info', style: Theme.of(context).textTheme.bodyLarge),
          trailing: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios, size: 15)),
        ),
        const Divider(),
        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(343, 48),
                shadowColor: Theme.of(context).colorScheme.primary,
                elevation: 8, 
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text('Save Info',
                style: Theme.of(context).textTheme.bodyMedium)),
      ]),
    ),
          );
        });
  }
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading:  IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, size: 18)) ,
                actions: [  IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.share, size: 18)),],
        ),
          body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 18),
         
          Container(
            color: Theme.of(context).colorScheme.secondary,
              height: 413,
              width: double.infinity,
              child: Image.network(
                  '${widget.product?.products?[widget.index].image}',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter)),
    
          
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                      onTap: sizeBottomSheet,
                          child: sizeandColorContainer('Size')),
                      const SizedBox(width: 5),
                      InkWell(
                          onTap: colorBottomSheet,
                          child: sizeandColorContainer('Color')),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              fixedSize: const Size(36, 36),
                              shape: const CircleBorder(side: BorderSide.none)),
                          onPressed: () {
                            isFavorite = !isFavorite;
                            widget.setTheState();
                          },
                          child: isFavorite == true ? checkIcon : unCheckIcon),
                    ]),
                const SizedBox(height: 10),
                Row(crossAxisAlignment: CrossAxisAlignment.start, 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                   
                    child: Text(
                      '${widget.product?.products?[widget.index].name}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${widget.product?.products?[widget.index].price.toString()}Rs',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
                Text('${widget.product?.products?[widget.index].category?.name}',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 10),
    
    
                InkWell(
                  onTap: () {
                    
                  },
                  child: Text(
                    widget.product?.products?[widget.index].reviews != null
                        ? '(${widget.product?.products?[widget.index].reviews})'
                        : '(0)',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: SingleChildScrollView(
                   
                    scrollDirection: Axis.vertical,
                    child: Text(
                      '${widget.product?.products?[widget.index].description}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(height: 1.2),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
    
                Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(343, 48),
                          shadowColor: Theme.of(context).colorScheme.primary,
                          elevation: 8, 
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: Text('ADD TO CART',
                          style: Theme.of(context).textTheme.bodyMedium)),
                ),
              ])),
          const SizedBox(height: 20),
          const Divider(),
          ListTile(
            title: Text('Shipping info',
                style: Theme.of(context).textTheme.bodyLarge),
            trailing: IconButton(
                padding: EdgeInsets.zero,
               onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Add_Shopping_Address()),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios, size: 18)),
          ),
          const Divider(),
          ListTile(
            title: Text('Support', style: Theme.of(context).textTheme.bodyLarge),
            trailing: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
               
                },
                icon: const Icon(Icons.arrow_forward_ios, size: 18)),
          ),
          const Divider(),
          SizedBox(
              height: 337,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  Row(children: [
                    const SizedBox(width: 15),
                    Text(
                      'You can also like this',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
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
                            product: widget.product,
                            index: index,
                            setTheState: widget.setTheState,
                            
                          );
    
                        
                        }),
                        itemCount: widget.product?.products?.length ?? 5,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics()),
                  )
                ]),
              )),
        ]),
      )),
    );
  }

  Container sizeandColorContainer(String childText, {double? w, double? h}) {
    return Container(
        width: w ?? 138,
        height: h ?? 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffABB4BD))),
        child: Center(child: Text(childText)));
  }
}
