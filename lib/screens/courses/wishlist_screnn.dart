import 'package:flutter/material.dart';
import 'package:online_course_app_ui/screens/courses/widget/wishlist.dart';
import 'package:online_course_app_ui/screens/shopping/shopping_cart_screen.dart';

import '../../components/bottom_option.dart';
import '../../components/shopping_cart.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'WsihList',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900),
              ),
            ),
            const SizedBox(height: 10,),
            // lest show wishlist here, so create new widget for this
            const Wishlist(),
          ],
        ),
      )),
      floatingActionButton: const ShoppingCart(), // No shopping cart button on this page
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomOption(selectedIndex: 3),
    );
  }
}
