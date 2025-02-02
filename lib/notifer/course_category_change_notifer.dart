import 'package:flutter/material.dart';

import '../model/course_category.dart';

class CourseCategoryChangeNotifer extends ChangeNotifier {
  CourseCategory _category= CourseCategory.all;
  CourseCategory get category => _category;
  void changeCategory(CourseCategory category){
    _category = category;
    notifyListeners();
  }

}
