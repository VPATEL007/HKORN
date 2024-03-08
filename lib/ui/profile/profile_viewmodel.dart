import 'package:hkorn_new/app/app.locator.dart';
import 'package:hkorn_new/app/app.router.dart';
import 'package:hkorn_new/model/user_model.dart';
import 'package:hkorn_new/service/auth_service.dart';
import 'package:hkorn_new/service/shared_pref_service.dart';
import 'package:hkorn_new/util/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends FutureViewModel<UserModel?> {
  final _navService = locator<NavigationService>();
  final _sharedService = locator<SharedPrefService>();
  final _authService = locator<AuthService>();
  UserModel? userModel;

  logout() async {
    await _sharedService.clearStored();
    _navService.clearStackAndShow(Routes.startUpView);
  }

  @override
  void onData(UserModel? data) {
    super.onData(data);
    if (data != null) {
      userModel = data;
      logger.d(userModel!.toMap());
      notifyListeners();
    }
  }

  @override
  Future<UserModel?> futureToRun() {
    return _authService.getUserInfo();
  }

  openCourse() {
    _navService.navigateTo(Routes.courseView);
  }

  openAccountSetting() {
    _navService.navigateTo(Routes.accountSettingView);
  }

  openForums() {
    _navService.navigateTo(Routes.forumsView);
  }

  openGroups() {
    _navService.navigateTo(Routes.groupView);
  }

  openPhotos() {
    _navService.navigateTo(Routes.galleryView);
  }

  openNotications() {
    _navService.navigateTo(Routes.notificationView);
  }
}
