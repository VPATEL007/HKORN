import 'package:flutter/material.dart';
import 'package:hkorn_new/ui/gallery/gallery_viewmodel.dart';
import 'package:hkorn_new/ui/shared/base_appbar.dart';
import 'package:hkorn_new/ui/shared/base_colors.dart';
import 'package:hkorn_new/ui/shared/widgets/news_tile.dart';
import 'package:hkorn_new/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GalleryViewModel>.reactive(
        viewModelBuilder: () => GalleryViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: BaseAppbar(
              context: context,
              title: "Gallery",
            ),
            body: model.isBusy
                ? loadingSpinnerWidget
                : ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: model.galleryItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return model.galleryItems[index].featureImage != null
                          ? NewsTile(
                              categories:
                                  model.galleryItems[index].categories ?? [],
                              context: context,
                              title: model.galleryItems[index].galleryTitle
                                  .toString(),
                              url: model.galleryItems[index].featureImage ?? '',
                              newsTap: () => model.openPhoto(
                                  model.galleryItems[index],
                                  model.galleryItems[index].galleryTitle
                                      .toString(),
                                  model.galleryItems[index].galleryImages ??
                                      []),
                              noteTap: () {})
                          : const SizedBox();
                    },
                  )));
  }
}
