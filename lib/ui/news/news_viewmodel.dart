import 'package:hkorn_new/app/app.locator.dart';
import 'package:hkorn_new/app/app.router.dart';
import 'package:hkorn_new/model/news_list.dart';
import 'package:hkorn_new/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewsViewModel extends FutureViewModel<List<NewsModel>?> {
  final _navService = locator<NavigationService>();
  final _userService = locator<UserService>();

  List<NewsModel> newsList = [];

  openNote() {}

  openNews(int newsId) {
    _navService.navigateTo(Routes.newsDetailView,
        arguments: NewsDetailViewArguments(newsId: newsId));
  }

  @override
  void onData(List<NewsModel>? data) {
    super.onData(data);
    if (data != null) {
      newsList.addAll(data);
    }
  }

  @override
  Future<List<NewsModel>?> futureToRun() {
    return _userService.getNews();
  }
}
