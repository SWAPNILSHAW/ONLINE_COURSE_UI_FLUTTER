import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/model/course_category.dart';
import 'package:online_course_app_ui/notifer/course_category_change_notifer.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the selected category inside the build method
    var category = Provider.of<CourseCategoryChangeNotifer>(context).category;
// lets use this category to highlight selected category
    // Now we have highlighted selected category, let change course list based on category
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // Display the list in a horizontal list
        SizedBox(
          height: 35,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: CourseCategory.values.length,
              itemBuilder: (context, index) {
                CourseCategory courseCategory = CourseCategory.values[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      Provider.of<CourseCategoryChangeNotifer>(context,
                              listen: false)
                          .changeCategory(courseCategory);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: category == courseCategory? kPrimaryColor: Colors.white,
                        border: Border.all(color: Colors.grey.shade900),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          courseCategory.title,
                          style: TextStyle(
                            fontSize: 15,
                            color:category == courseCategory? Colors.white: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        // Category list is shown, and course list can be displayed as per the selected category.
      ],
    );
  }
}
