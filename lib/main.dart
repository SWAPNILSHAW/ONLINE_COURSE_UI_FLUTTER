import 'package:flutter/material.dart';
import 'package:online_course_app_ui/notifer/course_category_change_notifer.dart';
import 'package:online_course_app_ui/screens/courses/my_course_screen.dart';
import 'package:online_course_app_ui/screens/courses/wishlist_screnn.dart';
import 'package:online_course_app_ui/screens/details/course_details.dart';
import 'package:online_course_app_ui/screens/home/home_screen.dart';
import 'package:online_course_app_ui/screens/intro/intro_screen.dart';
import 'package:online_course_app_ui/screens/shopping/checkout_screen.dart';
import 'package:online_course_app_ui/screens/shopping/shopping_cart_screen.dart';
import 'package:online_course_app_ui/util/route_names.dart';
import 'package:provider/provider.dart';
import 'arguments/checkout_argument.dart';
import 'arguments/course_arguments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CourseCategoryChangeNotifer(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          RouteNames.intro: (context) => const IntroScreen(),
          RouteNames.myHomeScreen: (context) => const MyHomeScreen(),
          RouteNames.shoppingCart: (context) => const ShoppingCartScreen(),
          RouteNames.myCourseScreen: (context) => const MyCourseScreen(),
          RouteNames.wishlist: (context) => const WishlistScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == RouteNames.courseDetails) {
            final args = settings.arguments as CourseArguments;
            return MaterialPageRoute(
              builder: (context) => CourseDetails(course: args.course),
            );
          } else if (settings.name == RouteNames.checkout) {
            // lets create  checkout argument to pass the data to checkout screen
            final args = settings.arguments as CheckoutArgument;
            return MaterialPageRoute(
                builder: (context) => CheckoutScreen(
                    courseList: args.courseList, totalPrice: args.totalPrice));
          }
        },
      ),
    );
  }
}
