import 'package:flutter/material.dart';
import 'package:online_course_app_ui/notifer/course_category_change_notifer.dart';
import 'package:online_course_app_ui/screens/home/widgets/category_list.dart';
import 'package:online_course_app_ui/screens/home/widgets/course_list.dart';
import 'package:provider/provider.dart';

class CategoryCourseList extends StatelessWidget {
  const CategoryCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CourseCategoryChangeNotifer(),
      child: Column(
        children: const [
          CategoryList(),
          SizedBox(height:10),// This will show the category list
          CourseList(),    // This will show the course list based on the selected category
        ],
      ),
    );
  }
}
