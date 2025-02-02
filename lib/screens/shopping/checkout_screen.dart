import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/data_provider/shopping_cart_data_provider.dart';
import 'package:online_course_app_ui/model/my_course_data_provider.dart';
import 'package:online_course_app_ui/screens/shopping/widget/payment_method.dart';
import 'package:online_course_app_ui/util/route_names.dart';

import '../../model/course.dart';
import '../../util/util.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen(
      {super.key, required this.courseList, required this.totalPrice});

  final List<Course> courseList;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Screen'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Billing Address',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.shade900),
                ),
                const SizedBox(
                  height: 10,
                ),
                // we will be show country , state & city in billing address
                // to show the dropdowns for that , i am using csc_picker: ^0.2.7 package
                // we need to start the app to load assets from the package
                // i can selected state & city of respective country
                CSCPicker(
                  layout: Layout.vertical,
                  flagState: CountryFlag.DISABLE,
                  onCountryChanged: (value) {},
                  onStateChanged: (value) {},
                  onCityChanged: (value) {},
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Payment Option',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.shade900),
                ),
                const SizedBox(
                  height: 10,
                ),
                // lets create widget for payment method
                const PaymentMethod(),

                const SizedBox(
                  height: 10,
                ),
                // now lets show course list for final order confirmation
                Text(
                  'Order',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.shade900),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: courseList.length,
                        itemBuilder: (context, index) {
                          Course course = courseList[index];
                          return ListTile(
                            leading: Image.asset(
                              course.thumbnailUrl,
                              width: 50,
                              height: 50,
                            ),
                            title: Text(
                              course.title,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            trailing: Text('\$${course.price}'),
                          );
                        }))
              ],
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${totalPrice}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900),
                  ),
                  ElevatedButton(onPressed: (){
                    // here  we will clear items from shopping cart list and add in users my course list to place the order
                   // In this code i am not going to cover transactions
                    // so lets add data provider for my user courses
                    // first of all lets define model class for user's courses which will keep course details as well as course progress
                    MyCourseDataProvider.addAllCourse(courseList);
                    // Lets clear shopping cart
                    ShoppingCartDataProvider.clearCart();
                    //This would be different with actual backend integrated app
                    // here we don't have backend , so i am doing this way/
                    //Now lets show order placed message
                    Util.showMessage(context, 'Your order is placed successfully');
                    // Navigate to home screen
                    Navigator.pushNamed(context, RouteNames.myHomeScreen);
                  },
                      style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                      child: Text('Place Order',style: TextStyle(fontSize: 20),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
