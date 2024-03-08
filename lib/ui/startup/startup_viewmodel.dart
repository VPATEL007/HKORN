import 'package:flutter/cupertino.dart';
import 'package:hkorn_new/app/app.locator.dart';
import 'package:hkorn_new/service/shared_pref_service.dart';
import 'package:hkorn_new/ui/main/main_view.dart';
import 'package:hkorn_new/ui/signin/signin_view.dart';
import 'package:stacked/stacked.dart';

class StartUpViewModel extends FutureViewModel {
  final _sharedService = locator<SharedPrefService>();
  Widget widget = Container();
  Map storedData = {};

  @override
  void onData(data) {
    super.onData(data);
    setBusy(true);
    if (data != null &&
        data['email'] != 'defaultValue' &&
        data['password'] != 'defaultValue') {
      widget = const MainView();
    } else {
      widget = const SignInView();
    }
    setBusy(false);
  }

  @override
  Future futureToRun() {
    return _sharedService.getStoredData();
  }
}
