import 'package:flutter/material.dart';
import 'package:online_course_app_ui/arguments/checkout_argument.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/data_provider/shopping_cart_data_provider.dart';
import 'package:online_course_app_ui/util/route_names.dart';

import '../../model/course.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    double totalAmount = calculatetotal();
    List<Course> cartCourseList = ShoppingCartDataProvider.shoppingCartDataList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        'total :',
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade700),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '\$$totalAmount',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Promotion',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 300,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Promo code',
                              filled: true,
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                              ),
                              child: Text('Apply')),
                        ),
                      ],
                    ),
                    Text(
                      '${cartCourseList.length} Courses in List',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: cartCourseList.length,
                      itemBuilder: (context, index) {
                        return createShoppingCartItem(index);
                      }),
                ),
              ],
            ),
            // Inside stack lets add container at bottom to show total checkout button to
            // open place order screen
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
              child: ElevatedButton(
                  onPressed: () {
                    //lets open checkout screen from this button
                    Navigator.pushNamed(context, RouteNames.checkout,
                        arguments:
                            CheckoutArgument(cartCourseList, totalAmount));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Text(
                      'Checkout',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  // Now our shopping cart is done lets create checkout screen

  // get total amount of cart items
  double calculatetotal() {
    return ShoppingCartDataProvider.shoppingCartDataList
        .fold(0, (old, course) => old + course.price);
  }

  // lets create function to create  shopping cart item we will call this function from ListView
  Widget createShoppingCartItem(int index) {
    Course course = ShoppingCartDataProvider.shoppingCartDataList[index];
    return Card(
      child: ListTile(
        leading: Image.asset(course.thumbnailUrl),
        title: Text(
          course.title,
          maxLines: 2,
          style: TextStyle(fontSize: 17, color: Colors.grey.shade800),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "by${course.createdBy}",
              style: TextStyle(color: kBlueColor, fontSize: 13),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  course.duration,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                  child: Container(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${course.lessonNo} Lesson',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                ),
              ],
            )
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${course.price}'),
            InkWell(
                onTap: () {
                  setState(() {
                    ShoppingCartDataProvider.deleteCourse(course);
                  });
                },
                child: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
