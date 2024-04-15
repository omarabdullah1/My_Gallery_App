import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery_app/constants/screens.dart';
import 'package:my_gallery_app/data/local/cache_helper.dart';
import 'package:my_gallery_app/presentation/screens/shared/tablet_detector.dart';
import 'package:my_gallery_app/presentation/styles/colors.dart';
import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../generated/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit()..getImages(),
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) async {
          if (state is UploadImagesSuccessState ||
              state is UploadImagesErrorState) {
            context.read<GlobalCubit>().getImages();
          }
        },
        builder: (context, state) {
          final GlobalCubit globalCubit = context.read<GlobalCubit>();
          if (globalCubit.imagesModel != null) {
            return Scaffold(
              body: LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Image.asset(
                          Assets.imagesBackground,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                            ),
                            Center(
                              child: Image.asset(
                                Assets.imagesComponent1,
                                width: 388.0,
                                height: 360.0,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(
                                  32.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Image.asset(
                            Assets.imagesComponent2,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Positioned(
                          top: TabletDetector.isTablet(MediaQuery.of(context))
                              ? MediaQuery.of(context).size.height * 0.025
                              : MediaQuery.of(context).size.height * 0.025,
                          right: TabletDetector.isTablet(MediaQuery.of(context))
                              ? MediaQuery.of(context).size.width * 0.025
                              : MediaQuery.of(context).size.width * 0.06,
                          child: const CircleAvatar(
                            radius: 36,
                            backgroundImage: AssetImage(Assets.imagesAvatar),
                          ),
                        ),
                        Positioned(
                          top: 35.0,
                          left: 27.0,
                          child: Text(
                            'Welcome\n${CacheHelper.sharedPreferences.getString('name').toString()}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'BalooThambi',
                              fontWeight: FontWeight.normal,
                              fontSize: 32.0,
                              color: AppColor.textBlack,
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 45.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        CacheHelper.sharedPreferences
                                            .clear()
                                            .then((value) {
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              Screens.loginScreen,
                                              (route) => false);
                                        });
                                      },
                                      child: Container(
                                        width: 142.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: AppColor.white,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14.5),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                Assets.imagesLogoutIcon,
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              const Text(
                                                'log out',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'BalooThambi',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20.0,
                                                  color: AppColor.textBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30.0,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        globalCubit.pickImage(false);
                                      },
                                      child: Container(
                                        width: 142.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: AppColor.white,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14.5),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                Assets.imagesUploadIcon,
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              const Text(
                                                'upload',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'BalooThambi',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20.0,
                                                  color: AppColor.textBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 35.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: constraints.maxHeight*0.71,
                                  child: GridView.count(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 15.0,
                                    shrinkWrap: true,
                                    children: List.generate(
                                        globalCubit.imagesModel!.data!.images!
                                            .length, (index) {
                                      return Container(
                                        height: 108.0,
                                        width: 108.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              globalCubit.imagesModel!.data!
                                                  .images![index]
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColor.black
                                                  .withOpacity(0.2),
                                              blurRadius: 4,
                                              offset: const Offset(
                                                  0, 8), // Shadow position
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
