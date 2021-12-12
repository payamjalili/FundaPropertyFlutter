import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:funda_property_flutter/constants.dart';
import 'package:funda_property_flutter/models/media.dart';

class PersistentHeaderImageGallery extends SliverPersistentHeaderDelegate {
  final List<Media> photos;
  final Widget titleWidget;

  PersistentHeaderImageGallery(
      {required this.photos, required this.titleWidget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: photos.length,
          itemBuilder: (BuildContext context, int index) {
            Media media = photos[index];
            return Image.network(
              media.mediaItems[2].url,
              fit:
                  BoxFit.cover, // _showGallery ? BoxFit.contain : BoxFit.cover,
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 95,
              padding: EdgeInsets.only(
                left: defaultPadding,
                top: defaultPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(defaultPadding),
                  topLeft: Radius.circular(defaultPadding),
                ),
              ),
              width: double.infinity,
              child: titleWidget),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 350;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
