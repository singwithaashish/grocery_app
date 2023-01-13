import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/Pages/ProductsPage.dart';
import 'package:grocery_app/Utility/dummydata.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return purchasedItems(context, index);
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Divider(
                thickness: 2,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sub total',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '\$ 97',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery Charges',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$ 12',
                  style: TextStyle(
                    fontSize: 20,
                    // color: Colors.black.withOpacity(0.),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '\$ 109',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              // foregroundColor: Colors.green,
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.35,
                  vertical: 20),
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text('Check Out'),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  GestureDetector purchasedItems(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsPage(
              productIndex: cartItems[index]['index'] as int,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: allProducts[cartItems[index]['index'] as int]['image']
                      as String,
                  child: Container(
                    height: 100,
                    width: 150,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          allProducts[cartItems[index]['index']]['image']
                              as String,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allProducts[cartItems[index]['index']]['name'] as String,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${cartItems[index]['quantity']} ${allProducts[cartItems[index]['index']]['unit'] as String}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${allProducts[cartItems[index]['index']]['price']}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.remove,
                                // color: Colors.white,
                              ),
                            ),
                            Text(
                              "${cartItems[index]['quantity'].toString()}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Hero(
                              tag:
                                  "${allProducts[cartItems[index]['index'] as int]['name'] as String}fab",
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shape: const CircleBorder(),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        //     Row(
        //       children: [
        //         ElevatedButton(
        //           child: const Icon(
        //             Icons.remove,
        //             // color: Colors.white,
        //           ),
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: Colors.white,
        //             foregroundColor: Colors.black,
        //             shape: const CircleBorder(),
        //           ),
        //           onPressed: () {},
        //         ),
        //         Text(
        //           '1',
        //           style: TextStyle(
        //             fontSize: 16,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         // TextField(
        //         //   decoration: InputDecoration(
        //         //     contentPadding: const EdgeInsets.only(bottom: 12),
        //         //     constraints: const BoxConstraints(
        //         //       maxHeight: 30,
        //         //       maxWidth: 20,
        //         //     ),
        //         //     // border: InputBorder.none,
        //         //     // fillColor: Colors.green.withOpacity(0.2),
        //         //     // filled: true,
        //         //     hintText: '1',
        //         //   ),
        //         // ),
        //         ElevatedButton(
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: Colors.white,
        //             foregroundColor: Colors.black,
        //             shape: const CircleBorder(),
        //           ),
        //           child: const Icon(
        //             Icons.add,
        //             color: Colors.green,
        //           ),
        //           onPressed: () {},
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
