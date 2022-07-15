import 'package:flutter/material.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/models/restaurant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant selectedRestaurant;
  RestaurantScreen({required this.selectedRestaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                child: Image(
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(
                    widget.selectedRestaurant.imageUrl!,
                  ),
                ),
                tag: widget.selectedRestaurant.imageUrl!,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.selectedRestaurant.name!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.selectedRestaurant.distance!.toString()} miles away',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBarIndicator(
                        ///add rating
                        rating: widget.selectedRestaurant.rating!.toDouble(),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                          '${widget.selectedRestaurant.rating.toString()}/5 star'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.selectedRestaurant.address!,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Reviews',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Theme.of(context).primaryColor),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Contacts',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      'Menu',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext ctx, int index) {
                  return Stack(
                    fit: StackFit.expand,
                    //alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        child: Image(
                          image: AssetImage(
                              '${widget.selectedRestaurant.menu![index].imageUrl}'),
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width * 0.45,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      Expanded(
                        child: Positioned(
                          child: Column(
                            children: [
                              Text(
                                widget.selectedRestaurant.menu![index].name!,
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                maxLines: 2,
                              ),
                              Text(
                                widget.selectedRestaurant.menu![index].price
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          bottom: 65.0,
                          left: 50,
                        ),
                      ),
                      Positioned(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            shape: CircleBorder(),
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 40,
                          ),
                        ),
                        bottom: 8,
                        left: 98,
                      )
                    ],
                  );
                },
                itemCount: widget.selectedRestaurant.menu!.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
