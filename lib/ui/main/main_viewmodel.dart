import 'package:flutter/cupertino.dart';
import 'package:hkorn_new/ui/home/home_view.dart';
import 'package:hkorn_new/ui/profile/profile_view.dart';
import 'package:hkorn_new/ui/search/search_view.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  int currentIndex = 0;

  List<Widget> pages = const [
    HomeView(),
    SearchView(),
    // CartView(),
    // MessageView(),
    ProfileView()
  ];

  void onTap(int index) async {
    currentIndex = index;
    notifyListeners();
  }
}
