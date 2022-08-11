import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:foodie/data/data.dart';
import 'package:foodie/screens/LogIn_Screen.dart';
import 'package:foodie/screens/cart_Screen.dart';
import 'package:foodie/screens/profile_Screen.dart';
import 'package:foodie/screens/recentPurchase_Screen.dart';
import 'package:foodie/widgets/recent_orders.dart';
import 'package:foodie/widgets/nearby_restaurants.dart';

import '../services/dialogs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          drawer: const HomeDrawer(),
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,

            ///appbar title
            title: const Center(child: Text('FOODIE')),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///shopping cart icon in appbar
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    iconSize: 25,
                    onPressed: () {
                      print('Home screen cart button got pressed');
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CartScreen()),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Center(
                      child: Text(
                          '${currentUser.cart == null ? 0 : currentUser.cart!.length} items'),
                    ),
                  ),
                ],
              )
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height * 90,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // physics: BouncingScrollPhysics(),
              children: [
                ///search textfield
                TextField(
                  decoration: InputDecoration(
                      enabled: true,
                      prefixIcon: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFFF0000),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ]),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      suffixIcon: Container(
                        child: const Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              width: 0.8, color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).primaryColor))),
                ),
                RecentOrder(
                  orders: currentUser,
                ),
                NearbyRestaurant(nearbyRestaurants: restaurants),
              ],
            ),
          ),
        ),
        onWillPop: () => Dialogs().showExitDialog(context));
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///top carved section
            ClipPath(
              clipper: WaveClipperTwo(reverse: false, flip: true),
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFFFF0000),
                  ),
                  child: Container(
                    height: 220,
                    width: 280,
                    child: Center(
                      child: Image.asset(
                        'assets/images/foodie.PNG',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  // Center(
                  //   child: Text(
                  //     'FOODIE',
                  //     style: TextStyle(
                  //         fontSize: 35,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.white),
                  //   ),
                  // ),
                  ),
            ),
            const SizedBox(
              height: 20,
            ),

            ///profiel button
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 20, right: 10),
              decoration: const BoxDecoration(color: Colors.white),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                ),
                child: const ListTile(
                  title: Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.account_circle,
                    color: Color(0xFFFF0000),
                    size: 30,
                  ),
                ),
              ),
            ),
            const Divider(
              color: Color(0xFFFF0000),
              height: 2,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),

            ///cart button
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 20, right: 10),
              decoration: const BoxDecoration(color: Colors.white),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                ),
                child: const ListTile(
                  title: Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.shopping_cart,
                    color: Color(0xFFFF0000),
                    size: 30,
                  ),
                ),
              ),
            ),
            const Divider(
              color: Color(0xFFFF0000),
              height: 2,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),

            ///recent button
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 20, right: 10),
              decoration: const BoxDecoration(color: Colors.white),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => const RecentPurchaseScreen()),
                ),
                child: ListTile(
                  title: Text(
                    'Recent',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.shopping_bag,
                    color: Color(0xFFFF0000),
                    size: 30,
                  ),
                ),
              ),
            ),
            const Divider(
              color: Color(0xFFFF0000),
              height: 2,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(
              height: 160,
            ),

            ///login button
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const LogInScreen()));
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
