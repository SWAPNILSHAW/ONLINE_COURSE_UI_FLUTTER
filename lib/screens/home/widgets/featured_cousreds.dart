import 'package:flutter/material.dart';
import 'package:online_course_app_ui/data_provider/course_data_provider.dart';
import 'package:online_course_app_ui/screens/home/widgets/category_list.dart';
import 'package:online_course_app_ui/screens/home/widgets/course_item.dart';

import '../../../model/course.dart';

class FeaturedCousreds extends StatelessWidget {
  const FeaturedCousreds({super.key});
// lets create sample data for featured product
  // the sample data is in course_data_provider.dart file
  // lets create featured course list from the course list

  @override
  Widget build(BuildContext context) {
    // now lets use this list
    List<Course> featuredCourseList = [
      CourseDataProvider.courseList[9],
      CourseDataProvider.courseList[0],
      CourseDataProvider.courseList[1],
      CourseDataProvider.courseList[2],
      CourseDataProvider.courseList[10],
      CourseDataProvider.courseList[5],
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Courses',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800),
            ),
            InkWell(
                onTap: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // lets show featured courses in horizontal listview
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredCourseList.length,
              itemBuilder: (context, index) {
              Course course = featuredCourseList[index];
              // lets create separate widget to show course details
                // we will be using same widget  for other features too
              // so far we have shown features  course. Now let show category list
                return CourseItem(course: course);
              }),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
