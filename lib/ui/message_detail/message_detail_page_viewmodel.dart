import 'package:hkorn_new/app/app.locator.dart';
import 'package:hkorn_new/service/user_service.dart';
import 'package:stacked/stacked.dart';

class MessageDetailViewModel extends FutureViewModel {
  final _userService = locator<UserService>();

  @override
  void onData(data) {
    super.onData(data);
  }

  @override
  Future futureToRun() {
    return _userService.getUserMessageList();
  }
}
