import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery_app/constants/screens.dart';
import 'package:my_gallery_app/data/local/cache_helper.dart';
import 'package:my_gallery_app/presentation/screens/shared/tablet_detector.dart';
import 'package:my_gallery_app/presentation/styles/colors.dart';
import 'package:my_gallery_app/presentation/widget/default_form_field.dart';
import 'package:my_gallery_app/presentation/widget/flat_button.dart';
import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../generated/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) async {
          if (state is LoginSuccessState) {
            await CacheHelper.sharedPreferences
                .setString('token', state.accountModel.token!.toString());
            await CacheHelper.sharedPreferences
                .setString('name', state.accountModel.user!.name!.toString());

            Navigator.pushNamedAndRemoveUntil(
                context, Screens.homeScreen, (route) => false);
          }
        },
        builder: (context, state) {
          final GlobalCubit globalCubit = context.read<GlobalCubit>();
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
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.38,
                          ),
                          Center(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(
                                    32.0,
                                  ),
                                ),
                                constraints: const BoxConstraints(
                                  maxWidth: 388.0,
                                  maxHeight: 440.0,
                                ),
                                child: Form(
                                  key: globalCubit.formKey,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 48.0,
                                      ),
                                      Text(
                                        'Log in'.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontFamily: 'SegoeUI',
                                          fontSize: 30.0,
                                          color: AppColor.textBlack,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 38.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              height: 60.0,
                                              constraints: const BoxConstraints(
                                                maxWidth: 340.0,
                                                maxHeight: 60.0,
                                              ),
                                              child: Center(
                                                child: defaultFormField(
                                                    controller: globalCubit
                                                        .emailController,
                                                    type: TextInputType
                                                        .emailAddress,
                                                    isPassword: false,
                                                    borderRadius: 35.0,
                                                    onSubmit: (_) {},
                                                    isHint: true,
                                                    hintText: 'User Name',
                                                    isValidate: true,
                                                    validate: (String data) {
                                                      return data.isEmpty
                                                          ? 'Please enter data'
                                                          : null;
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 37.0 -
                                            8, // Size between minus padding
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              height: 60.0,
                                              constraints: const BoxConstraints(
                                                maxWidth: 340.0,
                                                maxHeight: 60.0,
                                              ),
                                              child: Center(
                                                child: defaultFormField(
                                                    controller: globalCubit
                                                        .passwordController,
                                                    type: TextInputType
                                                        .visiblePassword,
                                                    isPassword: true,
                                                    borderRadius: 35.0,
                                                    onSubmit: (_) {
                                                      if (globalCubit
                                                          .formKey.currentState!
                                                          .validate()) {
                                                        globalCubit.userLogin(
                                                          email: globalCubit
                                                              .emailController.text,
                                                          password: globalCubit
                                                              .passwordController.text,
                                                          context: context,
                                                        );
                                                      }
                                                    },
                                                    isHint: true,
                                                    hintText: 'Password',
                                                    isValidate: true,
                                                    validate: (String data) {
                                                      return data.isEmpty
                                                          ? 'Please enter data'
                                                          : null;
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 37.0,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height: 46.0,
                                        constraints: const BoxConstraints(
                                          maxWidth: 340.0,
                                          maxHeight: 46.0,
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            if (globalCubit
                                                .formKey.currentState!
                                                .validate()) {
                                              globalCubit.userLogin(
                                                email: globalCubit
                                                    .emailController.text,
                                                password: globalCubit
                                                    .passwordController.text,
                                                context: context,
                                              );
                                            }
                                          },
                                          tOrI: true,
                                          iconWidgetState: false,
                                          color: AppColor.buttonColor,
                                          text: 'Submit'.toUpperCase(),
                                          radius: 10.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: TabletDetector.isTablet(MediaQuery.of(context))
                            ? -MediaQuery.of(context).size.height * 0.25
                            : -MediaQuery.of(context).size.height *
                                0.2, // at tablet mode 0.25, phone mode 0.2
                        left: TabletDetector.isTablet(MediaQuery.of(context))
                            ? -MediaQuery.of(context).size.width * 0.06
                            : -MediaQuery.of(context).size.width *
                                0.18, // at tablet mode 0.08, phone mode 0.18
                        child: Image.asset(
                          Assets.imagesComponent0,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: Center(
                          child: Text(
                            'My\nGallery'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'SegoeUI',
                                fontSize: 50.0,
                                color: AppColor.textBlack),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
