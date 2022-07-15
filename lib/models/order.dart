import 'package:foodie/models/food.dart';
import 'package:foodie/models/restaurant.dart';

class Order {
  final Restaurant? restaurant;
  final Food? food;
  final String? date;
  final int? quantity;
  final double totalprice;

  Order(
      {this.date,
      this.restaurant,
      this.food,
      this.quantity,
      required this.totalprice});
}
