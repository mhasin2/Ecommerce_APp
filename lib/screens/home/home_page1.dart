
import 'package:e_commerce/screens/home/homepage2.dart';
import 'package:flutter/material.dart';



import '../../models/product_class.dart';
import '../../widgets/product_card1.dart';
import '../main_file.dart';


class Homepage1 extends StatefulWidget {
  Product? newProduct;

  Homepage1({super.key, this.newProduct});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  void setTheState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 536,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/h1.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Fashion',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                                height: 0)),
                    Text('Sale',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage2()
                                  // VisualFindingScreen(),
                                  ));
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(160, 36),
                            shadowColor: Theme.of(context).colorScheme.primary,
                            elevation: 8, //Shadow radius
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text('Check',
                            style: Theme.of(context).textTheme.bodyMedium)),
                  ]),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
              height: 331,
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
                  const SizedBox(height: 3),
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: ((context, index) {
                          return Card1(
                            index: index,
                            product: newProduct,
                            setTheState: setTheState,
                          );
                        }),
                        itemCount: newProduct.products?.length,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics()),
                  )
                ]),
              ))
        ],
      ),
    );
  }
}