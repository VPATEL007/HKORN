import 'package:hkorn_new/app/app.locator.dart';
import 'package:hkorn_new/model/council_memebers_model.dart';
import 'package:hkorn_new/service/user_service.dart';
import 'package:stacked/stacked.dart';

class MembersViewModel extends FutureViewModel<List<CouncilAllMemberModel>?> {
  final _userService = locator<UserService>();

  List<CouncilAllMemberModel> councilMembers = [];

  @override
  void onData(List<CouncilAllMemberModel>? data) {
    super.onData(data);
    if (data != null) {
      councilMembers.addAll(data);
    }
  }

  @override
  Future<List<CouncilAllMemberModel>?> futureToRun() {
    return _userService.getCouncilAllMemberDetails();
  }
}
