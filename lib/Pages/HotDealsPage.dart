import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/Pages/HomePage.dart';
import 'package:grocery_app/Utility/dummydata.dart';

class HotDealsPage extends StatefulWidget {
  const HotDealsPage({super.key, required this.dealIndex});

  final int dealIndex;

  @override
  State<HotDealsPage> createState() => _HotDealsPageState();
}

class _HotDealsPageState extends State<HotDealsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hot Deals'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: 'hotdeals${widget.dealIndex}',
                child: Container(
                  // margin: const EdgeInsets.only(right: 16),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(16),
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(deals[widget.dealIndex]['image']!),
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
                                deals[widget.dealIndex]['title']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                deals[widget.dealIndex]['description']!,
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
              ),
            ],
          ),
        ));
  }
}
