import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/res/colors.dart';
import '../../core/res/images.dart';

class NetworkImageLoader extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  NetworkImageLoader({ required this.image, this.height, this.width, this.fit , this.borderRadius = BorderRadius.zero});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: height,
        width: width,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: fit,
          height: height,
          width: width,
          placeholder: (context, url) => Center(
            child: Container(
                width: 35.0,
                height: 35.0,
                child: CircularProgressIndicator(strokeWidth: 1,color: AppColor.primary,)),
          ),
          errorWidget: (context, url, error) => Center(
              child: new Image.asset(
                Images.appLogo,
                width: 60.0,
                height: 60.0,
              )),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
