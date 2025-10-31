
import 'package:flutter/material.dart';
import 'package:foodigo_delivery_man/utils/constraints.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/custom_image.dart';

class CircleImage extends StatelessWidget {
  const CircleImage(
      {super.key, this.image = '', this.size = 110.0, this.isFile});

  final String image;
  final double size;
  final bool? isFile;

  @override
  Widget build(BuildContext context) {
    final fileImage = isFile ?? false;
    return Container(
      height: Utils.vSize(size),
      width: Utils.vSize(size),
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor
        )
      ),
      child: ClipRRect(
        borderRadius: Utils.borderRadius(r: size / 2.0),
        child: CustomImage(
          path: image,
          fit: BoxFit.fill,
          isFile: fileImage,
          height: Utils.vSize(size),
          width: Utils.vSize(size),
        ),
      ),
    );
  }
}