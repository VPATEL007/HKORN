import 'package:hkorn_new/app/app.locator.dart';
import 'package:hkorn_new/model/council_memebers_model.dart';
import 'package:hkorn_new/service/user_service.dart';
import 'package:stacked/stacked.dart';

class CouncilMembersViewModel
    extends FutureViewModel<List<CouncilMemberAboutModel>?> {
  final _userService = locator<UserService>();

  List<CouncilMemberAboutModel> councilMembers = [];

  @override
  void onData(List<CouncilMemberAboutModel>? data) {
    super.onData(data);
    if (data != null) {
      councilMembers.addAll(data);
    }
  }

  @override
  Future<List<CouncilMemberAboutModel>?> futureToRun() {
    return _userService.getCouncilMemberDetails();
  }
}
