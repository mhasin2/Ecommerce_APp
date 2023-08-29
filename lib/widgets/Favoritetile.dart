import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagepath;
  final String category;
  final String price;
  final String title;
  final String tag;
  final String description;
  final String rating;

  const ProductCard({super.key, 
    required this.imagepath,
    required this.category,
    required this.price,
    required this.title,
    required this.tag,
    this.description = "",
    this.rating = "",
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            height: 116,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                    width: 150,
                    color: Theme.of(context).colorScheme.onPrimary,
                    child: Stack(children: [
                      Image.network(imagepath, height: 114, width: 148),
                      Positioned(
                          top: 10,
                          left: 10,
                          child: Icon(Icons.favorite,color:Color(0xffFF2424) ,))
                    ])),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       RichText(
                         text: TextSpan(
                         text: title,
                        //   maxLines: 2,
                        //   textAlign: TextAlign.justify,
                        //  overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 16),
                                             ),
                       ),
                      Text(
                        rating,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.amber, fontSize: 11),
                      ),
                      Text(category,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 11, fontWeight: FontWeight.w400)),
                     
                      
                      Text(price, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}