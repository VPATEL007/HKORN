import 'package:hkorn_new/app/app.locator.dart';
import 'package:hkorn_new/app/app.router.dart';
import 'package:hkorn_new/model/course_model.dart';
import 'package:hkorn_new/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseViewModel extends FutureViewModel {
  final _userService = locator<UserService>();
  final _navService = locator<NavigationService>();

  openCourseView(String courseId) {
    _navService.navigateTo(Routes.courseDetailView,
        arguments: CourseDetailViewArguments(courseId: courseId));
  }

  List<CourseModel> coursed = [];

  @override
  void onData(data) {
    super.onData(data);
    if (data != null) {
      coursed.addAll(data);
    }
  }

  @override
  Future futureToRun() {
    return _userService.getCourses();
  }
}
