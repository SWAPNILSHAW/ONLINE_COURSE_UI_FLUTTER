import 'package:flutter/material.dart';
import 'package:online_course_app_ui/components/bottom_option.dart';
import 'package:online_course_app_ui/components/shopping_cart.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/screens/home/widgets/category_course_list.dart';
import 'package:online_course_app_ui/screens/home/widgets/course_search.dart';
import 'package:online_course_app_ui/screens/home/widgets/featured_cousreds.dart';
import 'package:online_course_app_ui/screens/home/widgets/header.dart';
import 'package:online_course_app_ui/screens/home/widgets/offers.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});


  /*Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get available height and width from the LayoutBuilder constraints
          double availableHeight = constraints.maxHeight;
          double availableWidth = constraints.maxWidth;

          // Define dynamic height for the header container
          double headerHeight = availableHeight *
              0.20; // Set the header to 25% of the screen height
          // double headerHeight = availableHeight * 0.25; // Set the header to 25% of the screen height

          return Column(
            children: [
              // Header with dynamic height adjustment
              SingleChildScrollView(
                child: Container(
                  height: headerHeight, // Use the dynamically calculated height
                  width:
                      availableWidth, // Set width to be the full width of the screen
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Column(
                      children: const [
                        SizedBox(height: 10),
                        Header(),
                        SizedBox(height: 10),
                        CourseSearch(),
                      ],
                    ),
                  ),
                ),
              ),

              // Show offers with a small space
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Offers(),
                    SizedBox(height: 10,),
                    // so far we have create d header & shown offer with automatically moving
                    // now lets show features cousres
                    FeaturedCousreds(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

*/

   @override
Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
  final screenWidth = MediaQuery.of(context).size.width;

  //double headerHeight = screenHeight * 0.20;
  double headerHeight = screenWidth > screenHeight
      ? screenHeight * 0.45 // Landscape mode
      : screenHeight * 0.23; // Portrait mode

  return Scaffold(
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double availableHeight = constraints.maxHeight;
          double availableWidth = constraints.maxWidth;

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: headerHeight,
                  width: availableWidth,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Column(
                      children: const [
                        SizedBox(height: 10),
                        Header(),
                        SizedBox(height: 10),
                        Expanded(child: Center(child: CourseSearch())),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Offers(),
                      SizedBox(height: 10),
                       FeaturedCousreds(),
                       CategoryCourseList(),
                     // SizedBox( height: 10,),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
    floatingActionButton: ShoppingCart(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomOption(
      selectedIndex: 1,
    ),
  );
}}
