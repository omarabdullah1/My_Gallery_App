import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gallery_app/presentation/styles/colors.dart';

class UploadIcon extends StatelessWidget {
  const UploadIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
            colors: [AppColor.orange, AppColor.yellow],
            radius: 15.0,
            center: AlignmentDirectional.bottomEnd,
            stops: [0.4, 1.0]),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: const Center(
        child: Icon(
          Icons.arrow_upward,
          color: AppColor.white,
        ),
      ),
    );
  }
}
