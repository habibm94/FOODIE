import 'package:flutter/material.dart';
import 'package:foodie/data/data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartitems = cart;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            padding: EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 10),
            color: Colors.grey.shade100,
            child: ListView.builder(
              itemBuilder: (context, int index) {
                return Container(
                    height: 120,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 6,
                              color: Colors.black26,
                              offset: Offset(0, 2))
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            cartitems[index].imageUrl!,
                            height: 100,
                            width: 130,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${cartitems[index].name}',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('${cartitems[index].price} taka',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.delete,
                                size: 25,
                                color: Theme.of(context).primaryColor,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        )
                      ],
                    ));
              },
              itemCount: cartitems.length,
            ),
          ),
          Container(
            height: 180,
            padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 30),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  blurRadius: 6, color: Colors.black26, offset: Offset(0, 2))
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      '257 taka',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
