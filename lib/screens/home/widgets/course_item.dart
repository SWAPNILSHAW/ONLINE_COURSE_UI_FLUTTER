import 'package:flutter/material.dart';
import 'package:online_course_app_ui/arguments/course_arguments.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/model/course.dart';
import 'package:online_course_app_ui/util/route_names.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: () {
              // here on click of course we will open course details screen
              Navigator.pushNamed(context, RouteNames.courseDetails,
                  arguments: CourseArguments(course));
            },
            child: Column(
              children: [
                Image.asset(
                  course.thumbnailUrl,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.person, color: kBlueColor),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              course.createdBy,
                              style: TextStyle(fontSize: 12, color: kBlueColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      Text(
                        '\$${course.price}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
