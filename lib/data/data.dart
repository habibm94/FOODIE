import 'package:foodie/models/food.dart';
import 'package:foodie/models/order.dart';
import 'package:foodie/models/restaurant.dart';
import 'package:foodie/models/user.dart';

// Food
final _burrito =
    Food(imageUrl: 'assets/images/burrito.jpg', name: 'Burrito', price: 8.99);
final _dumpling =
    Food(imageUrl: 'assets/images/dumpling.jpg', name: 'Dumpling', price: 4.99);
final _burger =
    Food(imageUrl: 'assets/images/burger.jpg', name: 'Burger', price: 6.99);
final _steak =
    Food(imageUrl: 'assets/images/steak.jpg', name: 'Steak', price: 18.99);
final _fishandchips = Food(
    imageUrl: 'assets/images/fish and chips.jpg',
    name: 'Fish&Chips',
    price: 5.99);
final _chickenbbq = Food(
    imageUrl: 'assets/images/chicken bbq.jpg',
    name: 'BBQchicken',
    price: 12.99);
final _chickenfry = Food(
    imageUrl: 'assets/images/chicken fry.jpg',
    name: 'Chciken fry',
    price: 17.99);
final _fishfry =
    Food(imageUrl: 'assets/images/fishfry.jpg', name: 'Fishfry', price: 17.99);
final _muttonBiryani = Food(
    imageUrl: 'assets/images/mutton biryani.jpg',
    name: 'Mutton Biryani',
    price: 17.99);
final _pasta =
    Food(imageUrl: 'assets/images/pasta.jpg', name: 'Pasta', price: 14.99);
final _ramen =
    Food(imageUrl: 'assets/images/ramen.jpg', name: 'Ramen', price: 13.99);
final _pancakes =
    Food(imageUrl: 'assets/images/pancakes.jpg', name: 'Pancakes', price: 9.99);
final _pronfriedrice = Food(
    imageUrl: 'assets/images/pron fried rice.jpg',
    name: 'Pron Fried Rice',
    price: 14.99);
final _pizza =
    Food(imageUrl: 'assets/images/pizza.jpg', name: 'Pizza', price: 11.99);
final _salmon = Food(
    imageUrl: 'assets/images/salmon.jpg', name: 'Salmon Salad', price: 12.99);
final _subwayburger = Food(
    imageUrl: 'assets/images/subway burger.jpg',
    name: 'Subway Burger',
    price: 3.99);
final _tandoorimutton = Food(
    imageUrl: 'assets/images/tandoori mutton.jpg',
    name: 'Tandori Mutton',
    price: 13.99);
final _muttoncurry = Food(
    imageUrl: 'assets/images/mutton curry.jpg',
    name: 'Mutton Curry',
    price: 11.99);
final _frenchfry = Food(
    imageUrl: 'assets/images/french fry.jpg', name: 'French Fry', price: 11.99);
final _noodles =
    Food(imageUrl: 'assets/images/noodles.jpg', name: 'Noodles', price: 11.99);

final cart = [
  _ramen,
  _burrito,
  _steak,
  _pasta,
  _ramen,
  _pancakes,
  _burger,
  _pizza,
  _salmon,
  _muttonBiryani,
  _fishfry,
  _chickenfry
];

// Restaurants
final _restaurant0 = Restaurant(
    imageUrl: 'assets/images/restaurant0.jpg',
    name: 'Grab n Bite',
    address: '200 Main St, New York, NY',
    rating: 5,
    menu: [
      _burrito,
      _pasta,
      _ramen,
      _pancakes,
      _burger,
      _pizza,
      _salmon,
      _subwayburger
    ],
    distance: 5);
final _restaurant1 = Restaurant(
  imageUrl: 'assets/images/restaurant1.jpg',
  name: 'Royal Quisine',
  address: '200 Main St, New York, NY',
  rating: 4,
  menu: [_steak, _muttonBiryani, _muttoncurry, _tandoorimutton],
  distance: 2,
);
final _restaurant2 = Restaurant(
    imageUrl: 'assets/images/restaurant2.jpg',
    name: 'XinXia Chinese',
    address: '200 Main St, New York, NY',
    rating: 4,
    menu: [_dumpling, _noodles, _pronfriedrice, _fishfry],
    distance: 1);
final _restaurant3 = Restaurant(
    imageUrl: 'assets/images/restaurant3.jpg',
    name: 'Armani FastFood',
    address: '200 Main St, New York, NY',
    rating: 4,
    menu: [
      _burrito,
      _steak,
      _burger,
      _pizza,
      _salmon,
      _subwayburger,
      _frenchfry
    ],
    distance: 2.3);
final _restaurant4 = Restaurant(
    imageUrl: 'assets/images/restaurant4.jpg',
    name: 'Food Care Plus',
    address: '200 Main St, New York, NY',
    rating: 3,
    menu: [_muttoncurry, _muttonBiryani, _fishfry, _chickenfry, _chickenbbq],
    distance: 3.3);

final List<Restaurant> restaurants = [
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4,
];

// User
final currentUser = User(
  name: 'Jane Smith',
  orders: [
    Order(
      date: 'Nov 7, 2021',
      food: _ramen,
      restaurant: _restaurant2,
      quantity: 1,
      totalprice: _ramen.price!,
    ),
    Order(
      date: 'Nov 7, 2021',
      food: _frenchfry,
      restaurant: _restaurant2,
      quantity: 1,
      totalprice: _frenchfry.price!,
    ),
    Order(
      date: 'Nov 7, 2021',
      food: _fishfry,
      restaurant: _restaurant2,
      quantity: 1,
      totalprice: _fishfry.price!,
    ),
    Order(
      date: 'Nov 7, 2021',
      food: _fishandchips,
      restaurant: _restaurant2,
      quantity: 1,
      totalprice: _fishandchips.price!,
    ),
    Order(
      date: 'Nov 8, 2019',
      food: _dumpling,
      restaurant: _restaurant0,
      quantity: 3,
      totalprice: _dumpling.price! * 3,
    ),
    Order(
      date: 'Nov 5, 2019',
      food: _burrito,
      restaurant: _restaurant1,
      quantity: 2,
      totalprice: 55.0,
    ),
    Order(
      date: 'Nov 2, 2019',
      food: _salmon,
      restaurant: _restaurant3,
      quantity: 1,
      totalprice: 33.0,
    ),
    Order(
      date: 'Nov 1, 2019',
      food: _pancakes,
      restaurant: _restaurant4,
      quantity: 1,
      totalprice: 77.0,
    ),
  ],
  cart: [
    Order(
      date: 'Nov 11, 2019',
      food: _burger,
      restaurant: _restaurant2,
      quantity: 2,
      totalprice: 47.0,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _pasta,
      restaurant: _restaurant2,
      quantity: 1,
      totalprice: 17.0,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _salmon,
      restaurant: _restaurant3,
      quantity: 1,
      totalprice: 17.0,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _pancakes,
      restaurant: _restaurant4,
      quantity: 3,
      totalprice: 17.0,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _burrito,
      restaurant: _restaurant1,
      quantity: 2,
      totalprice: 17.0,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _muttonBiryani,
      restaurant: _restaurant2,
      quantity: 1,
      totalprice: _muttonBiryani.price!,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _muttoncurry,
      restaurant: _restaurant3,
      quantity: 1,
      totalprice: _muttoncurry.price!,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _subwayburger,
      restaurant: _restaurant4,
      quantity: 3,
      totalprice: _subwayburger.price!,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _chickenbbq,
      restaurant: _restaurant1,
      quantity: 2,
      totalprice: _chickenbbq.price!,
    ),
  ],
);
