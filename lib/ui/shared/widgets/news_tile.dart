import 'package:flutter/material.dart';
import 'package:hkorn_new/model/gallery.dart';
import 'package:hkorn_new/ui/shared/base_colors.dart';
import 'package:hkorn_new/ui/shared/base_fonts.dart';
import 'package:hkorn_new/ui/shared/base_image.dart';
import 'package:hkorn_new/ui/shared/widgets/bubble.dart';
import 'package:ui_helper/ui_helper.dart';

class NewsTile extends StatelessWidget {
  final BuildContext context;
  final String url;
  final Function()? newsTap;
  final Function()? noteTap;
  final String boxOneText;
  final String boxTwoText;
  final String title;
  final List<Category>? categories;

  const NewsTile(
      {Key? key,
      required this.context,
      required this.url,
      this.boxTwoText = 'Notes',
      this.boxOneText = 'News',
      required this.title,
      required this.newsTap,
      required this.noteTap,
      this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: [
            BaseImage(
              fit: MediaQuery.of(context).orientation == Orientation.landscape
                  ? BoxFit.contain
                  : BoxFit.fill,
              url: url,
              height: 180,
            ),
            categories?.isNotEmpty ?? false
                ? Positioned(
                    top: 10,
                    right: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? MediaQuery.of(context).size.width * 0.30
                        : 0,
                    child: SizedBox(
                      height: 30,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories?.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Bubble(
                                    title: categories![index].name.toString(),
                                    onTap: categories![index].name == 'Photo'
                                        ? newsTap
                                        : () {}),
                              )),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
