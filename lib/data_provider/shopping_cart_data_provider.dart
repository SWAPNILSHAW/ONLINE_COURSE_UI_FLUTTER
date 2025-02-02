import '../model/course.dart';

class ShoppingCartDataProvider {
  static final List<Course> _shoppingCartDataList = [];
  static List<Course> get shoppingCartDataList => _shoppingCartDataList;
  static void addCourse(Course course) {
    _shoppingCartDataList.add(course);
  }

  static void addAllCourse(List<Course> courses) {
    _shoppingCartDataList.addAll(courses);
  }

  static void clearCart() {
    _shoppingCartDataList.clear();
  }

  static void deleteCourse(Course course) {
    _shoppingCartDataList.remove(course);
  }
}
