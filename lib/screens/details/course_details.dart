import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/data_provider/shopping_cart_data_provider.dart';
import 'package:online_course_app_ui/model/section.dart';
import 'package:online_course_app_ui/screens/details/widget/favourite_option.dart';
import 'package:online_course_app_ui/util/util.dart';
import 'package:readmore/readmore.dart';

import '../../arguments/checkout_argument.dart';
import '../../model/course.dart';
import '../../util/route_names.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    var greyTextStyle = TextStyle(fontSize: 15, color: Colors.grey.shade600);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.share,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Util.openShoppingCart(context);
                                  },
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(course.thumbnailUrl)),
                            const Column(
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  size: 90,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Prebiew this course',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.title,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800),
                            ),
                            const SizedBox(
                              // Added comma here
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: kPrimaryColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      course.createdBy,
                                      style: const TextStyle(
                                          fontSize: 16, color: kPrimaryColor),
                                    )
                                  ],
                                ),
                                // now lets show favourite option
                                // for that lets create new widget
                                FavoriteOption(course: course),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.play_circle_outline),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${course.lessonNo} Lessons',
                                      style: greyTextStyle,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      course.duration,
                                      style: greyTextStyle,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${course.rate}',
                                      style: greyTextStyle,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ReadMoreText(
                              course.description,
                              trimLines: 2,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              moreStyle: const TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Course Content',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  '${course.sections.length} Sections',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey.shade700),
                                )
                              ],
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: course.sections.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return buildCourseContent(index);
                                })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${course.price}',
                        style: TextStyle(
                            fontSize: 30, color: Colors.grey.shade900),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                String message =
                                    'Course is already added into cart';
                                if (!ShoppingCartDataProvider
                                    .shoppingCartDataList
                                    .contains(course)) {
                                  message = 'Course is added into cart';
                                  ShoppingCartDataProvider.addCourse(course);
                                }
                                // Lets show message in snackbar , so lets create snackbar utility method folder
                                Util.showMessageWithAction(
                                    context, message, 'View', () {
                                  // lets open shopping Cart list here
                                  Util.openShoppingCart(context);
                                });
                                // Now lets create shopping cart list screen
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor),
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(fontSize: 20),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                // on click of button , lets show checkout screen to buy single course
                                Navigator.pushNamed(
                                    context, RouteNames.checkout,
                                    arguments: CheckoutArgument([course],course.price));
                                // lets select another course as this course is already purchase and buy this new course using buy button
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor),
                              child: const Text(
                                'Buy',
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        // so far we have shown details of course but now we need to show course price
        // and check button
      ),
    );
  }

  // lets write method to build course content
  Widget buildCourseContent(int index) {
    Section section = course.sections[index];
    return ExpansionTile(
      title: Text(
        'Section ${index + 1} - ${section.name}',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: section.lectures.map((lecture) {
        return ListTile(
          dense: true,
          onTap: () {},
          leading: const SizedBox(),
          title: Text(lecture.name),
          subtitle: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.access_time,
                size: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                lecture.duration,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
