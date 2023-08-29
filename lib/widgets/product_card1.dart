
import 'package:e_commerce/models/product_class.dart';
import 'package:flutter/material.dart';


class Card1 extends StatefulWidget {
  final Function setTheState;
  final int index;
  Product? product;
  Card1(
      {super.key,
      required this.product,
      required this.index,
      required this.setTheState});

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  Icon unCheckIcon =
      const Icon(Icons.favorite_border, color: Color(0xffABB4BD));
  Icon checkIcon = const Icon(Icons.favorite, color: Color(0xffEF3651));
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          width: 150,
          height: 266,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 184,
                      width: 148,
                      decoration: BoxDecoration(
                      
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                      ),
                      child: Image.network(
                          '${widget.product?.products?[widget.index].image}',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                              height: 24,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                 
                                  color: widget.product?.products?[widget.index]
                                              .tag?.name ==
                                          'New'
                                      ? Theme.of(context).colorScheme.background
                                      : Theme.of(context).colorScheme.primary),
                              child: Center(
                                  
                                  child: Text(
                                      widget.product?.products?[widget.index]
                                              .tag?.name ??
                                          'NEW',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall))),
                        )),
                    Positioned(
                      top: 160,
                      left: 100,
                      //--------------------customed checkBox
                      child: ElevatedButton(
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
                    ),
                  ],
                ),
                Row(children: [

                ]),
                Text(
                    '${widget.product?.products?[widget.index].category?.name}',
                    style: Theme.of(context).textTheme.titleSmall),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                        '${widget.product?.products?[widget.index].name}',
                        style: Theme.of(context).textTheme.bodyLarge)),
                Text('${widget.product?.products?[widget.index].price}Rs',
                    style: Theme.of(context).textTheme.titleSmall),
               
              ]),
        ));
  }
}
