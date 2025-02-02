import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/util/route_names.dart';

class BottomOption extends StatelessWidget {
  const BottomOption({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: InkWell(
                onTap: () {
                  // on click of this option we will open respective screen
               openScreen(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home,
                        color: getSelectedColor(1),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Home',
                        style:
                            TextStyle(fontSize: 13, color: getSelectedColor(1)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  // on click of this option we will open respective screen
                  openScreen(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.play_circle_outlined,
                        color: getSelectedColor(2),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'My Courses',
                        style:
                            TextStyle(fontSize: 13, color: getSelectedColor(2)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  // on click of this option we will open respective screen
                  openScreen(context, 3);

                },
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: getSelectedColor(3),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'WishList',
                        style:
                            TextStyle(fontSize: 13, color: getSelectedColor(3)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  // on click of this option we will open respective screen
                  openScreen(context, 4);

                },
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.people,
                        color: getSelectedColor(4),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Account',
                        style:
                            TextStyle(fontSize: 13, color: getSelectedColor(4)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getSelectedColor(int optionIndex) {
    return (selectedIndex == optionIndex)
        ? kPrimaryColor
        : Colors.grey.shade800;
  }

  void openScreen(BuildContext context, int selectedOptionNo) {
    String routeName = RouteNames.myHomeScreen; // Default route for 'Home'
    switch (selectedOptionNo) {
      case 2:
        routeName = RouteNames.myCourseScreen;
        break;
      case 3:
        routeName = RouteNames.wishlist;
        break;
      /*case 4:
        routeName = RouteNames.accountScreen; // Add the route for the 'Account' screen
        break;*/
    }
    Navigator.pushReplacementNamed(context, routeName);
  }

}
