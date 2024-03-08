import 'package:hkorn_new/app/app.locator.dart';
import 'package:hkorn_new/app/app.router.dart';
import 'package:hkorn_new/model/photo_model.dart';
import 'package:hkorn_new/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PhotoPageViewModel extends FutureViewModel<List<PhotoModel>?> {
  final _userService = locator<UserService>();
  final _navService = locator<NavigationService>();
  int currentIndex = 0;

  List<PhotoModel> photoList = [];

  openPhotoDetail(int photoId) {
    _navService.navigateTo(Routes.photoDetailView,
        arguments: PhotoDetailViewArguments('', photo: []));
  }

  void onTap(int index) async {
    currentIndex = index;
    notifyListeners();
  }

  @override
  void onData(List<PhotoModel>? data) {
    super.onData(data);
    if (data != null) {
      photoList.addAll(data);
    }
  }

  @override
  Future<List<PhotoModel>?> futureToRun() {
    return _userService.getPhotoDetail();
  }
}
