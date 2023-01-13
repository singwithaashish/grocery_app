import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/Pages/CartPage.dart';
import 'package:grocery_app/Pages/FavoritesPage.dart';
import 'package:grocery_app/Pages/HomePage.dart';
import 'package:grocery_app/Pages/ProductsPage.dart';
import 'package:grocery_app/Pages/ProfilePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // routes: {
      //   '/': (context) => const Screens(),
      //   '/products': (context) => const ProductsPage(productIndex: inde,),
      // },
      home: const Screens(),
    );
  }
}

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int currentScreenIndex = 0;
  final _pgController = PageController();
  final List<String> pageTitles = [
    "Home",
    "Favorites",
    "Cart",
    "Profile",
  ];
  var _headline = "Home";
  late List<CollapsibleItem> _items;

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home_outlined,
        onPressed: () => setState(() {
          currentScreenIndex = 0;
          _pgController.jumpToPage(0);
        }),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Favorites',
        icon: Icons.favorite_border_outlined,
        onPressed: () => setState(() {
          currentScreenIndex = 1;
          _pgController.jumpToPage(1);
        }),
      ),
      CollapsibleItem(
        text: 'Cart',
        icon: Icons.shopping_cart_outlined,
        onPressed: () => setState(() {
          currentScreenIndex = 2;
          _pgController.jumpToPage(2);
        }),
      ),
      CollapsibleItem(
        text: 'Account',
        icon: Icons.person_outline,
        onPressed: () => setState(() {
          currentScreenIndex = 3;
          _pgController.jumpToPage(3);
        }),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.width < 6080
          ? AppBar(
              title: Text(
                pageTitles[currentScreenIndex],
                // style: const TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
              ],

              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage("Assets/Images/my_photo.jpeg"),
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              // backgroundColor: Colors.white,
              elevation: currentScreenIndex == 3 ? 0 : 4,
            )
          : null,
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("Drawer Header"),
            ),
            ListTile(
              title: const Text("Item 1"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Item 2"),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 680
          ? BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              currentIndex: currentScreenIndex,
              onTap: (int index) {
                setState(() {
                  currentScreenIndex = index;
                  _pgController.jumpToPage(index);
                });
              },
            )
          : null,
      body: MediaQuery.of(context).size.width > 680
          ? CollapsibleSidebar(
              isCollapsed: true,
              items: _items,
              // avatarImg: _avatarImg,
              title: 'Herb Sell Center',
              onTitleTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Yay! Flutter Collapsible Sidebar!')));
              },

              backgroundColor: Colors.white,
              selectedTextColor: Colors.white, //Theme.of(context).primaryColor,
              selectedIconColor: Colors.white, //Theme.of(context).primaryColor,
              textStyle: TextStyle(fontSize: 15),
              titleStyle: TextStyle(
                  fontSize: 20,
                  // fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
              toggleTitleStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              unselectedIconColor: Colors.grey,
              unselectedTextColor: Colors.grey,
              selectedIconBox: Theme.of(context).primaryColor,
              sidebarBoxShadow: [],

              body: PageView(
                controller: _pgController,
                onPageChanged: (int index) {
                  setState(() {
                    currentScreenIndex = index;
                  });
                },
                children: const <Widget>[
                  HomePage(),
                  FavoritesPage(),
                  CartPage(),
                  ProfilePage()
                ],
              ),
            )
          : PageView(
              controller: _pgController,
              onPageChanged: (int index) {
                setState(() {
                  currentScreenIndex = index;
                });
              },
              children: const <Widget>[
                HomePage(),
                FavoritesPage(),
                CartPage(),
                ProfilePage()
              ],
            ),
    );
  }
}
