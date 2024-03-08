import 'package:hkorn_new/app/app.locator.dart';
import 'package:hkorn_new/app/app.router.dart';
import 'package:hkorn_new/model/gallery.dart';
import 'package:hkorn_new/service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CollectionListingViewModel extends FutureViewModel<GalleryModel> {
  final _navService = locator<NavigationService>();
  final _userService = locator<UserService>();

  GalleryModel? galleryItems;
  final GalleryModel galleryImage;
  final String? title;

  CollectionListingViewModel(this.galleryImage, this.title);
  openPhoto(String photos, String photoTitle) {
    // _navService.navigateTo(Routes.photoDetailView,
    //     arguments: PhotoDetailViewArguments(photoTitle, photo: photos));
  }

  @override
  void onData(GalleryModel? data) {
    super.onData(data);
    if (data != null) {
      galleryItems = data;
    }
  }

  @override
  Future<GalleryModel> futureToRun() {
    return _userService.getCollectionListning(galleryImage);
  }
}
