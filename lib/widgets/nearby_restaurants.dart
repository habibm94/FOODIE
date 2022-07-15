import 'package:flutter/material.dart';
import 'package:foodie/models/restaurant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodie/screens/restaurant_screen.dart';

class NearbyRestaurant extends StatelessWidget {
  final List<Restaurant> nearbyRestaurants;
  NearbyRestaurant({required this.nearbyRestaurants});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Text(
            'Nearby Restaurants',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 395,
          // height: 350,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => RestaurantScreen(
                                selectedRestaurant: nearbyRestaurants[index],
                              )));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: Colors.redAccent[400]!),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    children: [
                      Hero(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            height: 120,
                            width: 120,

                            ///Add restaurant image
                            image:
                                AssetImage(nearbyRestaurants[index].imageUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        tag: nearbyRestaurants[index].imageUrl!,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ///add restaurant name
                              nearbyRestaurants[index].name!,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            RatingBarIndicator(
                              ///add rating
                              rating:
                                  nearbyRestaurants[index].rating!.toDouble(),
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Theme.of(context).primaryColor,
                              ),
                              itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                            Text(
                              ///add address
                              nearbyRestaurants[index].address!,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              ///add distance
                              'Distance: ${nearbyRestaurants[index].distance.toString()} km',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },

            ///add length
            itemCount: nearbyRestaurants.length,
          ),
        )
      ],
    );
  }
}
