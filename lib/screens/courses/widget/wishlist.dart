import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/data_provider/course_data_provider.dart';

import '../../../model/course.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    List<Course> courseList = getCourseList(context);
    return ListView.builder(
        shrinkWrap: true,
        itemCount: courseList.length,
        itemBuilder: (context, index) {
          Course course = courseList[index];
          // lets create another function to create list item & call here
          return getListItem(course);
        });
  }

  //lets create function to filter list based on isFavorite flag
  List<Course> getCourseList(BuildContext constex) {
    return CourseDataProvider.courseList
        .where((course) => course.isFavorite)
        .toList();
  }

  Widget getListItem(Course course) {
    return Card(
      child: ListTile(
        leading: Image.asset(course.thumbnailUrl),
        title: Text(
          course.title,
          style: TextStyle(fontSize: 17, color: Colors.grey.shade900),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'By ${course.createdBy}',
              style: const TextStyle(color: kBlueColor, fontSize: 13),
            ),
            Row(
              children: [
                Text(
                  course.duration,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                  child: Container(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                 '${course.lessonNo} lesson',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                  child: Container(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    const Icon(Icons.star,color: Colors.yellow,),
                    const SizedBox(width: 10,),
                    Text('${course.rate}'),
                  ],
                ),

              ],
            ),
            Row(
              children: [
                Text('\$${course.price}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey.shade800),),
                const  SizedBox( width: 20,),
                InkWell(
                  onTap: (){
                    setState(() {
                      course.isFavorite=false;
                    });
                  },
                    child: const Icon(Icons.delete)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
