import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';

import '../util/util.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      onPressed: () {
        // we will opend shoping cart screen
        Util.openShoppingCart(context);

      },
      child: const Icon(Icons.shopping_cart),
    );
  }
}
