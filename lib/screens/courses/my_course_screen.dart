import 'package:flutter/material.dart';
import 'package:online_course_app_ui/components/bottom_option.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/model/my_course.dart';
import 'package:online_course_app_ui/model/my_course_data_provider.dart';
import 'package:online_course_app_ui/screens/shopping/shopping_cart_screen.dart';

import '../../components/shopping_cart.dart';

class MyCourseScreen extends StatelessWidget {
  const MyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MyCourse> myCourseList = MyCourseDataProvider.myCourse;

    if (myCourseList.length > 1) {
      myCourseList[1].progress = 50;
    }
    if (myCourseList.length > 2) {
      myCourseList[2].progress = 20;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "My Course",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(color: Colors.grey.shade900),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'All Courses',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(color: Colors.grey.shade900),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Downloaded Courses'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(color: Colors.grey.shade900),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Archived Courses'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: myCourseList.length,
                      itemBuilder: (context, index) {
                        MyCourse myCourse = myCourseList[index];
                        return getMyCourse(myCourse, context);
                      })),
            ],
          ),
        ),
      ),
      // Conditionally show/hide the floating action button
      floatingActionButton: const ShoppingCart(), // No shopping cart button on this page
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomOption(selectedIndex: 2),
    );
  }

  Widget getMyCourse(MyCourse myCourse, BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(myCourse.course.thumbnailUrl),
        title: Text(
          myCourse.course.title,
          maxLines: 2,
          style: TextStyle(fontSize: 17, color: Colors.grey.shade800),
        ),
        subtitle: Column(
          children: [
            Text(
              myCourse.course.createdBy,
              style: TextStyle(color: Colors.grey.shade50),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
                visible: myCourse.progress > 0,
                replacement: const Text(
                  'Start Course',
                  style: TextStyle(color: kPrimaryColor),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 3,
                          thumbColor: Colors.transparent,
                          overlayShape: SliderComponentShape.noThumb,
                          thumbShape: SliderComponentShape.noThumb,
                        ),
                        child: Slider(
                            min: 0,
                            max: 100,
                            value: myCourse.progress.toDouble(),
                            onChanged: (val) {}),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('${myCourse.progress}%')
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
