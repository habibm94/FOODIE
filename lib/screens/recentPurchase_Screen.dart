import 'package:flutter/material.dart';
class RecentPurchaseScreen extends StatefulWidget {
  const RecentPurchaseScreen({Key? key}) : super(key: key);

  @override
  State<RecentPurchaseScreen> createState() => _RecentPurchaseScreenState();
}

class _RecentPurchaseScreenState extends State<RecentPurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Recent Orders',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
