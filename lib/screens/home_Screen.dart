import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:foodie/models/order.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/screens/LogIn_Screen.dart';
import 'package:foodie/screens/cart_Screen.dart';
import 'package:foodie/screens/profile_Screen.dart';
import 'package:foodie/screens/recentPurchase_Screen.dart';
import 'package:foodie/widgets/recent_orders.dart';
import 'package:foodie/widgets/nearby_restaurants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(child: Text('FOODIE')),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                ///todo- crete cart screen and add to it
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
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // physics: BouncingScrollPhysics(),
          children: [
            TextField(
              decoration: InputDecoration(
                  enabled: true,
                  prefixIcon: Container(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ]),
                  ),
                  suffixIcon: Container(
                    child: Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8, color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor))),
            ),
            RecentOrder(
              orders: currentUser,
            ),
            NearbyRestaurant(nearbyRestaurants: restaurants),
          ],
        ),
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // padding: EdgeInsets.zero,
        children: [
          ClipPath(
            clipper: WaveClipperTwo(reverse: false, flip: true),
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: Text(
                  'FOODIE',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2), blurRadius: 4, color: Colors.black26),
            ], color: Colors.white),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              ),
              child: ListTile(
                title: Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.account_circle,
                  color: Colors.red[700],
                  size: 25,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2), blurRadius: 4, color: Colors.black26),
            ], color: Colors.white),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CartScreen()),
              ),
              child: ListTile(
                title: Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.shopping_cart,
                  color: Colors.red[700],
                  size: 25,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2), blurRadius: 4, color: Colors.black26),
            ], color: Colors.white),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RecentPurchaseScreen()),
              ),
              child: ListTile(
                title: Text(
                  'Recent Purchases',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.shopping_bag,
                  color: Colors.red[700],
                  size: 25,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 160,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => LogInScreen()));
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
