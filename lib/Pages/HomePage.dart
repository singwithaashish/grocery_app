import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/Pages/CategoriesPage.dart';
import 'package:grocery_app/Pages/HotDealsPage.dart';
import 'package:grocery_app/Pages/ProductsPage.dart';
import 'package:grocery_app/Utility/dummydata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const CategoriesWidget(),
            const SizedBox(height: 16),
            const DealsWidget(),
            const SizedBox(height: 16),
            Column(
              children: [
                const ViewAllRow(
                  title: "Featured Products",
                ),
                const SizedBox(height: 16),
                // GridView.count(
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 16,
                //   mainAxisSpacing: 16,
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   children: [
                //     for (var product in allProducts) ItemCard(product: product),
                //   ],
                // )
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 600 ? 4 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductsPage(
                              productIndex: index,
                            ),
                          ),
                        );
                      },
                      child: ItemCard(product: allProducts[index]),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );

    // );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Map<String, Object> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: product['image'] as String,
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  ),
                  image: DecorationImage(
                    image: AssetImage(product['image'] as String),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product['category'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '\$${product['price']}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // CircleAvatar(
                Hero(
                  tag: "${product['name']! as String}fab",
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(30, 30),
                      // maximumSize: const Size(30, 30),
                    ),
                    // iconSize: 20,
                    child: const Icon(Icons.add),
                  ),
                ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DealsWidget extends StatelessWidget {
  const DealsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ViewAllRow(
          title: "Hot Deals",
        ),
        SizedBox(
          height: 180,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,

            itemCount:
                MediaQuery.of(context).size.width > 600 ? deals.length : 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HotDealsPage(
                        dealIndex: index,
                      ),
                    ),
                  );
                },
                child: HotDealsWidget(
                  index: index,
                ),
              );
            },
            // children: [
            //   for (var i = 0; i < 5; i++)
            //     Container(
            //       width: 200,
            //       height: 200,
            //       margin: const EdgeInsets.only(right: 16),
            //       color: Colors.red,
            //     )
            // ],
          ),
        ),
      ],
    );
  }
}

class HotDealsWidget extends StatelessWidget {
  const HotDealsWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hotdeals$index",
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(deals[index]['image']!),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      deals[index]['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      deals[index]['description']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ViewAllRow(
          title: "Categories",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0;
                i < (MediaQuery.of(context).size.width > 600 ? 8 : 4);
                i++)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        categoryIndex: i,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    // Image.asset(categories[index]['image'] as String),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.3),
                      backgroundImage:
                          AssetImage(categories[i]['image'] as String),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(categories[i]['name'] as String,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black87)),
                  ],
                ),
              ),
          ],
        )
      ],
    );
  }
}

class ViewAllRow extends StatelessWidget {
  final String title;
  const ViewAllRow({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                "View All",
                style: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                    fontSize: 19),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

// class CategoryCol extends StatelessWidget {
//   const CategoryCol({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Image.asset(categories[index]['image'] as String),
//         CircleAvatar(
//           radius: 30,
//           backgroundImage:
//               AssetImage(categories[0]['image'] as String),
//         ),
//         Text(categories[0]['name'] as String),
//       ],
//     );
//   }
// }
