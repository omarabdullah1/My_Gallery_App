import 'package:flutter/material.dart';

import '../styles/colors.dart';

class MixedGradient extends StatelessWidget {
  const MixedGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: Stack(
          children: <Widget>[
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColor.purple,
                    AppColor.flatGray,
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.multiply,
              // Blend mode to mix the gradients
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColor.flatOrange,
                      AppColor.white,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
