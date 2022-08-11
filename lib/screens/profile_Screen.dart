import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../data/data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var userRecentOrder = currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 160,
                width: 140,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      )
                    ]),

                ///profile image
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image(
                    image: AssetImage(
                      'assets/images/dumpling.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  ///name
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),

                  ///adress
                  Text(
                    '3 Parkville Street,\nNewYork',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ///point
                  Text(
                    'Loyalty point: 335',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),

          ///recent order text
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
              child: const Text(
                'Recent Orders',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          SizedBox(
            height: 440,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(
                      left: 15, right: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[400]!,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    children: [
                      /// product image
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
                          ///product name
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

                            ///order price
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
          ),
        ],
      ),
    );
  }
}
