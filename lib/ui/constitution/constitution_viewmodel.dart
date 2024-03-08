import 'package:hkorn_new/app/app.locator.dart';
import 'package:hkorn_new/model/constituion_model.dart';
import 'package:hkorn_new/service/user_service.dart';
import 'package:stacked/stacked.dart';

class ConstitutionViewModel extends FutureViewModel {
  final _userService = locator<UserService>();

  List<ConstitutionModel> coursed = [];
  List<ConstitutionModel> reverseConstitutionList = [];

  @override
  void onData(data) {
    super.onData(data);
    if (data != null) {
      coursed.addAll(data);
      reverseConstitutionList = coursed.reversed.toList();
    }
  }

  @override
  Future futureToRun() {
    return _userService.getConstitutionDetails();
  }
}
