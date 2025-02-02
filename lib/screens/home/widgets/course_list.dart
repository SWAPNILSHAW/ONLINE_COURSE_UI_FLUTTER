import 'package:flutter/material.dart';
import 'package:online_course_app_ui/data_provider/course_data_provider.dart';
import 'package:online_course_app_ui/model/course.dart';
import 'package:online_course_app_ui/model/course_category.dart';
import 'package:online_course_app_ui/notifer/course_category_change_notifer.dart';
import 'package:online_course_app_ui/screens/home/widgets/course_item.dart';
import 'package:provider/provider.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});
// now change the course list based on the selected category
  // for that we will be using provider pattern
  // lets add provider package dependency in pubspec.yaml file
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the aspect ratio based on the available width
        double itemWidth =
            (constraints.maxWidth / 2) - 20; // 2 columns with padding
        double itemHeight = itemWidth + 20; // Adjust height by 20 pixels
        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          childAspectRatio: itemWidth / itemHeight, // Adjust aspect ratio
          children: getCourseList(context).map((course) {
            return CourseItem(course: course);
          }).toList(),
        );
      },
    );
  }

  List<Course> getCourseList(BuildContext context) {
    // lets get selected category using provider
    var category = Provider.of<CourseCategoryChangeNotifer>(context).category;

    if( category == CourseCategory.all){
      return CourseDataProvider.courseList;
    }
    return CourseDataProvider.courseList
        .where((course) => course.courseCategory == category)
        .toList();
  }
}
