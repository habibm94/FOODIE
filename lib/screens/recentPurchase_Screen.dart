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
        title: Text(
          'Recent Orders',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[400]!,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Row(
                children: [
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
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        userRecentOrder.orders![index].food!.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        userRecentOrder.orders![index].restaurant!.name!,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userRecentOrder.orders![index].date!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          userRecentOrder.orders![index].food!.price!
                                  .toString() +
                              ' ' +
                              'Taka ',
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
      ),
    );
  }
}
