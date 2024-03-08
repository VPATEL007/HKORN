import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hkorn_new/ui/shared/widgets/spinner.dart';

class BaseImage extends StatefulWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const BaseImage(
      {Key? key, required this.url, this.height, this.width, this.fit})
      : super(key: key);

  @override
  State<BaseImage> createState() => _BaseImageState();
}

class _BaseImageState extends State<BaseImage> {
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget.url,
      width: widget.width,
      height: widget.height,
      fit: BoxFit.contain,
      cache: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Center(child: loadingSpinnerWidget);

          case LoadState.completed:
            return ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    fit: widget.fit ?? BoxFit.contain,
                    image: state.imageWidget.image,
                  ),
                ),
              ),
            );
          case LoadState.failed:
            return GestureDetector(
              child: const Icon(Icons.error),
              onTap: () {
                state.reLoadImage();
              },
            );
        }
      },
    );
  }
}
