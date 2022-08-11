import 'package:flutter/material.dart';

import '../data/data.dart';

class RecentPurchaseScreen extends StatefulWidget {
  const RecentPurchaseScreen({Key? key}) : super(key: key);

  @override
  State<RecentPurchaseScreen> createState() => _RecentPurchaseScreenState();
}

class _RecentPurchaseScreenState extends State<RecentPurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    var userRecentOrder = currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recent Orders',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[400]!,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              children: [
                ///item image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        userRecentOrder.orders![index].food!.imageUrl!),
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ///item name
                    Text(
                      userRecentOrder.orders![index].food!.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),

                    ///restaurant name
                    Text(
                      userRecentOrder.orders![index].restaurant!.name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///order date
                      Text(
                        userRecentOrder.orders![index].date!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),

                      ///price
                      Text(
                        '${userRecentOrder.orders![index].food!.price!} Taka ',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: userRecentOrder.orders!.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
