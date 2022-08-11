import 'package:flutter/material.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/models/order.dart';
import 'package:foodie/widgets/recent_orders.dart';
import 'package:foodie/models/user.dart';

class RecentOrder extends StatelessWidget {
  final User orders;

  const RecentOrder({required this.orders});

  @override
  Widget build(BuildContext context) {
    var userRecentOrder = orders;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///title
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Text(
            'Recent Order',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 120.0,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(10.0),
                width: 280.0,
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

                    ///name
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userRecentOrder.orders![index].food!.name!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            userRecentOrder.orders![index].restaurant!.name!,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Theme.of(context).primaryColor,
                      ),
                      margin: const EdgeInsets.all(10.0),

                      ///add to cart button
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          print('add your add to cart function here');
                        },
                        iconSize: 30.0,
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: userRecentOrder.orders!.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
